package com.usermanagement.dao;

import com.usermanagement.entity.UserEntity;
import java.util.List;

public interface UserRepository {
    void saveUser(UserEntity user);
    List<UserEntity> fetchAllUsers();
    UserEntity getUserById(int id);
    void updateUser(UserEntity user);
    void deleteUser(int id);
}
