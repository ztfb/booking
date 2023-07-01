package com.software.booking.service.impl;

import com.software.booking.common.Result;
import com.software.booking.entity.*;
import com.software.booking.mapper.CommentMapper;
import com.software.booking.mapper.OrderMapper;
import com.software.booking.mapper.RoomMapper;
import com.software.booking.mapper.UserMapper;
import com.software.booking.service.OrderService;
import com.software.booking.utils.JwtUtil;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private RoomMapper roomMapper;
    @Override
    public Result submitComment(String token,Comment comment) {
        String userId;
        try {
            Claims claims = JwtUtil.parseJWT(token);
            userId = claims.getSubject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("token非法");
        }
        User user=userMapper.findUserById(Integer.parseInt(userId));
        comment.setPhone(user.getPhone());

        commentMapper.save(comment);
        return new Result("0","提交成功",null);
    }

    public Result averageComment(int hotelId){
        List<Comment> c=commentMapper.findCommentsByHotelId(hotelId);
        double sum=0.0;
        for (int i=0;i<c.size();i++){
            sum+= c.get(i).getLevel();
        }
        StringBuilder b=new StringBuilder();
        b.append(String.valueOf(c.size()));
        b.append(" ");
        b.append(String.valueOf(sum/c.size()));
        return new Result("0","获取成功",b.toString());
    }

    @Override
    public List<Comment> getComment(int hotelId){
        List<Comment> c=commentMapper.findCommentsByHotelId(hotelId);
        Collections.sort(c, new Comparator<Comment>() {
            @Override
            public int compare(Comment c1, Comment c2) {
                if(c2.getLevel()>c1.getLevel())return 1;
                else if(c2.getLevel()<c1.getLevel())return -1;
                else return 0;
            }
        });
        List<Comment> result=new ArrayList<Comment>();
        int counter=0;
        for(Comment com:c){
            result.add(com);
            counter++;
            if(counter==3)break;
        }
        return result;

    }

    @Override
    public List<Order> findOrders(String token) {
        String userId;
        try {
            Claims claims = JwtUtil.parseJWT(token);
            userId = claims.getSubject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("token非法");
        }
        return orderMapper.myFindOrdersByUserId(Integer.parseInt(userId));
    }

    @Override
    public Result generateOrder(String token,Order order) {
        String userId;
        try {
            Claims claims = JwtUtil.parseJWT(token);
            userId = claims.getSubject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("token非法");
        }

        order.setUserId(Integer.parseInt(userId));
        orderMapper.insertOrder(Integer.parseInt(userId),order.getHotelId(), order.getRoomId(),order.getCreationTime(),order.getAmount(),order.getNumber(),order.getStartTime(),order.getEndTime(),order.getHasComment(),order.getEmail(),order.getSpecialAsk());

        long start=order.getStartTime().getTime()/(1000*3600*24)-order.getCreationTime().getTime()/(1000*3600*24);
        long end=order.getEndTime().getTime()/(1000*3600*24)-order.getCreationTime().getTime()/(1000*3600*24);

        System.out.println(start+" "+end);

        Room room=roomMapper.findRoomById(order.getRoomId());
        String[] availabel=room.getAvailable().split("-");
        StringBuilder sber = new StringBuilder();
        for(long i=0;i<=2;i++){
            int aa=Integer.parseInt(availabel[(int)i]);
            if(i>=start&&i<=end){
                aa-=order.getNumber();
            }

            sber.append(String.valueOf(aa));
            sber.append('-');
        }
        sber.deleteCharAt(sber.length()-1);
        room.setAvailable(sber.toString());
        roomMapper.save(room);
        return new Result("0","订单生成成功",null);
    }
}
