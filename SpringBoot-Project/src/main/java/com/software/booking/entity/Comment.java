package com.software.booking.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "comment")

public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "order_id")
    private int orderId;
    @Column(name = "phone")
    private String phone;
    @Column(name = "hotel_id")
    private int hotelId;
    @Column(name = "level")
    private int level;
    @Column(name = "comment")
    private String comment;
}
