package com.software.booking.service.impl;

import com.software.booking.common.Result;
import com.software.booking.entity.User;
import com.software.booking.entity.UserLogin;
import com.software.booking.mapper.UserMapper;
import com.software.booking.service.UserService;
import com.software.booking.utils.JwtUtil;
import com.software.booking.utils.RedisCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private UserMapper userMapper;
    @Override
    public Result register(User user) {

        if(!Objects.isNull(userMapper.findUserByPhone(user.getPhone()))){//如果找到手机号
            return new Result("1","该手机号已被注册",null);
        }else{
            User newUser=new User();
            newUser.setPhone(user.getPhone());
            BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
            String p=passwordEncoder.encode(user.getPassword());//进行加密操作
            newUser.setPassword(p);
            userMapper.save(newUser);//保存用户信息
            return new Result("0","注册成功",null);
        }
    }
    @Override
    public Result login(String phone,String password) {
        System.out.println(phone+" "+password);
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(phone,password);
        try{
            Authentication authenticate = authenticationManager.authenticate(authenticationToken);
            //没有抛出异常
            //使用userid生成token
            UserLogin userLogin = (UserLogin) authenticate.getPrincipal();
            String userId = Long.toString(userLogin.getUser().getId());
            String jwt = JwtUtil.createJWT(userId);
            //authenticate存入redis
            redisCache.setCacheObject(userId,userLogin);
            //把token响应给前端
            HashMap<String,String> map = new HashMap<>();
            map.put("token",jwt);
            return new Result("0","登录成功",map);
        }catch (AuthenticationException e){
            return new Result("1","手机号或密码错误",null);
        }
    }

    @Override
    public Result logout() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserLogin userLogin = (UserLogin) authentication.getPrincipal();
        String userid = Long.toString(userLogin.getUser().getId());
        redisCache.deleteObject(userid);
        return new Result("0","退出成功",null);
    }
}
