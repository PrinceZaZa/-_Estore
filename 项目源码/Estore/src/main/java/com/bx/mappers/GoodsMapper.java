package com.bx.mappers;

import com.bx.entity.Goods;
import com.bx.entity.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper {

    List<Goods> queryAllGoods();
    void deleteBatch(@Param("ibs") String[] ibs);

    //按照gid查询商品的信息
    Goods findGoodById(Integer gid);

    List<Goods> findStarGoods();
    List<Goods> findHomeGoods();
    List<Goods> findSmartGoods();
    List<Goods> findTjGoods();
    List<Goods> findHotGoods();

    List<Goods> getGoods();

   /* List<Goods> queryAllGoods();*/

    public Goods queryById(Integer gid);

    public List<Goods> queryByPage(@Param("startIndex")Integer startIndex, @Param("pageSize")Integer pageSize);

    public void addGood(Goods goods);

    public void deleteById(Integer gid);

    /*批量删除*/
    public void deleteBatchById(Integer[] gids);

    /*修改*/
    public void update(Goods goods);


}
