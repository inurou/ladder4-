package com.coderx.dao;

import com.coderx.entity.Orderset;

import java.util.ArrayList;

public interface OrdersetMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Orderset record);

    int insertSelective(Orderset record);

    Orderset selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orderset record);

    int updateByPrimaryKey(Orderset record);

    ArrayList<Orderset> selectAll();

    ArrayList<Orderset> selectByName(String name);


}