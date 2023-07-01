package com.software.booking.mapper;

import com.software.booking.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentMapper extends JpaRepository<Comment,Integer> {
    public List<Comment> findCommentsByOrderId(int orderId);
    public List<Comment> findCommentsByHotelId(int hotelId);
    public List<Comment> findCommentsByPhone(String phone);
}
