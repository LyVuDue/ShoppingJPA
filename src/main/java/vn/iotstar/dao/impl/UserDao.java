package vn.iotstar.dao.impl;

import java.util.List;
import jakarta.persistence.*;
import vn.iotstar.config.JpaConfig;
import vn.iotstar.dao.IUserDao;
import vn.iotstar.entity.User;

public class UserDao implements IUserDao {
	
	@Override
	public void updateOTP(String username, String otp) {
	    EntityManager enma = JpaConfig.getEntityManager();
	    EntityTransaction trans = enma.getTransaction();
	    try {
	        trans.begin();
	        String jpql = "UPDATE User u SET u.otp = :otp WHERE u.username = :username";
	        enma.createQuery(jpql)
	            .setParameter("otp", otp)
	            .setParameter("username", username)
	            .executeUpdate();
	        trans.commit();
	    } catch (Exception e) {
	        e.printStackTrace();
	        trans.rollback();
	    } finally {
	        enma.close();
	    }
	}

	@Override
	public void activateAccount(String username) {
	    EntityManager enma = JpaConfig.getEntityManager();
	    EntityTransaction trans = enma.getTransaction();
	    try {
	        trans.begin();
	        String jpql = "UPDATE User u SET u.active = 1, u.otp = null WHERE u.username = :username";
	        enma.createQuery(jpql)
	            .setParameter("username", username)
	            .executeUpdate();
	        trans.commit();
	    } catch (Exception e) {
	        e.printStackTrace();
	        trans.rollback();
	    } finally {
	        enma.close();
	    }
	}

	@Override
	public User findByEmail(String email) {
	    EntityManager enma = JpaConfig.getEntityManager();
	    String jpql = "SELECT u FROM User u WHERE u.email = :email";
	    try {
	        TypedQuery<User> query = enma.createQuery(jpql, User.class);
	        query.setParameter("email", email);
	        java.util.List<User> results = query.getResultList();
	        return results.isEmpty() ? null : results.get(0);
	    } finally {
	        enma.close();
	    }
	}

	@Override
	public void updatePassword(String username, String newPassword) {
	    EntityManager enma = JpaConfig.getEntityManager();
	    EntityTransaction trans = enma.getTransaction();
	    try {
	        trans.begin();
	        String jpql = "UPDATE User u SET u.password = :password WHERE u.username = :username";
	        enma.createQuery(jpql)
	            .setParameter("password", newPassword)
	            .setParameter("username", username)
	            .executeUpdate();
	        trans.commit();
	    } catch (Exception e) {
	        e.printStackTrace();
	        trans.rollback();
	    } finally {
	        enma.close();
	    }
	}

    @Override
    public void insert(User user) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(user);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public User findByUsername(String username) {
        EntityManager enma = JpaConfig.getEntityManager();
        String jpql = "SELECT u FROM User u WHERE u.username = :username";
        try {
            TypedQuery<User> query = enma.createQuery(jpql, User.class);
            query.setParameter("username", username);
            List<User> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } finally {
            enma.close();
        }
    }

    @Override
    public User login(String username, String password) {
        EntityManager enma = JpaConfig.getEntityManager();
        String jpql = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
        try {
            TypedQuery<User> query = enma.createQuery(jpql, User.class);
            query.setParameter("username", username);
            query.setParameter("password", password);
            List<User> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } finally {
            enma.close();
        }
    }

    @Override
    public boolean checkExistEmail(String email) {
        EntityManager enma = JpaConfig.getEntityManager();
        String jpql = "SELECT COUNT(u) FROM User u WHERE u.email = :email";
        try {
            Query query = enma.createQuery(jpql);
            query.setParameter("email", email);
            return ((Long) query.getSingleResult()) > 0;
        } finally {
            enma.close();
        }
    }

    @Override
    public boolean checkExistUsername(String username) {
        EntityManager enma = JpaConfig.getEntityManager();
        String jpql = "SELECT COUNT(u) FROM User u WHERE u.username = :username";
        try {
            Query query = enma.createQuery(jpql);
            query.setParameter("username", username);
            return ((Long) query.getSingleResult()) > 0;
        } finally {
            enma.close();
        }
    }
    
    @Override
    public User findById(int id) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            return enma.find(User.class, id);
        } finally {
            enma.close();
        }
    }

    @Override
    public void updateProfile(User user) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            String jpql = "UPDATE User u SET u.fullname = :fullname, u.phone = :phone, u.avatar = :avatar WHERE u.id = :id";
            var query = enma.createQuery(jpql)
                .setParameter("fullname", user.getFullname())
                .setParameter("phone", user.getPhone())
                .setParameter("avatar", user.getAvatar())
                .setParameter("id", user.getId());
            query.executeUpdate();
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }
}