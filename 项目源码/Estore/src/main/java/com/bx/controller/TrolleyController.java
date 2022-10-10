package com.bx.controller;

import com.bx.entity.Trolley;
import com.bx.service.TrolleyService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class TrolleyController {

    @Autowired
    private TrolleyService trolleyService;
    @RequestMapping("/findAllTrolley")
    public String findAllTrolley(Model model, int uid){
        List<Trolley> trolleys=trolleyService.findAllTrolley(uid);
        model.addAttribute(trolleys);
        return "trolley";
    }

    @RequestMapping("/deleteTrolley")
    public String deleteTrolley(int tid,int uid){
        if (trolleyService.deleteTrolley(tid,uid)!=0){
           return "redirect:/findAllTrolley?uid="+uid;
        }
        return "trolley";
    }

    @RequestMapping("addTrolley")
    public String addTrolley(int gid,int uid){
        if (trolleyService.addTrolley(gid,uid)!=0){
            return "redirect:/findAllTrolley?uid="+uid;
        }
        return "detail";
    }

}
