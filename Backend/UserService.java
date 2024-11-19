package com.usermanagement.service;

import com.usermanagement.dao.UserRepository;
import com.usermanagement.dao.UserRepositoryImpl;
import com.usermanagement.entity.UserEntity;

import java.util.List;

public class UserService {

    private final UserRepository userRepository;

    // Constructor
    public UserService() {
        this.userRepository = new UserRepositoryImpl();
    }

    // Create a new user
    public void createUser(UserEntity user) {
        if (user != null) {
            userRepository.saveUser(user);
        } else {
            throw new IllegalArgumentException("User cannot be null.");
        }
    }

    // Update an existing user
    public void updateUser(UserEntity user) {
        if (user != null) {
            userRepository.updateUser(user);
        } else {
            throw new IllegalArgumentException("User cannot be null.");
        }
    }

    // Delete a user by ID
    public void deleteUser(int id) {
        if (id > 0) {
            userRepository.deleteUser(id);
        } else {
            throw new IllegalArgumentException("Invalid user ID.");
        }
    }

    // Fetch all users
    public List<UserEntity> fetchAllUsers() {
        return userRepository.fetchAllUsers();
    }

    // Fetch a user by ID
    public UserEntity fetchUserById(int id) {
        if (id > 0) {
            return userRepository.getUserById(id);
        } else {
            throw new IllegalArgumentException("Invalid user ID.");
        }
    }
}
