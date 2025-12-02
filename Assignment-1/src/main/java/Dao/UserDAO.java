package Dao;

import Entity.User;

public interface UserDAO {
    User findById(String id);
    void create(User user);
    void update(User user);
    void delete(String id);
}
