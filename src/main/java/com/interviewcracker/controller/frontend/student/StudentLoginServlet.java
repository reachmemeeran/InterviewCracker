package com.interviewcracker.controller.frontend.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.StudentServices;

@WebServlet("/login")
public class StudentLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		StudentServices studentServices = new StudentServices(request, response);
		studentServices.showLogin();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		StudentServices studentServices = new StudentServices(request, response);
		studentServices.doLogin();
	}

}
