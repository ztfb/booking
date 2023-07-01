package com.software.booking.service;

import com.software.booking.common.Result;
import com.software.booking.entity.User;

public interface UserService {
    public Result register(User user);
    public Result login(String phone,String password);
    public Result logout();
}
