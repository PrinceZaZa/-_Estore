package com.bx.service.impl;

import com.bx.entity.Category;
import com.bx.entity.Goods;
import com.bx.mappers.GoodsMapper;
import com.bx.service.GoodsService;
import com.bx.utils.PageBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Mapper;
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
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public List<Goods> queryAllGoods() {
        List<Goods> allGoods = null;
        allGoods = goodsMapper.queryAllGoods();
        return allGoods;
    }

    @Override
    public void deleteBatch(String[] ibs) {
        goodsMapper.deleteBatch(ibs);
    }

    @Override
    public Goods findGoodById(Integer gid) {
        return goodsMapper.findGoodById(gid);
    }

    public List<Goods> findStarGoods() {
        List<Goods> starGoodes = null;
        starGoodes = goodsMapper.findStarGoods();
        return starGoodes;
    }

    public List<Goods> findHomeGoods() {
        List<Goods> homeGoodes = null;
        homeGoodes = goodsMapper.findHomeGoods();
        return homeGoodes;
    }

    public List<Goods> findSmartGoods() {
        List<Goods> smartGoodes = null;
        smartGoodes = goodsMapper.findHomeGoods();
        return smartGoodes;
    }

    public List<Goods> findTjGoods() {
        List<Goods> tjGoodes = null;
        tjGoodes = goodsMapper.findHomeGoods();
        return tjGoodes;
    }

    public List findHotGoods() {
        List<Goods> hotGoodes = null;
        hotGoodes = goodsMapper.findHomeGoods();
        return hotGoodes;
    }

    @Override
    public List<Goods> getGoods() {
        return goodsMapper.getGoods();
    }

  /*  @Override
    public List<Goods> queryAllGoods() {
        return goodsMapper.queryAllGoods();
    }*/

    @Override
    public Goods queryById(Integer gid) {
        return goodsMapper.queryById(gid);
    }

    @Override
    public PageBean<Goods> findAllGoods(Integer pageNum, Integer pageSize) {
        List<Goods> allGoods = goodsMapper.queryAllGoods();
        int totalRecod = allGoods.size();
        PageBean pageBean = new PageBean(pageNum,pageSize,totalRecod);
        int startIndex = pageBean.getStartIndex();
        List<Goods> all = goodsMapper.queryByPage(startIndex, pageSize);
        pageBean.setList(all);
        return pageBean;
    }

    @Override
    public void addGood(Goods goods) {
        goodsMapper.addGood(goods);
    }

    @Override
    public void deleteById(Integer gid) {
        goodsMapper.deleteById(gid);
    }

    @Override
    public void deleteBatchById(Integer[] gids) {
        if (gids!=null && gids.length>0){
            goodsMapper.deleteBatchById(gids);
        }
    }

    @Override
    public void update(Goods goods) {
        goodsMapper.update(goods);
    }
}
