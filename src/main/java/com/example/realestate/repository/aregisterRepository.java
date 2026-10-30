package com.example.realestate.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.realestate.model.aregister;

public interface aregisterRepository extends JpaRepository<aregister, Long> {
    aregister findByUsername(String username);
    boolean existsByUsernameIgnoreCase(String username);
    boolean existsByEmailIgnoreCase(String email);
}
