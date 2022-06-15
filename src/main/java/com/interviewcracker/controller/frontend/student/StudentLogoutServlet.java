package com.interviewcracker.controller.frontend.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class StudentLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentLogoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getSession().removeAttribute("loggedStudent");
		response.sendRedirect(request.getContextPath());
	}

}
