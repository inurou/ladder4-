package com.coderx.dao;

import com.coderx.entity.Menu;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
@Repository
public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    ArrayList<Menu> selectSelective(Menu record);

    ArrayList<Menu> selectAll();

    int deleteAll();

    Menu selectByName(String name);
}