package com.coderx.service.impl;

import com.coderx.dao.OrdersetMapper;
import com.coderx.entity.Orderset;
import com.coderx.service.OrdersetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class OrdersetServiceImpl implements OrdersetService {

    @Autowired
    private OrdersetMapper ordersetMapper;

    public int insert(Orderset record) {
        return ordersetMapper.insert(record);
    }

    public ArrayList<Orderset> selectByName(String name) {
        return ordersetMapper.selectByName(name);
    }

    public int deleteByPrimaryKey(Integer id) {
        return ordersetMapper.deleteByPrimaryKey(id);
    }

    public ArrayList<Orderset> selectAll() {
        return ordersetMapper.selectAll();
    }




}
