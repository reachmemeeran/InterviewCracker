package com.interviewcracker.controller.frontend.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.StudentServices;

@MultipartConfig
@WebServlet("/update_profile")
public class UpdateStudentProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateStudentProfileServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		StudentServices studentServices = new StudentServices(request, response);
		studentServices.updateStudentProfile();
	}

}
