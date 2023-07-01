package com.software.booking.service;

import com.software.booking.common.Result;
import com.software.booking.entity.Comment;
import com.software.booking.entity.Order;
import java.util.List;

public interface OrderService {
    public Result submitComment(String token,Comment comment);
    public List<Order> findOrders(String token);

    public Result generateOrder(String token,Order order);

    public Result averageComment(int hotelId);

    public List<Comment> getComment(int hotelId);
}
