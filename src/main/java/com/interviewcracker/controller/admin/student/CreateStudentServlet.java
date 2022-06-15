package com.interviewcracker.controller.admin.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.StudentServices;


@WebServlet("/admin/create_student")
public class CreateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateStudentServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		StudentServices studentServices = new StudentServices(request, response);
		studentServices.createStudent();
	}

}
