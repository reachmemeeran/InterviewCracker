package com.interviewcracker.controller.admin.pop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.CodingQuestionServices;

@WebServlet("/admin/update_popExercise")
@MultipartConfig(
		fileSizeThreshold = 1204 * 10, // 10KB
		maxFileSize = 1024*300, // 300KB
		maxRequestSize = 1024*1024 // 1MB
)
public class UpdatePopExerciseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdatePopExerciseServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		CodingQuestionServices codingQuestionServices = new CodingQuestionServices(request, response);
		codingQuestionServices.updateCodingQuestion();
	}

}
