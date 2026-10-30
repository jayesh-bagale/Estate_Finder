package com.example.realestate.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrlPattern;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.example.realestate.model.Contact;
import com.example.realestate.repository.ContactRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

@ExtendWith(MockitoExtension.class)
class ContactControllerTests {

    @Mock
    private ContactRepository contactRepository;

    @Test
    void submitsAndPersistsEnquiryWhenPhoneIsOmitted() throws Exception {
        MockMvc mockMvc = MockMvcBuilders.standaloneSetup(new ContactController(contactRepository)).build();

        mockMvc.perform(post("/contact")
                        .param("name", "Demo User")
                        .param("email", "demo@example.com")
                        .param("subject", "Buy")
                        .param("message", "I am interested in a property"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrlPattern("/project?successMessage=*"));

        ArgumentCaptor<Contact> contactCaptor = ArgumentCaptor.forClass(Contact.class);
        verify(contactRepository).save(contactCaptor.capture());
        Contact savedContact = contactCaptor.getValue();
        assertEquals("Demo User", savedContact.getName());
        assertEquals("demo@example.com", savedContact.getEmail());
        assertNull(savedContact.getPhone());
        assertEquals("Buy", savedContact.getSubject());
        assertEquals("I am interested in a property", savedContact.getMessage());
    }
}
