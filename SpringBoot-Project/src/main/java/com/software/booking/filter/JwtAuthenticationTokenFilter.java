package com.software.booking.filter;

import com.software.booking.entity.UserLogin;
import com.software.booking.utils.JwtUtil;
import com.software.booking.utils.RedisCache;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {

    @Autowired
    private RedisCache redisCache;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        //获取token
        String token = request.getHeader("token");
//
//        response.setHeader("Access-Control-Allow-Origin", "*");
//        System.out.println("111");
////        response.addHeader("Access-Control-Allow-Origin", request.getHeader("origin"));
//        // 解决预请求（发送2次请求），此问题也可在 nginx 中作相似设置解决。
//        response.setHeader("Access-Control-Allow-Headers", "x-requested-with,Cache-Control,Pragma,Content-Type,Token, Content-Type");
//        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
//        response.setHeader("Access-Control-Max-Age", "3600");
//        response.setHeader("Access-Control-Allow-Credentials", "true");
//        String method = request.getMethod();
//        if (method.equalsIgnoreCase("OPTIONS")) {
//            System.out.println("222");
//            response.getOutputStream().write("Success".getBytes("utf-8"));
//        }
//        else {
//            System.out.println("333");
        if (!StringUtils.hasText(token)) {
            //放行
//            System.out.println("444");
            filterChain.doFilter(request, response);//没有token时放行
//            System.out.println("555");
            return;
        }
        //解析token
        String id;
        try {
            Claims claims = JwtUtil.parseJWT(token);
            id = claims.getSubject();
        } catch (Exception e) {
            e.printStackTrace();
            returnJson(response);
            throw new RuntimeException("token非法");
        }
        //从redis中获取用户信息
        UserLogin userLogin = redisCache.getCacheObject(id);
        if(Objects.isNull(userLogin)){
            returnJson(response);
            throw new RuntimeException("登录过期");
        }
        //存入SecurityContextHolder
        //TODO 获取权限信息封装到Authentication中
        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(userLogin,null,null);
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);
        //放行
        filterChain.doFilter(request, response);
//        }


    }



    private void returnJson(HttpServletResponse response){
        PrintWriter writer = null;
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        try {
            writer = response.getWriter();
            String error = "token无效";
            writer.print(error);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (writer != null)
                writer.close();
        }
    }
}
