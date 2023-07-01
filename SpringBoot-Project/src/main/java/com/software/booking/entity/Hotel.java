package com.software.booking.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "hotel")

public class Hotel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "location")
    private String location;
    @Column(name = "country")
    private String country;
    @Column(name = "address")
    private String address;
    @Column(name = "name")
    private String name;
    @Column(name = "introduction")
    private String introduction;
    @Column(name = "pictures")
    private String pictures;
    @Column(name = "price")
    private double price;
    @Column(name = "type")
    private String type;
    @Column(name = "level")
    private double level;
    @Column(name = "label")
    private String label;

}
