package com.example.realestate.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.example.realestate.model.Booking;
import com.example.realestate.model.Property;
import com.example.realestate.repository.BookingRepository;
import com.example.realestate.repository.PropertyRepository;
import java.util.Optional;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

@ExtendWith(MockitoExtension.class)
@SuppressWarnings("null")
class BookingControllerTests {

    @Mock
    private BookingRepository bookingRepository;

    @Mock
    private PropertyRepository propertyRepository;

    private BookingController controller;

    @BeforeEach
    void setUp() {
        controller = new BookingController(bookingRepository, propertyRepository);
    }

    @Test
    void publicSubmissionAlwaysCreatesPendingBooking() {
        Booking submittedBooking = new Booking();
        submittedBooking.setId(42L);
        submittedBooking.setStatus("accepted");

        String view = controller.saveBooking(submittedBooking, new ExtendedModelMap());

        assertEquals("redirect:/project", view);
        assertNull(submittedBooking.getId());
        assertEquals("pending", submittedBooking.getStatus());
        verify(bookingRepository).save(submittedBooking);
    }

    @Test
    void requestFormPrefillsSelectedPropertyDetails() {
        Model model = new ExtendedModelMap();

        String view = controller.showForm(null, "2 BHK Apartment Demo 01", "2 BHK Apartment",
                "Govind Nagar, Nashik", "EstateFinders demo listing", model);

        assertEquals("booking", view);
        Booking booking = (Booking) model.getAttribute("booking");
        assertEquals("2 BHK Apartment Demo 01", booking.getPropertyName());
        assertEquals("2 BHK Apartment", booking.getPropertyType());
        assertEquals("Govind Nagar, Nashik", booking.getLocationName());
        assertEquals("EstateFinders demo listing", booking.getBuilderName());
    }
    @Test
    void persistedPropertyRequestUsesAcceptedPropertyAndIgnoresForgedFields() {
        Property property = acceptedProperty();
        when(propertyRepository.findById(7L)).thenReturn(Optional.of(property));
        Booking booking = new Booking();
        booking.setPropertyId(7L);
        booking.setPropertyName("Forged title");
        booking.setPropertyType("Forged type");
        booking.setLocationName("Forged location");
        booking.setBuilderName("Forged builder");

        controller.saveBooking(booking, new ExtendedModelMap());

        assertEquals(7L, booking.getPropertyId());
        assertEquals("Verified Home", booking.getPropertyName());
        assertEquals("RENT", booking.getPropertyType());
        assertEquals("12 Example Road, Nashik", booking.getLocationName());
        assertEquals("EstateFinders listing", booking.getBuilderName());
        assertEquals("pending", booking.getStatus());
        verify(bookingRepository).save(booking);
    }

    @Test
    void persistedBookingFormPrefillsFromAcceptedProperty() {
        when(propertyRepository.findById(7L)).thenReturn(Optional.of(acceptedProperty()));
        Model model = new ExtendedModelMap();

        assertEquals("booking", controller.showForm(7L, "Forged", "Forged", "Forged", "Forged", model));
        Booking booking = (Booking) model.getAttribute("booking");
        assertEquals(7L, booking.getPropertyId());
        assertEquals("Verified Home", booking.getPropertyName());
        assertEquals("12 Example Road, Nashik", booking.getLocationName());
    }

    @Test
    void persistedBookingRejectsUnacceptedProperty() {
        Property property = acceptedProperty();
        property.setStatus("PENDING");
        when(propertyRepository.findById(7L)).thenReturn(Optional.of(property));

        ResponseStatusException exception = assertThrows(ResponseStatusException.class,
                () -> controller.showForm(7L, null, null, null, null, new ExtendedModelMap()));

        assertEquals(HttpStatus.NOT_FOUND, exception.getStatus());
    }

    @Test
    void persistedBookingSubmissionRejectsPropertyNoLongerAccepted() {
        Property property = acceptedProperty();
        property.setStatus("PENDING");
        when(propertyRepository.findById(7L)).thenReturn(Optional.of(property));
        Booking booking = new Booking();
        booking.setPropertyId(7L);

        ResponseStatusException exception = assertThrows(ResponseStatusException.class,
                () -> controller.saveBooking(booking, new ExtendedModelMap()));

        assertEquals(HttpStatus.NOT_FOUND, exception.getStatus());
    }

    @Test
    void demoTextBookingDoesNotRequirePropertyLookup() {
        Booking booking = new Booking();
        booking.setPropertyName("Demo home");
        booking.setLocationName("Demo locality");

        controller.saveBooking(booking, new ExtendedModelMap());

        assertNull(booking.getPropertyId());
        assertEquals("Demo home", booking.getPropertyName());
        assertEquals("Demo locality", booking.getLocationName());
        verify(bookingRepository).save(booking);
    }

    private Property acceptedProperty() {
        Property property = new Property();
        property.setId(7L);
        property.setTitle("Verified Home");
        property.setListingType("RENT");
        property.setAddress("12 Example Road, Nashik");
        property.setStatus("ACCEPTED");
        return property;
    }

}
