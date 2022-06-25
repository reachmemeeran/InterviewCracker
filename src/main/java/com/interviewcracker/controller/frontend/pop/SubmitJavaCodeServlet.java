package com.interviewcracker.controller.frontend.pop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.PopExerciseServices;

@WebServlet("/submit_javacode")
public class SubmitJavaCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SubmitJavaCodeServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		PopExerciseServices popExerciseServices = new PopExerciseServices(request, response);
		popExerciseServices.submitCode("java");
	}

}
