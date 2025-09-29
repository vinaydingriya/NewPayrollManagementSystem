package com.example.demo.services;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService {

	private final UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

       public void saveMyUser(User user) {
	       BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	       // Encode only if password is not already encoded (simple heuristic)
	       if (user.getPassword() != null && !user.getPassword().startsWith("$2a$") && !user.getPassword().startsWith("$2b$") ) {
		       user.setPassword(encoder.encode(user.getPassword()));
	       }
	       userRepository.save(user);
       }

	public List<User> showAllUsers() {
		List<User> allUser = (List<User>) this.userRepository.findAll();
		return allUser;
	}

	public void deleteMyUser(int id) {
		userRepository.deleteById(id);
	}

	public User editUser(String username) {
		return userRepository.findByUsername(username);

	}

	// Authenticate using BCrypt against stored password
	public User findByUsernameAndPassword(String username, String password) {
		User user = userRepository.findByUsername(username);
		if (user == null) return null;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if (password != null && encoder.matches(password, user.getPassword())) {
			return user;
		}
		return null;
	}

	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	public User findById(Integer id) {
		return userRepository.findById(id).orElse(null);
	}
}
