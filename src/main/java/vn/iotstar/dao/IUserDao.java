package vn.iotstar.dao;

import vn.iotstar.entity.User;

public interface IUserDao {
    void insert(User user);
    User findByUsername(String username);
    User login(String username, String password);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    void updateOTP(String username, String otp);
    void activateAccount(String username);
    User findByEmail(String email);
    void updatePassword(String username, String newPassword);
    User findById(int id);
    void updateProfile(User user);
}