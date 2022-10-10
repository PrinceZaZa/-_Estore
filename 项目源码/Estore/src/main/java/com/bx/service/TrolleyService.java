package com.bx.service;


import com.bx.entity.Trolley;

import java.util.List;

public interface TrolleyService {

    //查询购物车所有商品
    List<Trolley> findAllTrolley(int uid);

    //删除购物车中的商品
    int deleteTrolley(int tid,int uid);

    int addTrolley(int gid,int uid);
}
