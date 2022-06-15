package com.interviewcracker.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.StaffServices;

@WebServlet("/admin/staff_profile")
public class ShowStaffProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowStaffProfileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		StaffServices staffServices = new StaffServices(request, response);
		staffServices.showStaffProfile();
	}

}
