package com.coderx.service;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import com.coderx.dao.OrdersetMapper;
import com.coderx.entity.OrderMessage;
import com.coderx.entity.Orderset;
import com.coderx.entity.Person;
import com.coderx.util.ExcelUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;

@Controller
public class ExcelExport {

    @Autowired
    private OrdersetMapper ordersetMapper;

    @RequestMapping("export")
    public void export(HttpServletResponse response) throws Exception {

        //模拟从数据库获取需要导出的数据
        List<Orderset> list = new ArrayList<Orderset>();
        List<OrderMessage> orderList = new ArrayList<OrderMessage>();
        list = ordersetMapper.selectAll();
        for(int i = 0;i < list.size();i++){
            if(list.get(i).getStatus() == 1){
                OrderMessage orderMessage = new OrderMessage(list.get(i).getOrderid(),list.get(i).getOrdername(),
                        list.get(i).getOrdertime(),list.get(i).getOrdermessage(),list.get(i).getOrdermoney(),
                        list.get(i).getDept());
                orderList.add(orderMessage);
            }
        }


        //导出操作
        ExcelUtil.exportExcel(orderList,"部门消费信息","北明各部门食堂消费信息",OrderMessage.class,"部门消费信息.xls",response);
    }

    @RequestMapping("importExcel")
    public void importExcel() throws Exception {
        String filePath = "F:\\海贼王.xls";
        //解析excel，
        List<Person> personList = ExcelUtil.importExcel(filePath,1,1,Person.class);
        //也可以使用MultipartFile,使用 FileUtil.importExcel(MultipartFile file, Integer titleRows, Integer headerRows, Class<T> pojoClass)导入
        System.out.println("导入数据一共【"+personList.size()+"】行");

        //TODO 保存数据库
    }


}
