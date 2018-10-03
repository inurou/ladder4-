package com.coderx.service.impl;

import com.coderx.dao.MenuMapper;
import com.coderx.entity.Menu;
import com.coderx.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;
    @Transactional
    public ArrayList<Menu> selectService(Menu record) {
        return menuMapper.selectSelective(record);
    }

    public ArrayList<Menu> selectAll() {
        return menuMapper.selectAll();
    }

    public int deleteAll() {
        return menuMapper.deleteAll();
    }

    public int insert(Menu record) {
        return menuMapper.insert(record);
    }

    public Menu selectByPrimaryKey(Integer id) {
        return menuMapper.selectByPrimaryKey(id);
    }

    public Menu selectByName(String name) {
        return menuMapper.selectByName(name);
    }
}
