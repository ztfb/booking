package com.software.booking.service;

import com.software.booking.entity.Comment;
import com.software.booking.entity.Hotel;
import com.software.booking.entity.Room;

import java.util.List;

public interface HotelService {
    public List<Hotel> find(String location, int startTime, int endTime, int number);
    public List<Hotel> findTops();
    public List<Room> findRooms(int hotelId,int startTime,int endTime,int number);
    public List<Comment> findComments(int hotelId);
    public List<Hotel> findByType(String type);

    public List<Hotel> findThis(int hotelId);

    public List<Hotel> findC(String country,int startTime,int endTime,int number);
}
