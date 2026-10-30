package com.example.realestate.security;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.boot.DefaultApplicationArguments;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.example.realestate.model.aregister;
import com.example.realestate.repository.aregisterRepository;

@SuppressWarnings("null")
class AdminAccountBootstrapTests {

    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    private final PasswordService passwordService = new PasswordService(encoder);

    @Test
    void createsTheFirstAdminWithAHashedPassword() {
        aregisterRepository repository = org.mockito.Mockito.mock(aregisterRepository.class);
        when(repository.count()).thenReturn(0L);
        AdminAccountBootstrap bootstrap = new AdminAccountBootstrap(
                repository, passwordService, "first-admin", "admin@example.invalid", "Bootstrap1!");

        bootstrap.run(new DefaultApplicationArguments(new String[0]));

        ArgumentCaptor<aregister> savedAdmin = ArgumentCaptor.forClass(aregister.class);
        verify(repository).save(savedAdmin.capture());
        aregister admin = savedAdmin.getValue();
        assertNotNull(admin);
        assertEquals("first-admin", admin.getUsername());
        org.junit.jupiter.api.Assertions.assertTrue(
                encoder.matches("Bootstrap1!", admin.getPassword()));
    }

    @Test
    void doesNotCreateAnotherAdminWhenOneAlreadyExists() {
        aregisterRepository repository = org.mockito.Mockito.mock(aregisterRepository.class);
        when(repository.count()).thenReturn(1L);
        AdminAccountBootstrap bootstrap = new AdminAccountBootstrap(
                repository, passwordService, "later-admin", "later@example.invalid", "Bootstrap1!");

        bootstrap.run(new DefaultApplicationArguments(new String[0]));

        verify(repository, never()).save(any(aregister.class));
    }

    @Test
    void rejectsIncompleteBootstrapConfiguration() {
        aregisterRepository repository = org.mockito.Mockito.mock(aregisterRepository.class);
        AdminAccountBootstrap bootstrap = new AdminAccountBootstrap(
                repository, passwordService, "first-admin", "", "");

        assertThrows(IllegalStateException.class,
                () -> bootstrap.run(new DefaultApplicationArguments(new String[0])));
        verify(repository, never()).save(any(aregister.class));
    }

    @Test
    void rejectsWeakBootstrapPassword() {
        aregisterRepository repository = org.mockito.Mockito.mock(aregisterRepository.class);
        when(repository.count()).thenReturn(0L);
        AdminAccountBootstrap bootstrap = new AdminAccountBootstrap(
                repository, passwordService, "first-admin", "admin@example.invalid", "weakpassword");

        assertThrows(IllegalStateException.class,
                () -> bootstrap.run(new DefaultApplicationArguments(new String[0])));
        verify(repository, never()).save(any(aregister.class));
    }
}
