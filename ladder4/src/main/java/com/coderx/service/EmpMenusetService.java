package com.coderx.service;

import com.coderx.dao.MenusetMapper;
import com.coderx.entity.Menuset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
@RequestMapping
public class EmpMenusetService {

    @Autowired
    private MenusetMapper menusetMapper;

    @RequestMapping(value = "menuset",method = RequestMethod.GET)
    public String menuSet(HttpServletRequest request) throws Exception {
        ArrayList<Menuset> arrayList = selectMenuset();
        request.setAttribute("productSetList",arrayList);
        return "img3";
    }

    @Transactional
    public ArrayList<Menuset> selectMenuset() throws Exception{
        try {
            ArrayList<Menuset> arrayList = menusetMapper.selectAll();
            return arrayList;
        } catch (Exception e) {
            throw new Exception("select menuset failed");
        }
    }
}
