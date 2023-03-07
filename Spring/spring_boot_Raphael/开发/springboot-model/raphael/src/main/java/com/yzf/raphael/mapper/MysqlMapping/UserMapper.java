package com.yzf.raphael.mapper.MysqlMapping;

import com.yzf.raphael.model.Mysql.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    User getUserByName(String username);
    void save(User user);
}
