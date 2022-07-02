package com.interviewcracker.controller.admin.pop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.CodingQuestionServices;

@WebServlet("/admin/delete_popExercise")
public class DeletePopExerciseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeletePopExerciseServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		CodingQuestionServices codingQuestionServices = new CodingQuestionServices(request, response);
		codingQuestionServices.deleteCodingQuestion();
	}

}
