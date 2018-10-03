package com.coderx.service.impl;

import com.coderx.dao.SetdateMapper;
import com.coderx.entity.Setdate;
import com.coderx.service.SetdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SetdateServiceImpl implements SetdateService {

    @Autowired
    private SetdateMapper mapper;

    public int insert(Setdate record) {
        return mapper.insert(record);
    }

    public int deleteAll() {
        return mapper.deleteAll();
    }

    public Setdate selectAll() {
        return mapper.selectAll();
    }
}
