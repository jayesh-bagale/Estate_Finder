package com.example.realestate.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.example.realestate.model.Property;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.security.UploadStorageService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ExtendWith(MockitoExtension.class)
class PropertySubmissionControllerTests {

    @Mock
    private PropertyRepository propertyRepository;

    @Mock
    private UploadStorageService uploadStorageService;

    @Mock
    private RedirectAttributes redirectAttributes;

    @Mock
    private HttpServletRequest request;

    private PropertyController controller;

    @BeforeEach
    void setUp() {
        controller = new PropertyController(propertyRepository, uploadStorageService);
    }

    @Test
    void savesCompletePropertySubmissionAsPending() throws Exception {
        MockMultipartFile image = new MockMultipartFile(
                "image", "home.png", "image/png", new byte[] {1, 2, 3});
        when(uploadStorageService.storeImage(image)).thenReturn("/uploads/home.png");

        String view = controller.submitProperty(
                "  Gangapur Apartment  ", "  A spacious apartment  ", "  Asha Owner  ", 5_000_000,
                "Building 4, Road 2", "Gangapur Road", "422013", "nashik", "Apartment",
                2, 2, 1200, "Semi-furnished", "Lift, parking", "BUY", image, request, redirectAttributes);

        ArgumentCaptor<Property> propertyCaptor = ArgumentCaptor.forClass(Property.class);
        verify(propertyRepository).save(propertyCaptor.capture());
        Property savedProperty = propertyCaptor.getValue();

        assertEquals("redirect:/project", view);
        assertEquals("Gangapur Apartment", savedProperty.getTitle());
        assertEquals("Asha Owner", savedProperty.getOwnerName());
        assertEquals("Gangapur Road", savedProperty.getLocality());
        assertEquals("422013", savedProperty.getPostalCode());
        assertEquals("Apartment", savedProperty.getPropertyType());
        assertEquals(2, savedProperty.getBedrooms());
        assertEquals(2, savedProperty.getBathrooms());
        assertEquals(1200, savedProperty.getAreaSqFt());
        assertEquals("PENDING", savedProperty.getStatus());
        assertEquals(null, savedProperty.getSellerUserId());
        assertEquals("/uploads/home.png", savedProperty.getImagePath());
        org.mockito.Mockito.verify(redirectAttributes).addFlashAttribute(
                "successMessage", "Your property has been submitted for review. It will appear in listings after admin approval.");
    }

    @Test
    void associatesSubmissionWithSignedInSellerAndReturnsToProfile() throws Exception {
        MockMultipartFile image = new MockMultipartFile(
                "image", "home.png", "image/png", new byte[] {1, 2, 3});
        HttpSession session = org.mockito.Mockito.mock(HttpSession.class);
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("estatefinder.userId")).thenReturn(27L);
        when(uploadStorageService.storeImage(image)).thenReturn("/uploads/home.png");

        String view = controller.submitProperty(
                "Apartment", "Details", "Owner", 5_000_000,
                "Building 4, Road 2", "Gangapur Road", "422013", "nashik", "Apartment",
                2, 2, 1200, "Semi-furnished", "Lift, parking", "BUY", image, request, redirectAttributes);

        ArgumentCaptor<Property> propertyCaptor = ArgumentCaptor.forClass(Property.class);
        verify(propertyRepository).save(propertyCaptor.capture());
        assertEquals(27L, propertyCaptor.getValue().getSellerUserId());
        assertEquals("redirect:/profile", view);
    }

    @Test
    void rejectsInvalidPostalCodeBeforeStoringImage() throws Exception {
        MockMultipartFile image = new MockMultipartFile(
                "image", "home.png", "image/png", new byte[] {1, 2, 3});

        ResponseStatusException exception = assertThrows(ResponseStatusException.class,
                () -> controller.submitProperty(
                        "Apartment", "Details", "Owner", 5_000_000,
                        "Building 4, Road 2", "Gangapur Road", "42201", "nashik", "Apartment",
                        2, 2, 1200, "Semi-furnished", "Lift, parking", "BUY", image, request, redirectAttributes));

        assertEquals("Enter a valid 6-digit Indian PIN code.", exception.getReason());
        verify(uploadStorageService, never()).storeImage(any());
        verify(propertyRepository, never()).save(any(Property.class));
    }

    @Test
    void marksDeclinedSellerPropertySoItsOwnerCanSeeTheStatus() {
        Property property = new Property();
        property.setStatus("PENDING");
        when(propertyRepository.findById(12L)).thenReturn(java.util.Optional.of(property));

        String view = controller.declineProperty(12L);

        assertEquals("redirect:/property/sellproperty", view);
        assertEquals("DECLINED", property.getStatus());
        verify(propertyRepository).save(property);
    }
}
