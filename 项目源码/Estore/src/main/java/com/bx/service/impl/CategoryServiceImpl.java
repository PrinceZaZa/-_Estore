package com.bx.service.impl;

import com.bx.entity.Category;
import com.bx.mappers.CategoryMapper;
import com.bx.service.CategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public List<Category> findAllCategory() {
        return categoryMapper.findAllCategory();
    }

    @Override
    public PageInfo<Category> findPageCategorys(Integer pageNum) {
        //设置分页信息
        PageHelper.startPage(pageNum,3);
        //查询所有记录
        List<Category> cates = categoryMapper.findAllCategory();
        //封装到PageInfo中自动完成分页
        return new PageInfo<>(cates);
    }

    @Override
    public boolean exist(String categoryName) {
        return categoryMapper.findCategoryByName(categoryName)==null?true:false;
    }

    @Override
    public void saveCategory(Category category) {
        if (category ==null){
            throw new IllegalArgumentException("参数Category不能为null");
        }
        categoryMapper.saveCategory(category);
    }

    @Override
    public void deleteCategorys(Integer[] ids) {
        if(ids!=null&&ids.length>0){
            categoryMapper.deleteCategorys(ids);
        }
    }

    @Override
    public Category findCategoryByCid(Integer cid) {
        return categoryMapper.findCategoryByCid(cid);
    }

    @Override
    public void updateCategory(Category category) {
        if(category ==null){
            throw new IllegalArgumentException("参数commodityCategory不能为null");
        }
        if(category.getCid()==null){
            throw new IllegalArgumentException("修改commodityCategory时，id必须指定");
        }
        categoryMapper.updateCategory(category);
    }
}
