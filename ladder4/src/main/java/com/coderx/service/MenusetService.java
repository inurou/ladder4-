package com.coderx.service;

import com.coderx.entity.Menuset;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

public interface MenusetService {

    ArrayList<Menuset> selectAll();

    Menuset selectByPrimaryKey(Integer id);
}
