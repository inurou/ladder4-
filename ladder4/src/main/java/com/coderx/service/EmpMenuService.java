package com.coderx.service;

import com.coderx.dao.SuggestionMapper;
import com.coderx.entity.Suggestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
@RequestMapping
public class EmpMenuService {

    @Autowired
    private SuggestionMapper suggestionMapper;

    @RequestMapping(value = "tab2",method = RequestMethod.GET)
    public String empSuggestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ArrayList<Suggestion> arrayList = getSuggestionList();
        request.setAttribute("suggestionList",arrayList);
        return "tab2";
    }

    @Transactional
    public ArrayList<Suggestion> getSuggestionList()throws Exception{
        ArrayList<Suggestion> arrayList;
        try {
            arrayList  = suggestionMapper.selectAll();

        } catch (Exception e) {
            throw new Exception("select failed");
        }
        return arrayList;
    }

}
