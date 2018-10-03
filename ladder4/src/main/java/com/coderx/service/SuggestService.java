package com.coderx.service;

import com.coderx.entity.Suggestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping
public class SuggestService {
    @Autowired
    private SuggestionService suggestionService;
    @RequestMapping(value = "suggestion",method = RequestMethod.POST)
    public String suggestion(@RequestParam(name = "content") String content, Model model){
        String date = "";
        Date dt = new Date();
        //最后的aa表示“上午”或“下午”    HH表示24小时制    如果换成hh表示12小时制
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss aa");
        date = sdf.format(dt);

        if(content.equals("")){
            model.addAttribute("suggestion",2);
        }else{
            Suggestion suggestion = new Suggestion();
            suggestion.setSuggestion(content);
            suggestion.setDate(date);

            try {
                boolean isSuccess =  sendSuggestion(suggestion);
                if(isSuccess){
                    model.addAttribute("suggestion",0);
                }else{
                    model.addAttribute("suggestion",1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return "tab";
    }

    @Transactional
    public boolean sendSuggestion(Suggestion suggestion) throws Exception{
        if(suggestionService.insert(suggestion) == 1){
            return true;
        }else{
            throw new RuntimeException("send suggestion failed");
        }
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(){
        return "tab2";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public void delete(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("deleteId");
        System.out.println(id);
    }

    /*@Transactional
    public boolean deleteSuggestion(){

    }*/
}
