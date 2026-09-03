package vn.iotstar.service.impl;

import java.sql.Date;
import vn.iotstar.dao.IUserDao;
import vn.iotstar.dao.impl.UserDao;
import vn.iotstar.entity.User;
import vn.iotstar.service.IUserService;

public class UserServiceImpl implements IUserService {

    IUserDao userDao = new UserDao();
    
    @Override
    public void updateOTP(String username, String otp) {
        userDao.updateOTP(username, otp);
    }

    @Override
    public void activateAccount(String username) {
        userDao.activateAccount(username);
    }

    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public void updatePassword(String username, String newPassword) {
        userDao.updatePassword(username, newPassword);
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public User login(String username, String password) {
        return userDao.login(username, password);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }
    
    @Override
    public User findById(int id) {
        return userDao.findById(id);
    }

    @Override
    public void updateProfile(User user) {
        userDao.updateProfile(user);
    }
}