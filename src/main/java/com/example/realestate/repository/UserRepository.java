package com.example.realestate.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.realestate.model.User;
import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

	User findByEmailIgnoreCase(String email);

	List<User> findAllByEmailIgnoreCase(String email);

	User findByUsernameIgnoreCase(String username);

	List<User> findAllByUsernameIgnoreCase(String username);

	boolean existsByEmailIgnoreCase(String email);

	boolean existsByUsernameIgnoreCase(String username);
}
