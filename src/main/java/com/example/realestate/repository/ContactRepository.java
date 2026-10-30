package com.example.realestate.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.realestate.model.Contact;

public interface ContactRepository extends JpaRepository<Contact, Long> {
}
