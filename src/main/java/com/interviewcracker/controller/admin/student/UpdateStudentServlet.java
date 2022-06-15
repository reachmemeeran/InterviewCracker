package com.interviewcracker.controller.admin.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.StudentServices;

@WebServlet("/admin/update_student")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateStudentServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		StudentServices studentServices = new StudentServices(request, response);
		studentServices.updateStudent();
	}

}
