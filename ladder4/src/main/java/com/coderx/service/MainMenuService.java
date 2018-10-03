package com.coderx.service;

import com.coderx.entity.Menu;
import com.coderx.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping
public class MainMenuService {

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "main",method = RequestMethod.GET)
    public String goMain(){
        return "main";
    }

    @RequestMapping(value = "today",method = RequestMethod.GET)
    public String today(HttpServletRequest request, HttpServletResponse response){
        ArrayList<Menu> arrayList = menuService.selectAll();
        request.setAttribute("productList",arrayList);
        return "imglist1";
    }
}
