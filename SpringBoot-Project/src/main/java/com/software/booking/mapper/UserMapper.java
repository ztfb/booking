package com.software.booking.mapper;

import com.software.booking.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper extends JpaRepository<User,Integer> {
    public User findUserByPhone(String phone);
    public User findUserById(int id);
}
