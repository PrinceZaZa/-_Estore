package com.bx.service;

import com.bx.entity.Category;
import com.bx.entity.Goods;
import com.bx.utils.PageBean;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface GoodsService {
    List<Goods> queryAllGoods();
    void deleteBatch(String[] ibs);
    Goods findGoodById(Integer gid);

    public List<Goods> findStarGoods();
    public List<Goods> findHomeGoods();
    public List<Goods> findSmartGoods();
    public List<Goods> findTjGoods();
    public List<Goods> findHotGoods();

    List<Goods> getGoods();

    /*List<Goods> queryAllGoods();*/

    public Goods queryById(Integer gid);

    public PageBean<Goods> findAllGoods(Integer pageNum, Integer pageSize);

    public void addGood(Goods goods);

    public void deleteById(Integer gid);

    /*批量删除*/
    public void deleteBatchById(Integer[] gids);

    public void update(Goods goods);
}
