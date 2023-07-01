package com.software.booking.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

@Entity
@Data
@Table(name = "order")

public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "user_id")
    private int userId;
    @Column(name = "hotel_id")
    private int hotelId;
    @Column(name = "room_id")
    private int roomId;
    @Column(name = "creation_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp creationTime;
    @Column(name = "amount")
    private double amount;
    @Column(name = "number")
    private int number;
    @Column(name = "start_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp startTime;
    @Column(name = "end_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp endTime;
    @Column(name = "has_comment")
    private int hasComment;
    @Column(name = "email")
    private String email;
    @Column(name = "special_ask")
    private String specialAsk;
}
