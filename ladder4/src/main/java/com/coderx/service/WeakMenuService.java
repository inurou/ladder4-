package com.coderx.service;

import com.coderx.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
@RequestMapping
public class WeakMenuService {

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "weak",method = RequestMethod.GET)
    public String weak(HttpServletRequest request, HttpServletResponse response){
        ArrayList<Menu> arrayList = menuService.selectAll();
        request.setAttribute("productList",arrayList);
        return "imglist2";
    }
}
