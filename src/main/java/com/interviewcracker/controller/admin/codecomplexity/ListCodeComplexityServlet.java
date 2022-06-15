package com.interviewcracker.controller.admin.codecomplexity;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.CodeComplexityServices;

@WebServlet("/admin/list_codeComplexity")
public class ListCodeComplexityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListCodeComplexityServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		CodeComplexityServices codeComplexityservices = new CodeComplexityServices(request, response);
		codeComplexityservices.listCodeComplexity();
	}
}
