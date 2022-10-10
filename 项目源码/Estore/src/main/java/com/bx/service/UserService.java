package com.bx.service;

import com.bx.entity.User;
import com.bx.utils.PageBean;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author : longboyi
 * @date : 2021/12/27 11:28
 * @describetion :
 */
public interface UserService {

    //手机号唯一校验
    Integer checkPhoneOnly(String phone);

    //用户名唯一校验
    Integer checkUsernameOnly(String username);

    //添加用户
    void addUser(User user);

    //根据用户名查询用户
    User findUser(String username);


    List<User> findAllUsers();

    PageInfo<User> findPageUsers(Integer pageNum);

    void deleteUsers(Integer[] ids);

    void SzManager(int id);

    void QxManager(int id);
}
