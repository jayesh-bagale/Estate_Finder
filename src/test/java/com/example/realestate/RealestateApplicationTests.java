package com.example.realestate;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.example.realestate.repository.BookingRepository;
import com.example.realestate.repository.ContactRepository;
import com.example.realestate.repository.EstateRepository;
import com.example.realestate.repository.PropertyRepository;
import com.example.realestate.repository.UserRepository;
import com.example.realestate.repository.aregisterRepository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc
class RealestateApplicationTests {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private ContactRepository contactRepository;

    @Autowired
    private EstateRepository estateRepository;

    @Autowired
    private PropertyRepository propertyRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private aregisterRepository adminRepository;

	@Test
	void contextLoads() {
	}

    @Test
    void repositoriesCanReadTheirExistingTables() {
        assertDoesNotThrow(() -> bookingRepository.count());
        assertDoesNotThrow(() -> contactRepository.count());
        assertDoesNotThrow(() -> estateRepository.count());
        assertDoesNotThrow(() -> propertyRepository.count());
        assertDoesNotThrow(() -> userRepository.count());
        assertDoesNotThrow(() -> adminRepository.count());
    }

    @Test
    void administratorPagesRedirectUnauthenticatedRequests() throws Exception {
        mockMvc.perform(get("/admindashboard"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/adminlogin"));
        mockMvc.perform(get("/admin/users"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/adminlogin"));
        mockMvc.perform(get("/estate/manage"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/adminlogin"));
        mockMvc.perform(post("/estate/delete/1"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/adminlogin"));
        mockMvc.perform(post("/admin/bookings/1/status").param("status", "accepted"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/adminlogin"));
    }

    @Test
    void unknownRoutesUseTheCustomNotFoundPage() throws Exception {
        mockMvc.perform(get("/definitely-not-a-real-estate-route"))
                .andExpect(status().isNotFound());
    }
}
