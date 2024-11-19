package com.usermanagement.servlet;

import com.usermanagement.dao.UserRepositoryImpl;
import com.usermanagement.entity.UserEntity;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class UserFetchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserEntity> userList = new UserRepositoryImpl().fetchAllUsers();
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("displayUser.jsp");
        dispatcher.forward(request, response);
    }
}
