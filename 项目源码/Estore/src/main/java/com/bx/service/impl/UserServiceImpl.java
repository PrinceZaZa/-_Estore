package com.bx.service.impl;

import com.bx.entity.User;
import com.bx.mappers.UserMapper;
import com.bx.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    //手机号唯一校验
    @Override
    public Integer checkPhoneOnly(String phone) {
        return userMapper.checkPhoneOnly(phone);
    }

    //用户名唯一校验
    @Override
    public Integer checkUsernameOnly(String username) {
        return userMapper.checkUsernameOnly(username);
    }

    //添加用户
    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    //根据用户名查询用户
    @Override
    public User findUser(String username) {
        return userMapper.findUser(username);
    }


    @Override
    public List<User> findAllUsers() {
        return userMapper.findAllUsers();
    }

    @Override
    public PageInfo<User> findPageUsers(Integer pageNum) {
        PageHelper.startPage(pageNum, 2);
        List<User> users = userMapper.findAllUsers();
        return new PageInfo<>(users);
    }


    @Override
    public void deleteUsers(Integer[] ids) {
        if (ids != null && ids.length > 0) {
            userMapper.deleteUsers(ids);
        }
    }

    @Override
    public void SzManager(int uid) {
        userMapper.SzManager(uid);
    }

    @Override
    public void QxManager(int uid) {
        userMapper.QxManager(uid);
    }
}
