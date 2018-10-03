package com.coderx.service;

import com.coderx.entity.Setdate;

public interface SetdateService {

    int insert(Setdate record);

    int deleteAll();

    Setdate selectAll();
}
