package com.bx.controller;

import com.bx.entity.Category;
import com.bx.service.CategoryService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(name = "查询所有分类", path = "findAllCategory")
    public String findAllAccounts(Model model) {
        model.addAttribute("cates", categoryService.findAllCategory());
        return "admin/category_list";
    }

    @RequestMapping(name = "查询所有分页类别",path = "findPageCategorys")
    public String findPageAccounts(@RequestParam(name = "pageNum",defaultValue = "1") Integer pageNum, Model model){
        PageInfo<Category> pageInfo = categoryService.findPageCategorys(pageNum);//固定每页显示3条
        model.addAttribute("pageInfo",pageInfo);
        return "admin/category_list";
    }

    @RequestMapping(name = "检查分类是否可用",path = "checkCategory")
    @ResponseBody
    public String checkCategory(String categoryName){
        boolean exist = categoryService.exist(categoryName);
        if(exist){
            return "false";
        }
        return "true";
    }

    @RequestMapping(name = "新加分类",path = "addCategory")
    public String addCategory(Category category){
        categoryService.saveCategory(category);
        return "redirect:findPageCategorys";
    }

    @RequestMapping(name = "批量删除",path = "deleteCategorys")
    public String deleteCategorys(Integer[] ids){
        categoryService.deleteCategorys(ids);
        return "redirect:findPageCategorys";
    }

    @RequestMapping(name = "回显要修改的数据",path = "editCategoryUI{cid}")
    public String editCategoryUI(@PathVariable("cid") Integer cid, Model model){
        Category category = categoryService.findCategoryByCid(cid);
        model.addAttribute("cate", category);
        return "admin/category_update";
    }

    @RequestMapping(name = "保存修改后的信息",path = "updateCategory")
    public String updateCategory(Category category){
        categoryService.updateCategory(category);
        return "redirect:findPageCategorys";
    }
}
