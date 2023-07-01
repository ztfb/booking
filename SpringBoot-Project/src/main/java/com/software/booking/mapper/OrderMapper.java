package com.software.booking.mapper;

import com.software.booking.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface OrderMapper extends JpaRepository<Order,Integer> {
    @Query(value="select * from booking.order where user_id=:userId",nativeQuery = true)
    public List<Order> myFindOrdersByUserId(@Param("userId")int userId);
    @Query(value="select * from booking.order where id=:hotelId",nativeQuery = true)
    public List<Order> findOrdersById(@Param("hotelId")int hotelId);
    @Modifying
    @Query(value = "insert into booking.order (user_id,hotel_id,room_id,creation_time,amount,number,start_time,end_time,has_comment,email,special_ask) values (:userId,:hotelId,:roomId,:creationTime,:amount,:number,:startTime,:endTime,:hasComment,:email,:specialAsk)",nativeQuery = true)
    @Transactional
    public void insertOrder(@Param("userId")int userId, @Param("hotelId")int hotelId, @Param("roomId")int roomId, @Param("creationTime") Timestamp createTime, @Param("amount")double amount, @Param("number")int number, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime, @Param("hasComment")int hasComment,@Param("email")String email, @Param("specialAsk")String specialAsk);
}
