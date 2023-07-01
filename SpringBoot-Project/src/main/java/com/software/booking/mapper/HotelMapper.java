package com.software.booking.mapper;

import com.software.booking.entity.Hotel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface HotelMapper extends JpaRepository<Hotel,Integer> {
    public List<Hotel> findHotelsByType(String type);
    @Modifying
    @Query(value = "select * from booking.hotel where id = :hotelId",nativeQuery = true)
    @Transactional
    public List<Hotel> findHotelsById(@Param("hotelId")int hotelId);
    public List<Hotel> findHotelsByLocation(String location);
    public List<Hotel> findHotelsByCountry(String country);
}
