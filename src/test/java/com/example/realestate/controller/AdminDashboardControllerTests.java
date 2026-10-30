package com.example.realestate.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Collections;
import java.util.Optional;

import com.example.realestate.model.Booking;
import com.example.realestate.model.Contact;
import com.example.realestate.model.Property;
import com.example.realestate.repository.BookingRepository;
import com.example.realestate.repository.ContactRepository;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.web.server.ResponseStatusException;

@ExtendWith(MockitoExtension.class)
@SuppressWarnings("null")
class AdminDashboardControllerTests {

    @Mock
    private PropertyRepository propertyRepository;

    @Mock
    private BookingRepository bookingRepository;

    @Mock
    private UserRepository userRepository;

    @Mock
    private ContactRepository contactRepository;

    private AdminDashboardController controller;

    @BeforeEach
    void setUp() {
        controller = new AdminDashboardController(
                propertyRepository, bookingRepository, userRepository, contactRepository);
    }

    @Test
    void persistsAcceptedBookingStatus() {
        Booking booking = new Booking();
        when(bookingRepository.findById(7L)).thenReturn(Optional.of(booking));

        ResponseEntity<Void> response = controller.updateBookingStatus(7L, "accepted");

        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals("accepted", booking.getStatus());
        verify(bookingRepository).save(booking);
    }

    @Test
    void rejectsUnknownBookingStatuses() {
        ResponseEntity<Void> response = controller.updateBookingStatus(7L, "anything");

        assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
        verify(bookingRepository, never()).findById(7L);
    }

    @Test
    void returnsNotFoundForMissingBooking() {
        when(bookingRepository.findById(7L)).thenReturn(Optional.empty());

        ResponseEntity<Void> response = controller.updateBookingStatus(7L, "declined");

        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        verify(bookingRepository, never()).save(org.mockito.ArgumentMatchers.any(Booking.class));
    }

    @Test
    void dashboardIncludesPendingListingCount() {
        when(propertyRepository.count()).thenReturn(12L);
        when(propertyRepository.countByStatus("PENDING")).thenReturn(3L);
        when(bookingRepository.count()).thenReturn(5L);
        when(userRepository.count()).thenReturn(8L);
        when(bookingRepository.findTop5ByOrderByBookingDateDesc()).thenReturn(Collections.emptyList());
        ExtendedModelMap model = new ExtendedModelMap();

        String view = controller.showDashboard(model);

        assertEquals("adminDashboard", view);
        assertEquals(12L, model.get("totalProperties"));
        assertEquals(3L, model.get("pendingProperties"));
        assertEquals(5L, model.get("totalBookings"));
        assertEquals(8L, model.get("totalUsers"));
    }

    @Test
    void deletesPropertyAndReturnsToAvailableProperties() {
        Property property = new Property();
        when(propertyRepository.findById(12L)).thenReturn(Optional.of(property));

        String view = controller.deleteProperty(12L);

        assertEquals("redirect:/admin/properties", view);
        verify(propertyRepository).delete(property);
    }

    @Test
    void deletingMissingPropertyReturnsNotFound() {
        when(propertyRepository.findById(12L)).thenReturn(Optional.empty());

        try {
            controller.deleteProperty(12L);
        } catch (ResponseStatusException exception) {
            assertEquals(HttpStatus.NOT_FOUND, exception.getStatus());
            verify(propertyRepository, never()).delete(org.mockito.ArgumentMatchers.any(Property.class));
            return;
        }
        throw new AssertionError("Expected a not-found response for a missing property");
    }

    @Test
    void deletesContactMessageAndReturnsToMessageList() {
        Contact contact = new Contact("Visitor", "visitor@example.com", "1234567890", "Question", "Hello");
        when(contactRepository.findById(21L)).thenReturn(Optional.of(contact));

        String view = controller.deleteContact(21L);

        assertEquals("redirect:/admin/contact", view);
        verify(contactRepository).delete(contact);
    }

    @Test
    void deletingMissingContactMessageReturnsNotFound() {
        when(contactRepository.findById(21L)).thenReturn(Optional.empty());

        try {
            controller.deleteContact(21L);
        } catch (ResponseStatusException exception) {
            assertEquals(HttpStatus.NOT_FOUND, exception.getStatus());
            verify(contactRepository, never()).delete(org.mockito.ArgumentMatchers.any(Contact.class));
            return;
        }
        throw new AssertionError("Expected a not-found response for a missing contact message");
    }
}
