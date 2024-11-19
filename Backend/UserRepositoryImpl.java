package com.usermanagement.dao;

import com.usermanagement.entity.UserEntity;
import com.usermanagement.config.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class UserRepositoryImpl implements UserRepository {

    @Override
    public void saveUser(UserEntity user) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            try {
                session.save(user);
                tx.commit();
            } catch (Exception e) {
                if (tx != null) tx.rollback();
                e.printStackTrace(); // Handle the exception (logging, etc.)
            }
        }
    }

    @Override
    public List<UserEntity> fetchAllUsers() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from UserEntity", UserEntity.class).list();
        }
    }

    @Override
    public UserEntity getUserById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(UserEntity.class, id);
        }
    }

    @Override
    public void updateUser(UserEntity user) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            try {
                session.update(user);
                tx.commit();
            } catch (Exception e) {
                if (tx != null) tx.rollback();
                e.printStackTrace(); // Handle the exception (logging, etc.)
            }
        }
    }

    @Override
    public void deleteUser(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            try {
                UserEntity user = session.get(UserEntity.class, id);
                if (user != null) {
                    session.delete(user);
                }
                tx.commit();
            } catch (Exception e) {
                if (tx != null) tx.rollback();
                e.printStackTrace(); // Handle the exception (logging, etc.)
            }
        }
    }
}
