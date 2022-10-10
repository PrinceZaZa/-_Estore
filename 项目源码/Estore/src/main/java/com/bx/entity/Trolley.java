package com.bx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Trolley {
	private int tid;
	private int uid;//关联用户表
	private User user;
	private int gid;//关联商品表
	private Goods goods;
	private int number;
	private String orders_number;//订单编号，默认为空

}
