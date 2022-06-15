package com.interviewcracker.controller.admin.staff;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.StaffServices;

@WebServlet("/admin/list_staffs")
public class ListStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListStaffServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		StaffServices staffServices = new StaffServices(request, response);
		staffServices.listStaff();
	}
}
