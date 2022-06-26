package com.interviewcracker.controller.frontend.code;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.CodeServices;
import com.interviewcracker.service.PopExerciseServices;

@MultipartConfig
@WebServlet("/list_code")
public class ListCodeExerciseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListCodeExerciseServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		CodeServices codeServices = new CodeServices(request, response);
		codeServices.listCode();
	}

}
