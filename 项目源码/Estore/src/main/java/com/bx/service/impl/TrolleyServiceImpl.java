package com.bx.service.impl;



import com.bx.entity.Trolley;
import com.bx.mappers.TrolleyMapper;
import com.bx.service.TrolleyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrolleyServiceImpl implements TrolleyService {

    @Autowired
    private TrolleyMapper trolleyMapper;
    @Override
    public List<Trolley> findAllTrolley(int uid) {
        return trolleyMapper.findAllTrolley(uid);
    }

    @Override
    public int deleteTrolley(int tid,int uid) {
        return trolleyMapper.deleteTrolley(tid,uid);
    }

    @Override
    public int addTrolley(int gid,int uid) {
        return trolleyMapper.addTrolley(gid,uid);
    }
}
