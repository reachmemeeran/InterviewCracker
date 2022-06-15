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
@MultipartConfig(
		fileSizeThreshold = 1204 * 10, // 10KB
		maxFileSize = 1024*1024, // 1MB
		maxRequestSize = 1024*1024*5 // 5MB
)
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
