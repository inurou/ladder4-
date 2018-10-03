package com.coderx.util;

import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
@Service
public class CharsetUtil {
    public static String dealCharset(String a){
        String b ="";
        try {
            b =  new String(a.getBytes("ISO8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return b;
    }
}
