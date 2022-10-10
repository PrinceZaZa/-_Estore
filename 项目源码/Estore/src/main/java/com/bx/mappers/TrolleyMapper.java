package com.bx.mappers;


import com.bx.entity.Trolley;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TrolleyMapper {

    List<Trolley> findAllTrolley(int uid);

    //删除购物车中的商品
    int deleteTrolley(int tid,int uid);

    int addTrolley(int gid,int uid);
}
