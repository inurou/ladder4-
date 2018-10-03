package com.coderx.service.impl;

import com.coderx.dao.MenusetMapper;
import com.coderx.entity.Menuset;
import com.coderx.service.MenusetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public class MenusetServiceImpl implements MenusetService {

    @Autowired
    private MenusetMapper menusetMapper;

    public ArrayList<Menuset> selectAll() {
        return menusetMapper.selectAll();
    }

    public Menuset selectByPrimaryKey(Integer id) {
        return menusetMapper.selectByPrimaryKey(id);
    }
}
