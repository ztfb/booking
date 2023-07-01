package com.software.booking.controller;

import com.software.booking.common.Result;
import com.software.booking.entity.User;
import com.software.booking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
@CrossOrigin
public class UserController {
    @Autowired
    private UserService userService;
    // 用户注册接口
    @PostMapping("/register")
    public Result register(@RequestBody User user){
        return userService.register(user);
    }
    // 用户登录接口
    @GetMapping("/login")
    public Result login(String phone,String password){
        return userService.login(phone,password);
    }
    // 用户登出接口
    @DeleteMapping("/logout")
    public Result logout(){
        return userService.logout();
    }
}
