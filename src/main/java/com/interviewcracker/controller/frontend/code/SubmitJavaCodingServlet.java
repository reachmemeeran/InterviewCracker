package com.interviewcracker.controller.frontend.code;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.CodeServices;

@WebServlet("/submit_javacoding")
public class SubmitJavaCodingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SubmitJavaCodingServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		CodeServices codeServices = new CodeServices(request, response);
		codeServices.submitCode("java");
	}

}
