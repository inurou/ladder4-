package com.coderx.service.impl;

import com.coderx.dao.UserMapper;
import com.coderx.entity.User;
import com.coderx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * created by inu
 * date: 2018年9月22日11:44:09
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper mapper;
    public int insert(User userRecord){
        return mapper.insert(userRecord);
    }
    public ArrayList<User> selectService(User userRecord){
        return mapper.selectSelective(userRecord);
    }

    public User selectByUsername(String username) {
        return mapper.selectByUsername(username);
    }

    public User selectByPrimaryKey(Integer id) {
        return null;
    }
}
