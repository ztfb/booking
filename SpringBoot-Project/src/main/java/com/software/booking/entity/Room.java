package com.software.booking.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "room")

public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "hotel_id")
    private int hotelId;
    @Column(name = "price")
    private double price;
    @Column(name = "room_type")
    private String roomType;
    @Column(name = "bed_type")
    private String bedType;
    @Column(name = "max_capacity")
    private int maxCapacity;
    @Column(name = "number")
    private int number;
    @Column(name = "available")
    private String available;
}
