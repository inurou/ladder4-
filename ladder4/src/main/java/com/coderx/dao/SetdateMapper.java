package com.coderx.dao;

import com.coderx.entity.Setdate;

public interface SetdateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Setdate record);

    int insertSelective(Setdate record);

    Setdate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Setdate record);

    int updateByPrimaryKey(Setdate record);

    int deleteAll();

    Setdate selectAll();
}