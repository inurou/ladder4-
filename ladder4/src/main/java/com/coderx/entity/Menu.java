package com.coderx.entity;

import java.io.Serializable;

public class Menu implements Serializable {
    private Integer id;

    private String name;

    private Double preprice;

    private Double nowprice;

    private String imgsrc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPreprice() {
        return preprice;
    }

    public void setPreprice(Double preprice) {
        this.preprice = preprice;
    }

    public Double getNowprice() {
        return nowprice;
    }

    public void setNowprice(Double nowprice) {
        this.nowprice = nowprice;
    }

    public String getImgsrc() {
        return imgsrc;
    }

    public void setImgsrc(String imgsrc) {
        this.imgsrc = imgsrc;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", preprice=" + preprice +
                ", nowprice=" + nowprice +
                ", imgsrc='" + imgsrc + '\'' +
                '}';
    }
}