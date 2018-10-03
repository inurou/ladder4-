package com.coderx.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;

public class OrderMessage {
    @Excel(name = "订单号",orderNum = "0")
    private String orderid;

    @Excel(name = "订单人",orderNum = "0")
    private String ordername;

    @Excel(name = "订单时间")
    private String ordertime;

    @Excel(name = "订单信息")
    private String ordermessage;

    @Excel(name = "消费金额")
    private Double ordermoney;

    @Excel(name = "部门")
    private String dept;

    public OrderMessage(){

    }

    public OrderMessage(String orderid,String ordername,String ordertime,String ordermessage,Double ordermoney,String dept){
        this.orderid = orderid;
        this.ordername = ordername;
        this.ordertime = ordertime;
        this.ordermessage = ordermessage;
        this.ordermoney = ordermoney;
        this.dept = dept;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getOrdername() {
        return ordername;
    }

    public void setOrdername(String ordername) {
        this.ordername = ordername;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public String getOrdermessage() {
        return ordermessage;
    }

    public void setOrdermessage(String ordermessage) {
        this.ordermessage = ordermessage;
    }

    public Double getOrdermoney() {
        return ordermoney;
    }

    public void setOrdermoney(Double ordermoney) {
        this.ordermoney = ordermoney;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }
}
