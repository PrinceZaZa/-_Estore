package com.bx.mappers;

import com.bx.entity.Order;

import java.util.List;

public interface OrderMapper {
    List<Order> findAllOrder();
}
