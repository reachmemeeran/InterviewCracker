package com.interviewcracker.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.StaffServices;

@MultipartConfig
@WebServlet("/admin/update_profile")
public class UpdateStaffProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateStaffProfileServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		StaffServices staffServices = new StaffServices(request, response);
		staffServices.updateStaffProfile();
	}

}
