package com.interviewcracker.controller.admin.code;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.CodingQuestionServices;

@WebServlet("/admin/create_codingQuestion")
public class CreateCodingQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreateCodingQuestionServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		CodingQuestionServices codingQuestionServices = new CodingQuestionServices(request, response);
		codingQuestionServices.createCodingQuestion();
	}

}
