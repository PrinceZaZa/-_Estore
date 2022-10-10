package com.bx.service.impl;

import com.bx.entity.Order;
import com.bx.mappers.OrderMapper;
import com.bx.service.OrderService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMappers;

    @Override
    public List<Order> findAllOrder() {
        return orderMappers.findAllOrder();
    }

}
