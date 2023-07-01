package com.software.booking.service.impl;

import com.software.booking.entity.Comment;
import com.software.booking.entity.Hotel;
import com.software.booking.entity.Order;
import com.software.booking.entity.Room;
import com.software.booking.mapper.CommentMapper;
import com.software.booking.mapper.HotelMapper;
import com.software.booking.mapper.OrderMapper;
import com.software.booking.mapper.RoomMapper;
import com.software.booking.service.HotelService;
import com.sun.org.apache.xerces.internal.xs.StringList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class HotelServiceImpl implements HotelService {
    @Autowired
    private HotelMapper hotelMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private RoomMapper roomMapper;
    @Override
    public List<Hotel> find(String location, int startTime, int endTime, int number) {
        System.out.println(location + " " + startTime + " " +endTime + " " +number);
        List<Hotel> hotels=hotelMapper.findHotelsByLocation(location);
        List<Hotel> result=new ArrayList<Hotel>();
        for(Hotel hotel:hotels){
            if(!findRooms(hotel.getId(),startTime,endTime,number).isEmpty()){
                result.add(hotel);
            }
        }
        return result;
    }

    @Override
    public List<Hotel> findTops() {
        List<Hotel> hotels=hotelMapper.findAll();
        Collections.sort(hotels, new Comparator<Hotel>() {
            @Override
            public int compare(Hotel h1, Hotel h2) {
                if(h2.getLevel()>h1.getLevel())return 1;
                else if(h2.getLevel()<h1.getLevel())return -1;
                else return 0;
            }
        });
        List<Hotel> result=new ArrayList<Hotel>();
        int counter=0;
        for(Hotel hotel:hotels){
            result.add(hotel);
            counter++;
            if(counter==3)break;
        }
        return result;
    }

    @Override
    public List<Room> findRooms(int hotelId, int startTime, int endTime, int number) {
        List<Room> rooms=roomMapper.findRoomsByHotelId(hotelId);
        List<Room> result=new ArrayList<Room>();
        for(Room room:rooms){
//            if(room.getNumber()<=number){
                String[] availabel=room.getAvailable().split("-");
//                System.out.println(Arrays.toString(availabel));
                boolean test=true;
                for(int i=startTime;i<=endTime;i++){
                    if(!availabel[i].equals("0")){
                        continue;
                    }
                    else {
                        test=false;
                        break;
                    }
                }
                if(test){
                    result.add(room);
                }
//            }
        }
        return result;
    }

    @Override
    public List<Comment> findComments(int hotelId) {
        List<Order> orders=orderMapper.findOrdersById(hotelId);
        List<Comment> comments=new ArrayList<Comment>();
        for(Order order:orders){
            comments.addAll(commentMapper.findCommentsByOrderId(order.getId()));
        }
        return comments;
    }

    @Override
    public List<Hotel> findByType(String type) {
        System.out.println(type);
        return hotelMapper.findHotelsByType(type);
    }

    @Override
    public List<Hotel> findThis(int hotelId){
        System.out.println(hotelId);
        return hotelMapper.findHotelsById(hotelId);
    }

    @Override
    public List<Hotel> findC(String country,int startTime,int endTime,int number){
        System.out.println(country);
        List<Hotel> hotels=hotelMapper.findHotelsByCountry(country);
        List<Hotel> result=new ArrayList<Hotel>();
        for(Hotel hotel:hotels){
            if(!findRooms(hotel.getId(),startTime,endTime,number).isEmpty()){
                result.add(hotel);
            }
        }
        return result;
    };
}
