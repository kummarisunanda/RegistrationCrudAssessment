package com.usermanagement.config;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static SessionFactory sessionFactory;

    // Static block to initialize the SessionFactory
    static {
        try {
            // Create a Configuration object
            Configuration configuration = new Configuration();
            
            // Load Hibernate configuration file (hibernate.cfg.xml)
            configuration.configure("hibernate.cfg.xml");
            
            // Build the SessionFactory object
            sessionFactory = configuration.buildSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError("Failed to initialize Hibernate SessionFactory: " + e.getMessage());
        }
    }

    // Method to get the SessionFactory instance
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    // Method to close the SessionFactory (to be used when application shuts down)
    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}
