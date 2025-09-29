package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	public User findByUsernameAndPassword(String username, String password);

	public User findByUsername(String username);

	public User findByEmail(String email);

	// find user by email excluding a given id (useful for update checks)
	public User findByEmailAndIdNot(String email, Integer id);

}
