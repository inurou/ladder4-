package com.coderx.util;

import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
@Service
public class ResultJsonUtil implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer state = 0;
    private String msg = "成功";
    private Object data;

    public static ResultJsonUtil assembly(){
        return new ResultJsonUtil();
    }

    public static ResultJsonUtil assembly(Object data){
        ResultJsonUtil resultJsonUtil = new ResultJsonUtil();
        resultJsonUtil.data = data;
        return resultJsonUtil;
    }

    public static ResultJsonUtil assembly(Integer state,String msg,Object data){
        ResultJsonUtil resultJsonUtil = new ResultJsonUtil();
        resultJsonUtil.state = state;
        resultJsonUtil.msg = msg;
        resultJsonUtil.data = data;
        return resultJsonUtil;
    }

    @Override
    public String toString(){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("state",state);
        map.put("msg",msg);
        map.put("data",data);
        return JSONObject.fromObject(map).toString();
    }

}
