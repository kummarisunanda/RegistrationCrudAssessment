package com.usermanagement.servlet;

import com.usermanagement.entity.UserEntity;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.usermanagement.dao.UserRepositoryImpl;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserEditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        String mobileNumber = request.getParameter("mobileNumber");

        // Convert dateOfBirth from String to Date
        Date dateOfBirth = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            dateOfBirth = sdf.parse(dateOfBirthStr);
        } catch (Exception e) {
            e.printStackTrace();
        }

        UserEntity user = new UserEntity();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setDateOfBirth(dateOfBirth);
        user.setMobileNumber(mobileNumber);

        new UserRepositoryImpl().updateUser(user);

        response.sendRedirect("displayUsers.jsp");
    }
}
