package com.coderx.service;

import com.coderx.entity.Orderset;

import java.util.ArrayList;

public interface OrdersetService {

    int insert(Orderset record);


    ArrayList<Orderset> selectByName(String name);

    int deleteByPrimaryKey(Integer id);

    ArrayList<Orderset> selectAll();


}
