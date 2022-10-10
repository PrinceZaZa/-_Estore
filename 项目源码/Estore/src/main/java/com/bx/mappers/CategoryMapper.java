package com.bx.mappers;

import com.bx.entity.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryMapper {
    List<Category> findAllCategory();

    Category findCategoryByName(String categoryName);

    void saveCategory(Category category);

    void deleteCategorys(Integer[] ids);

    Category findCategoryByCid(Integer cid);

    void updateCategory(Category category);
}
