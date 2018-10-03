package com.coderx.service;

import com.coderx.dao.MenuMapper;
import com.coderx.dao.OrdersetMapper;
import com.coderx.dao.SetdateMapper;
import com.coderx.dao.UserMapper;
import com.coderx.entity.*;
import com.coderx.util.OrderMessageUtil;
import com.coderx.util.ResultJsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.rmi.runtime.Log;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping
public class OrderMenuService {

    private Orderset orderset = new Orderset();

    private StringBuilder stringBuilder = new StringBuilder();

    private Double price = 0d;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private MenuMapper mapper;

    @Autowired
    private SetdateMapper mapper1;

    @Autowired
    private OrdersetMapper ordersetMapper;

    @RequestMapping(value = "order",method = RequestMethod.GET)
    public String order(HttpServletRequest request, HttpServletResponse response, Model model){

        Setdate setdate = mapper1.selectAll();
        model.addAttribute("setdate",setdate.getOrderdate());
        return "img";
    }
    @RequestMapping(value = "menushow",method = RequestMethod.POST)
    @ResponseBody
    public List<Menu> menuShow(){
        List<Menu> arrayList = mapper.selectAll();
        return  arrayList;
    }

    @RequestMapping(value = "addMenu",method = RequestMethod.POST)
    @ResponseBody
    public Menu addMenu(HttpServletRequest request){
        String id = request.getParameter("id");
        Menu menu = mapper.selectByPrimaryKey(Integer.parseInt(id));

        return menu;
    }

    @RequestMapping(value = "setdate",method = RequestMethod.POST)
    @ResponseBody
    public String orderDate(HttpServletRequest request) throws Exception {
        String date = request.getParameter("date");
        Setdate setdate = new Setdate();
        setdate.setOrderdate(date);

        /**
         * 先删除setdate表中所有数据
         */
        deleteSetdate();
        /**
         * 向setdate表中插入新值
         */
        insertSetdate(setdate);
        return "ok";
    }


    @Transactional
    public boolean insertSetdate(Setdate setdate) throws Exception{
        try {
            if(mapper1.insert(setdate) == 1){
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            throw new Exception("insert setdate failed");
        }
    }

    @Transactional
    public boolean deleteSetdate() throws Exception{
        try {
            if(mapper1.deleteAll()==1){
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            throw new Exception("delete setdate failed");
        }
    }


    @RequestMapping(value = "menuAddCount",method = RequestMethod.POST)
    @ResponseBody
    public String menuAddCount(HttpServletRequest request, HttpSession session) throws Exception {
        String id = request.getParameter("id"); //menu表的id
        String num = request.getParameter("num"); //菜品的数量
        /**
         * 从menu中查询菜品信息
         */
        Menu menu = mapper.selectByPrimaryKey(Integer.parseInt(id)+1);  //菜的信息

        String name = (String) session.getAttribute("userinfo");

        User user = null;

        if(name != null){
            user = userMapper.selectByUsername(name);  //订餐人信息
        }else{
            throw new Exception("订餐人信息不确定");
        }
        stringBuilder.append(menu.getName()+"*"+num + " ");

        orderset.setOrdername(user.getUsername());  //订餐人姓名
        orderset.setDept(user.getDept());   //订餐人部门
        orderset.setOrdermessage(stringBuilder.toString());   //订餐信息

        //System.out.println(orderset.getOrdermessage());

        return "ok";
    }

    @RequestMapping(value = "menuSubCount",method = RequestMethod.POST)
    @ResponseBody
    public String menuSubCount(HttpServletRequest request){
        String id = request.getParameter("id"); //menu表的id
        String num = request.getParameter("num"); //菜品的数量

        /**
         * 从menu中查询菜品信息
         */
        Menu menu = mapper.selectByPrimaryKey(Integer.parseInt(id)+1);  //菜的信息
        stringBuilder.append(menu.getName()+"*"+num + " ");

        orderset.setOrdermessage(stringBuilder.toString());


        return "ok";
    }

    @RequestMapping(value = "orderSubmit",method = RequestMethod.POST)
    @ResponseBody
    public String OrderSubmit(HttpServletRequest request) throws Exception {

        String date = request.getParameter("date");
        orderset.setOrdertime(date);  //订餐日期

        ArrayList<Order> arrayList = new OrderMessageUtil().OrderMessage(orderset.getOrdermessage());
        StringBuilder sb = new StringBuilder();
        for(int i = 0;i < arrayList.size();i++){
            sb.append(arrayList.get(i).getName()+"*"+arrayList.get(i).getNum() + " ");
            Menu menu = mapper.selectByName(arrayList.get(i).getName());
            price += (menu.getNowprice())*(arrayList.get(i).getNum());
            //price += new OrderMessageUtil().OrderMenuName(arrayList.get(i).getName())*arrayList.get(i).getNum();
        }
        orderset.setOrdermessage(sb.toString());  //订餐信息
        orderset.setOrdermoney(price);    //订餐价格

        orderset.setStatus(0);  //订单状态

        UUID uuid = UUID.randomUUID();
        orderset.setOrderid(uuid.toString()); //订餐编号
        try {
            ordersetMapper.insert(orderset);
        } catch (Exception e) {
            throw new Exception("insert orderset menu failed");
        }

        return "ok";
    }

}
