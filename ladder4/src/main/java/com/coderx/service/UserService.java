package com.coderx.service;

import com.coderx.entity.User;

import java.util.ArrayList;

public interface UserService {
    int insert(User userRecord);

    //User selectByPrimaryKey(Integer id);

    ArrayList<User> selectService(User userRecord);

    User selectByUsername(String username);
}
