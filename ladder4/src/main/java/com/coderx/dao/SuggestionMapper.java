package com.coderx.dao;

import com.coderx.entity.Suggestion;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface SuggestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Suggestion record);

    int insertSelective(Suggestion record);

    Suggestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Suggestion record);

    int updateByPrimaryKey(Suggestion record);

    ArrayList<Suggestion> selectSelective(Suggestion record);

    ArrayList<Suggestion> selectAll();
}