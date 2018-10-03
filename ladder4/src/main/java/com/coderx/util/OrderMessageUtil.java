package com.coderx.util;

import com.coderx.dao.MenuMapper;
import com.coderx.entity.Menu;
import com.coderx.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

public class OrderMessageUtil {

    @Autowired
    private MenuMapper menuMapper;

    public ArrayList<Order> OrderMessage(String orderMessage){
        ArrayList<Order> arrayList = new ArrayList<Order>();
        ArrayList<Order> arrayList1 = new ArrayList<Order>();
        String[] message = orderMessage.split(" ");

        for(int i = message.length - 1;i >= 0;i--){
            String[] str = message[i].split("\\*");

            arrayList.add(new Order(str[0],Integer.parseInt(str[1])));
        }
        /*for(int i =0;i < arrayList.size();i++){
            System.out.println(arrayList.get(i).getName()+" "+arrayList.get(i).getNum());
        }*/

        for(int i = 0;i < arrayList.size() - 1;i++){
            for(int j = i+1;j < arrayList.size();j++){
                if(arrayList.get(i).getName().equals(arrayList.get(j).getName())){
                    arrayList.get(j).setName("");
                }
            }
        }
        for(int i = 0;i < arrayList.size();i++){
            if(arrayList.get(i).getName()!="" && arrayList.get(i).getNum() != 0) {
                arrayList1.add(new Order(arrayList.get(i).getName(), arrayList.get(i).getNum()));
            }
        }
        return arrayList1;

    }


    @Transactional
    public Double OrderMenuName(String name) throws Exception{
        try {
            Menu menu = menuMapper.selectByName(name);
            Double price = menu.getNowprice();
            return price;
        } catch (Exception e) {
            throw new Exception("select menu failed");
        }
    }
}
