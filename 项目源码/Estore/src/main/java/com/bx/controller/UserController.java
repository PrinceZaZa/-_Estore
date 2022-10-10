package com.bx.controller;

import com.bx.entity.User;
import com.bx.service.UserService;
import com.bx.utils.UploadUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Date;


@Controller
public class UserController {
    @Autowired
    private UserService userService;

    //测试首页
    @RequestMapping("/index")
    public String toIndex() {
        return "redirect:index1";
    }
    /**
     * 手机号唯一校验
     *
     * @return
     */
    @ResponseBody
    @PostMapping("/user/register/checkPhoneOnly")
    public Boolean checkPhoneOnly(@RequestParam("phone") String phone) {
        Integer count = userService.checkPhoneOnly(phone);
        return count != 0 ? false : true;
    }

    /**
     * 用户名唯一校验
     *
     * @param username
     * @return
     */
    @ResponseBody
    @PostMapping("/user/register/checkUsernameOnly")
    public Boolean checkUsernameOnly(@RequestParam("username") String username) {
        Integer count = userService.checkUsernameOnly(username);
        return count != 0 ? false : true;
    }

    /**
     * 注册用户
     *
     * @param
     * @param photo
     * @return
     */
    @PostMapping("/register/user")
    public String register(String uname, String gender, String phone, String area, String username, String password, MultipartFile photo) throws Exception {

        //1、进行一个参数校验

        //2.封装对象
        User user = new User();
        user.setUname(uname);
        user.setGender(gender);
        user.setPhone(phone);
        user.setArea(area);
        user.setUsername(username);
        user.setPassword(password);
        user.setCreate_time(new Date());
        user.setManager(0);//不是管理员

        //2、上传头像返回头像地址
        String fileUpload = UploadUtil.fileUpload(photo);
        user.setPhoto(fileUpload);

        //3、添加到数据库
        userService.addUser(user);

        //4、重定向
        return "redirect:../index";
    }


    @ResponseBody
    @PostMapping("/login")
    public Boolean userLogin(@RequestParam("password") String password, @RequestParam("username") String username, HttpSession session) {
        User user = userService.findUser(username);
        if (user != null) {
            if (user.getPassword().equals(password)) {
                user.setPassword("");
                //把用户信息保存到session中
                session.setAttribute("user", user);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }

    }


    @RequestMapping(path = "list")
    public String findAllUsers(Model model) {
        model.addAttribute("users", userService.findAllUsers());
        return "admin/user_list";
    }

    @RequestMapping(name = "查询所有分页类别", path = "findPageusers")
    public String findPageusers(@RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, Model model) {
        PageInfo<User> pageInfo = userService.findPageUsers(pageNum);//固定每页显示3条
        model.addAttribute("pageInfo", pageInfo);
        return "admin/user_list";
    }

    @RequestMapping(name = "批量删除", path = "deleteUsers")
    public String deleteUsers(Integer[] ids) {
        userService.deleteUsers(ids);
        return "redirect:findPageusers";
    }


    @RequestMapping(path = "SzManager{uid}")
    public String SzMangerByuid(@PathVariable("uid") int uid) {
        userService.SzManager(uid);
        return "redirect:findPageusers";
    }

    @RequestMapping(path = "QxManager{uid}")
    public String QxMangerByuid(@PathVariable("uid") int uid) {
        userService.QxManager(uid);
        return "redirect:findPageusers";
    }

}
