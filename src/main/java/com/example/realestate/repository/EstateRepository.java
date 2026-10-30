package com.example.realestate.repository;

import com.example.realestate.model.Estate;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EstateRepository extends JpaRepository<Estate, Long> {
}
