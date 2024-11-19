package com.usermanagement.servlet;

import com.usermanagement.entity.UserEntity;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.usermanagement.dao.UserRepositoryImpl;


import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

public class UserRegistrationServlet extends HttpServlet {
	 
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String dateOfBirthStr = request.getParameter("dateOfBirth");
	        String mobileNumber = request.getParameter("mobileNumber");

	        // Convert dateOfBirth from String to Date
	        java.util.Date dateOfBirth = null;
	        try {
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            dateOfBirth = sdf.parse(dateOfBirthStr);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        UserEntity user = new UserEntity();
	        user.setName(name);
	        user.setEmail(email);
	        user.setDateOfBirth(dateOfBirth);
	        user.setMobileNumber(mobileNumber);

	        new UserRepositoryImpl().saveUser(user);

	        response.sendRedirect("displayUsers.jsp");
	    }
}
