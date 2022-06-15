package com.interviewcracker.controller.admin.codecomplexity;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.CodeComplexityServices;

@WebServlet("/admin/update_codeComplexity")
public class UpdateCodeComplexityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateCodeComplexityServlet() {
    	super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		CodeComplexityServices codeComplexityServices = new CodeComplexityServices(request, response);
		codeComplexityServices.updateCategroy();
	}

}
