package com.bx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Trolley {
	private int tid;
	private int uid;//�����û���
	private User user;
	private int gid;//������Ʒ��
	private Goods goods;
	private int number;
	private String orders_number;//������ţ�Ĭ��Ϊ��

}
