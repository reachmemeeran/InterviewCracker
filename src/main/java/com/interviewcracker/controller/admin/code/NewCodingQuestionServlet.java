package com.interviewcracker.controller.admin.code;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.CodingQuestionServices;

@WebServlet("/admin/new_codingQuestion")
public class NewCodingQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NewCodingQuestionServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		CodingQuestionServices codingQuestionServices = new CodingQuestionServices(request, response);
		request.getSession().removeAttribute("codingQuestion");
		codingQuestionServices.showCodingQuestionNewForm();
	}

}
