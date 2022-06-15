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
@WebServlet("/edit_profile")
public class EditStudentProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditStudentProfileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		StudentServices studentServices = new StudentServices(request, response);
		studentServices.showStudentProfileEditForm();
	}

}
