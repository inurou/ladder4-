package com.coderx.service.impl;

import com.coderx.dao.SuggestionMapper;
import com.coderx.dao.UserMapper;
import com.coderx.entity.Suggestion;
import com.coderx.service.SuggestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class SuggestionServiceImpl implements SuggestionService {
    @Autowired
    private SuggestionMapper mapper;
    public int insert(Suggestion suggestion) {
        return mapper.insert(suggestion);
    }

    public ArrayList<Suggestion> selectSelective(Suggestion record) {
        return mapper.selectSelective(record);
    }

    public ArrayList<Suggestion> selectAll() {
        return mapper.selectAll();
    }
}
