package com.interviewcracker.controller.admin.pop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.service.PopExerciseServices;

@WebServlet("/admin/list_pop_exercise")
public class ListPopExercisesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListPopExercisesServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		PopExerciseServices popExerciseServices = new PopExerciseServices(request, response);
		popExerciseServices.listExercisesAdmin(null);
	}

}