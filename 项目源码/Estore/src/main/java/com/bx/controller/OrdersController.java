package com.bx.controller;

import com.bx.service.impl.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "user")
public class OrdersController {

    @Autowired
    private OrderServiceImpl getOrderInfo;

    @RequestMapping(value = "order")
    public String getOrder(Model model){
        model.addAttribute("orders",getOrderInfo.findAllOrder());
        return "admin/imglist";
    }
}