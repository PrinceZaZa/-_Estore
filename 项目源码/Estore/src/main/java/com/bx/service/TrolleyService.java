package com.bx.service;


import com.bx.entity.Trolley;

import java.util.List;

public interface TrolleyService {

    //��ѯ���ﳵ������Ʒ
    List<Trolley> findAllTrolley(int uid);

    //ɾ�����ﳵ�е���Ʒ
    int deleteTrolley(int tid,int uid);

    int addTrolley(int gid,int uid);
}
