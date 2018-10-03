package com.coderx.service;

import com.coderx.entity.Menu;

import java.util.ArrayList;

public interface MenuService {
    ArrayList<Menu> selectService(Menu record);

    ArrayList<Menu> selectAll();

    int deleteAll();

    int insert(Menu record);

    Menu selectByPrimaryKey(Integer id);

    Menu selectByName(String name);

}
