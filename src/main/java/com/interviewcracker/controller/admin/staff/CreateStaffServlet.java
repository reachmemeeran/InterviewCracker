package com.interviewcracker.controller.admin.staff;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.StaffServices;

@WebServlet("/admin/create_staff")
public class CreateStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		StaffServices staffSerices = new StaffServices(request, response);
		staffSerices.createStaff();
	}

}
