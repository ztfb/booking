package com.software.booking.controller;

import com.software.booking.entity.Comment;
import com.software.booking.entity.Hotel;
import com.software.booking.entity.Room;
import com.software.booking.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/user")
@CrossOrigin
public class HotelController {
    @Autowired
    private HotelService hotelService;
    // 首页酒店搜索接口
    @GetMapping("/fullSearch")
    public List<Hotel> find(String location,int startTime,int endTime,int number){return hotelService.find(location,startTime,endTime,number);}
    // 根据国家查询酒店信息
    @GetMapping("/countrySearch")
    public List<Hotel> findC(String country,int startTime,int endTime,int number){return hotelService.findC(country,startTime,endTime,number);}
    // 查找排名前三的酒店接口
    @GetMapping("/getPopular")
    public List<Hotel> findTops(){return hotelService.findTops();}
    // 根据酒店id查询酒店具体信息
    @GetMapping("/getInformation")
    public List<Hotel> findThis(int hotelId){return hotelService.findThis(hotelId);}
    // 查找酒店空房接口
    @GetMapping("/localsearch")
    public List<Room> findRooms(int hotelId,int startTime,int endTime,int number){return hotelService.findRooms(hotelId,startTime,endTime,number);}
    // 查找酒店评论接口
    @GetMapping("/findComments")
    public List<Comment> findComments(int hotelId){return hotelService.findComments(hotelId);}
    // 按类型查找酒店接口
    @GetMapping("/typeSearch")
    public List<Hotel> findByType(String type){return hotelService.findByType(type);}
}
