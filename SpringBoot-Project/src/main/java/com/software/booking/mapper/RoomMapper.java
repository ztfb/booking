package com.software.booking.mapper;

import com.software.booking.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomMapper extends JpaRepository<Room,Integer>{
    public List<Room> findRoomsByHotelId(int hotelId);
    public Room findRoomById(int id);
}
