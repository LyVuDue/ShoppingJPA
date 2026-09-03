package vn.iotstar.service;

import vn.iotstar.entity.User;

public interface IUserService {
    void insert(User user);
    User login(String username, String password);
    User findByUsername(String username);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    void updateOTP(String username, String otp);
    void activateAccount(String username);
    User findByEmail(String email);
    void updatePassword(String username, String newPassword);
    User findById(int id);
    void updateProfile(User user);
}