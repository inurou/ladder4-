package com.coderx.dao;

import com.coderx.entity.Menuset;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
@Repository
public interface MenusetMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menuset record);

    int insertSelective(Menuset record);

    Menuset selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menuset record);

    int updateByPrimaryKey(Menuset record);

    ArrayList<Menuset> selectAll();
}