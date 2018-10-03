package com.coderx.entity;

public class Orderset {
    private Integer id;

    private String orderid;

    private String ordername;

    private String ordertime;

    private String ordermessage;

    private Double ordermoney;

    private String dept;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return "Orderset{" +
                "id=" + id +
                ", orderid='" + orderid + '\'' +
                ", ordername='" + ordername + '\'' +
                ", ordertime='" + ordertime + '\'' +
                ", ordermessage='" + ordermessage + '\'' +
                ", ordermoney=" + ordermoney +
                ", dept='" + dept + '\'' +
                ", status=" + status +
                '}';
    }

    public void setStatus(Integer status) {
        this.status = status;
    }


}