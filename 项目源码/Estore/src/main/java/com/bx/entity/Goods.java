package com.bx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.log4j.Category;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods{
    private Integer gid;
    private Integer cid;
    private String gname;
    private String color;
    private String size;
    private double price;
    private String description;
    private String full_description;
    private String pic;
    private Integer state;
    private String version;
    private Date product_date;
    private Category category;
}
