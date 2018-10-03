package com.coderx.service;

import com.coderx.entity.Suggestion;

import java.util.ArrayList;

public interface SuggestionService {

     int insert(Suggestion record);

     ArrayList<Suggestion> selectSelective(Suggestion record);

     ArrayList<Suggestion> selectAll();
}
