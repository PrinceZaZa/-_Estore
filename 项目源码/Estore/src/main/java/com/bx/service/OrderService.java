package com.bx.service;

import com.bx.entity.Order;

import java.util.List;

/**
 * @author Administrator
 */
public interface OrderService {

    List<Order> findAllOrder();
}
