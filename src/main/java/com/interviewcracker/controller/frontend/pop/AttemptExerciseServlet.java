package com.interviewcracker.controller.frontend.pop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.PopExerciseServices;

@WebServlet("/attempt_exercise")
public class AttemptExerciseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AttemptExerciseServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		PopExerciseServices popExerciseServices = new PopExerciseServices(request, response);
		popExerciseServices.attemptExercise();
	}

}
