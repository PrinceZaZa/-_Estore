package com.bx.service;

import com.bx.entity.Category;
import com.github.pagehelper.PageInfo;

import java.util.List;


public interface CategoryService {
    List<Category> findAllCategory();

    PageInfo<Category> findPageCategorys(Integer pageNum);

    boolean exist(String categoryName);

    void saveCategory(Category category);

    void deleteCategorys(Integer[] ids);

    Category findCategoryByCid(Integer cid);

    void updateCategory(Category category);
}
