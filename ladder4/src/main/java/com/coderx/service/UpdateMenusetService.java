package com.coderx.service;

import com.coderx.dao.MenuMapper;
import com.coderx.dao.MenusetMapper;
import com.coderx.entity.Menu;
import com.coderx.entity.Menuset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
@RequestMapping
public class UpdateMenusetService {

    @Autowired
    private MenusetMapper menusetMapper;

    @Autowired
    private MenuMapper menuMapper;

    @RequestMapping(value = "updateset",method = RequestMethod.POST)
    public String updateSet(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        ArrayList<Menu> arrayListSet = new ArrayList<Menu>();

        String[] str = request.getParameterValues("menuId");

        for(int i = 0;i < str.length;i++){
            //System.out.println(Integer.parseInt(str[i]));
            arrayListSet.add(OperMenuset(Integer.parseInt(str[i])));
        }

        /**
         * 先清空旧表数据，然后插入新数据
         */
        delMenu();
        /**
         * 插入新数据
         */
        Menu menu = new Menu();
        int num = 0;
        for(int j = 0;j < arrayListSet.size();j++){
            int id = arrayListSet.get(j).getId();
            String name = arrayListSet.get(j).getName();
            Double preprice = arrayListSet.get(j).getPreprice();
            Double nowprice = arrayListSet.get(j).getNowprice();
            String imgsrc = arrayListSet.get(j).getImgsrc();

            menu.setId(id);
            menu.setName(name);
            menu.setPreprice(preprice);
            menu.setNowprice(nowprice);
            menu.setImgsrc(imgsrc);

            num = InsertMenu(menu);
        }
        if(num == 1){
            model.addAttribute("menuset",0);
        }else{
            model.addAttribute("menuset",1);
        }
        return "img3";
    }

    @Transactional
    public Menu OperMenuset(int id){
        Menuset menuset = menusetMapper.selectByPrimaryKey(id);
        Menu menu = new Menu();
        menu.setId(menuset.getId());
        menu.setName(menuset.getName());
        menu.setPreprice(menuset.getPreprice());
        menu.setNowprice(menuset.getNowprice());
        menu.setImgsrc(menuset.getImgsrc());
        return menu;
    }

    @Transactional
    public void delMenu() throws Exception{
        try {
            menuMapper.deleteAll();
        } catch (Exception e) {
            throw new Exception("delete menu failed");
        }
    }

    @Transactional
    public Integer InsertMenu(Menu menu)throws Exception{

        try {
            return menuMapper.insert(menu);
        } catch (Exception e) {
            throw new Exception("insert menu failed");
        }
    }
}
