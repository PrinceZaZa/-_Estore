package com.bx.controller;


import com.bx.entity.Category;
import com.bx.entity.Goods;
import com.bx.service.CategoryService;
import com.bx.service.GoodsService;
import com.bx.utils.PageBean;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(name = "显示商品详情", path = "findGoodDetail")
    public String findGoodDetail(@Param("gid") Integer gid, Model model) {
        Goods goods = goodsService.findGoodById(gid);
        model.addAttribute("goods", goods);
        return "detail";
    }

    @RequestMapping(value = "index1")
    public String getGoods(Model model) {
        model.addAttribute("starGoodes", goodsService.findStarGoods());
        model.addAttribute("homeGoodes", goodsService.findHomeGoods());
        model.addAttribute("smartGoodes", goodsService.findSmartGoods());
        model.addAttribute("tjGoodes", goodsService.findTjGoods());
        model.addAttribute("hotGoodes", goodsService.findHotGoods());
        return "index";
    }

    @RequestMapping("getGoods")
    public String getAllGoods(Model model){
       List<Goods> goodsList= goodsService.getGoods();
        model.addAttribute("goodsList",goodsList);
        return "admin/goods_list";
    }

    /*商品详情*/
    @RequestMapping("getgood")
    public String queryById(Integer gid, Model model){
        Goods goods = goodsService.queryById(gid);
        model.addAttribute("goods",goods);
        return "detail";
    }

    /*分页获取商品(后台)*/
    @RequestMapping("getgoodPage")
    public String queryByPage(Integer pageNum, Model model){
        if (pageNum<=0 || pageNum==null){
            pageNum=1;
        }
        PageBean<Goods> pageBean= goodsService.findAllGoods(pageNum,3);
        model.addAttribute("pageTool",pageBean);
        return "admin/goods_list";
    }

    /*添加商品页面*/
    @RequestMapping("addpage")
    public String addGoodsPage(ModelMap modelMap){
        List<Category> categories = categoryService.findAllCategory();
        modelMap.addAttribute("cates",categories);
        return "admin/goods_add";
    }

    /*添加商品*/
    @RequestMapping("addgoods")
    public String addGoods(@RequestParam("cid") String cid, @RequestParam("gname") String gname,
                           @RequestParam("color") String color, @RequestParam("size") String size,
                           @RequestParam("price") Double price, @RequestParam("description") String description,
                           @RequestParam("full_description") String full_description,
                           @RequestParam("state") String state, @RequestParam("version") String version,
                           @RequestParam("product_date") String date,
                           MultipartFile pic, HttpServletRequest req) throws Exception{
        //
        String path = req.getServletContext().getRealPath("img");
        File storePath = new File(path);
        String originFileName = pic.getOriginalFilename();
        String fileName="";
        SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-dd");
        //有图片才上传
        if (originFileName!=""){
            fileName = UUID.randomUUID()+originFileName;
            pic.transferTo(new File(storePath,fileName));
        }
        //生成商品类
        Goods goods = new Goods(null,Integer.valueOf(cid),gname,color,size,price, description,
                full_description,fileName,Integer.valueOf(state)
                ,version,sf.parse(date),null);
        System.out.println(goods);
        //添加
        goodsService.addGood(goods);
        return "redirect:/getgoodPage?pageNum=1";

    }

    /*跳转到修改页面*/
    @RequestMapping("preupdate")
    public String preUpdateGoods(Integer id, ModelMap modelMap){
        Goods goods = goodsService.queryById(id);
        List<Category> categories = categoryService.findAllCategory();
        modelMap.addAttribute("cates",categories);
        goods.setCid(goods.getCid());
        modelMap.addAttribute("goods",goods);
        return "admin/goods_update";
    }


    /*修改商品*/
    @RequestMapping("update")
    public String updateGoods(@RequestParam("cid") String cid, Integer gid, String gname, String color, String size, Double price
            , String description, String full_description, String state,
                              String version, String product_date,
                              MultipartFile pic, HttpServletRequest req, String oldPic) throws Exception{
        //
        String path = req.getServletContext().getRealPath("img");
        File storePath = new File(path);
        String originFileName = pic.getOriginalFilename();
        String fileName=oldPic;
        SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-dd");
        //有图片且图片不一样才修改图片
        if (!originFileName.equals(oldPic) && originFileName!=""){
            fileName = UUID.randomUUID()+originFileName;
            pic.transferTo(new File(storePath,fileName));
        }
        //生成商品类
        Goods goods = new Goods(gid,Integer.valueOf(cid),gname,color,size,price,description,
                full_description,fileName,Integer.valueOf(state)
                ,version,sf.parse(product_date),null);
        System.out.println(goods);
        //修改商品
        goodsService.update(goods);
        return "redirect:/getgoodPage?pageNum=1";
    }


    //批量删除商品
    @RequestMapping("/goodsDelete")
    public String userDelete(Integer [] ids) throws Exception {
        System.out.println(ids);
        if(ids.length>0||ids!=null){
            goodsService.deleteBatchById(ids);
        }else{
            throw new Exception();
        }
        return "redirect:/getgoodPage?pageNum=1";
    }

}
