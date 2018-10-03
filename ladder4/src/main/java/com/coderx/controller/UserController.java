package com.coderx.controller;

import com.coderx.entity.User;
import com.coderx.service.UserService;
import com.coderx.util.CharsetUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping
public class UserController {
    private User user;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String goLogin(){
        return "login";
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam(name = "name") String name, @RequestParam(name = "password")String password, Model model, HttpSession session){
        String login = verifyLogin(name,password);

        User user1 = userService.selectByUsername(name);

        if(login.equals("0")){
            model.addAttribute("login",0);
            session.setAttribute("userinfo",user1.getUsername());

        }else if(login.equals("1")){
            model.addAttribute("login",1);
            session.setAttribute("userinfo",user1.getUsername());
        }else if(login.equals("2")){
            model.addAttribute("login",2);
        }
        return "login";
    }

    public String verifyLogin(String userName,String password){
        User user = userService.selectByUsername(userName);
        //账户密码验证
        //return null != user && password.equals(user.getPassword());
        if(null != user && password.equals(user.getPassword())){
            String str = "食堂";
            if(user.getDept().equals(str)){
                return "0";
            }else{
                return "1";
            }
        }else{
            return "2";
        }
    }



    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register(){
        return "register";
    }


    @Transactional
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String addUser(@RequestParam(name = "user_name") String userName,@RequestParam(name = "user_email") String email,@RequestParam(name = "user_password") String password,
                          @RequestParam(name = "select_sex") String sex,@RequestParam(name = "select_dept") String dept,@RequestParam(name = "user_phone") String userPhone,Model model)
            throws  Exception{
        user = new User();
        user.setUsername(userName);
        user.setEmail(email);
        user.setPassword(password);
        user.setSex(sex);
        user.setDept(dept);
        user.setPhonenum(userPhone);

        List<User> list = userService.selectService(user);

        if(list.size() == 0){
            if(userService.insert(user) == 1){
                model.addAttribute("status",0);
            }else{
                model.addAttribute("status",1);
                throw new RuntimeException("register failed");
            }
        }else{
            model.addAttribute("status",2);
        }
        return "register";
    }

    @RequestMapping(value = "/response",method = RequestMethod.GET)
    @ResponseBody
    public User goResponse(){
        return user;
    }


    @RequestMapping(value = "/operate",method = RequestMethod.POST)
    @ResponseBody
    public String operate(HttpServletRequest request, HttpServletResponse response,Model model) throws IOException {

        //Map<String,Object> resultMap = new HashMap<String, Object>();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String username = request.getParameter("username");

        User user1 = new User();
        user1.setUsername(username);

        List<User> list = userService.selectService(user1);
        if(list.size() != 0){
            return "yes";
        }else{
            return "no";
        }
    }




}
