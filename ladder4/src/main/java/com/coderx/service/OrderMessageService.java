package com.coderx.service;

import com.coderx.dao.OrdersetMapper;
import com.coderx.entity.Orderset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping
public class OrderMessageService {

    @Autowired
    private OrdersetMapper ordersetMapper;

    @RequestMapping(value = "orderMessage",method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<Orderset> OrderMessage(HttpSession session){
        /**
         * 得到当前登录用户的姓名，根据姓名查看消费信息
         */
        String name = (String) session.getAttribute("userinfo");

        ArrayList<Orderset> ordersetArrayList =  new ArrayList<Orderset>();
        if(name != null){
            ordersetArrayList = ordersetMapper.selectByName(name);
        }
        return ordersetArrayList;
    }

    @RequestMapping(value = "deleteOrderMessage",method = RequestMethod.POST)
    @ResponseBody
    public String deleteOrderMessage(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        try {
            ordersetMapper.deleteByPrimaryKey(Integer.parseInt(id));
        } catch (NumberFormatException e) {
            throw new Exception("delete orderset failed");
        }
        return "ok";
    }

    @RequestMapping(value = "checkOrderMessage",method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<Orderset> checkOrderMessage() throws Exception {
        ArrayList<Orderset> arrayList = new ArrayList<Orderset>();
        try {
            arrayList = ordersetMapper.selectAll();
        } catch (Exception e) {
            throw new Exception("select orderset failed");
        }
        return arrayList;
    }

    @RequestMapping(value = "okOrderMessage",method = RequestMethod.POST)
    @ResponseBody
    public Orderset okOrderMessage(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Orderset orderset = null;
        try {
            orderset = ordersetMapper.selectByPrimaryKey(Integer.parseInt(id));   //得到该条数据
            orderset.setStatus(1);               //更新状态
            ordersetMapper.updateByPrimaryKey(orderset);    //更新数据
        } catch (NumberFormatException e) {
            throw new Exception("operate failed"+e.getMessage());
        }
        model.addAttribute("status",Integer.parseInt(id));
        return orderset;
    }
}
