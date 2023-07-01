package com.software.booking.controller;

import com.software.booking.common.Result;
import com.software.booking.entity.Comment;
import com.software.booking.entity.Order;
import com.software.booking.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
@CrossOrigin
public class OrderController {
    @Autowired
    private OrderService orderService;
    // 提交评论接口
    @PostMapping("/commentSubmit")
    public Result submitComment(@RequestHeader("token")String token,@RequestBody Comment comment){return orderService.submitComment(token,comment);}
    // 查找评论平均评分
    @GetMapping("/commentAverage")
    public Result averageComment(int hotelId){return orderService.averageComment(hotelId);}
    // 查找酒店前三评论
    @GetMapping("/commentGet")
    public List<Comment> getComment(int hotelId){return orderService.getComment(hotelId);}
    // 查找用户的订单接口
    @GetMapping("/orderCheck")
    public List<Order> findOrders(@RequestHeader("token")String token){return orderService.findOrders(token);}
    // 生成顶单接口
    @PostMapping("/orderGenerate")
    public Result generateOrder(@RequestHeader("token")String token,@RequestBody Order order){return orderService.generateOrder(token,order);}
}
