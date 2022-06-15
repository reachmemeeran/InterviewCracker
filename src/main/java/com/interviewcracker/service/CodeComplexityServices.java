package com.interviewcracker.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interviewcracker.dao.CodeComplexityDAO;
import com.interviewcracker.dao.CodingQuestionDAO;
import com.interviewcracker.entity.CodeComplexity;

public class CodeComplexityServices {
	private CodeComplexityDAO codeComplexityDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CodeComplexityServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		codeComplexityDAO = new CodeComplexityDAO();
	}
	
	public void listCodeComplexity() 
			throws ServletException, IOException{
		listCodeComplexity(null);
	}
	
	public void listCodeComplexity(String message) throws ServletException, IOException {
		List<CodeComplexity> listCodeComplexity =  codeComplexityDAO.listAll();
		request.setAttribute("listCodeComplexity", listCodeComplexity);
		
		if(message !=null) {
			request.setAttribute("message", message);
		}
		
		String listPage ="codecomplexity_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}
	
	public void createCodeComplexity() throws ServletException, IOException {
		String name = request.getParameter("name");
		CodeComplexity existCodeComplexity = codeComplexityDAO.findByName(name);
		if(existCodeComplexity!=null) {
			String message = "Could not create CodeComplexity. A existCodeComplexity with email "+ name + " already exists";
			request.setAttribute("message", message);
			String listPage ="message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
			requestDispatcher.forward(request, response);
		}else {
			CodeComplexity newCodeComplexity= new CodeComplexity(name);
			codeComplexityDAO.create(newCodeComplexity);
			listCodeComplexity("New CodeComplexity Created Successfully");
		}
	}

	public void editCodeComplexity() throws ServletException, IOException {
		Integer codeComplexityId = Integer.parseInt(request.getParameter("id"));
		CodeComplexity codeComplexity = codeComplexityDAO.get(codeComplexityId);
		String destPage = "codecomplexity_form.jsp";
		if(codeComplexity!=null) {
			request.setAttribute("codeComplexity", codeComplexity);
			
		}else {
			String message = "Could not find CodeComplexity with ID " +codeComplexityId;
			request.setAttribute("message", message);
			destPage ="message.jsp";
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
		requestDispatcher.forward(request, response);		
	}

	public void updateCategroy() throws ServletException, IOException {
		int codeComplexityId = Integer.parseInt(request.getParameter("codeComplexityId"));
		String name = request.getParameter("name");
		
		CodeComplexity codeComplexityById = codeComplexityDAO.get(codeComplexityId);
		
		CodeComplexity codeComplexityByName = codeComplexityDAO.findByName(name);
	
		if(codeComplexityByName != null && codeComplexityByName.getCodeComplexityId()!=codeComplexityById.getCodeComplexityId()) {
			String message = "Could not update CodeComplexity. CodeComplexity with Name " + name + " already Exists";
			request.setAttribute("message", message);
			String listPage ="message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
			requestDispatcher.forward(request, response);
			
		}else {
			codeComplexityById.setComplexityDesc(name);
			codeComplexityDAO.update(codeComplexityById);
			
			String message="CodeComplexity has been Updated Successfully";
			listCodeComplexity(message);
		}		
	}

	public void deleteCodeComplexity() throws ServletException, IOException {
		int codeComplexityId = Integer.parseInt(request.getParameter("id"));
		String message;
		CodeComplexity codeComplexity = codeComplexityDAO.get(codeComplexityId);
		if (codeComplexity == null) {
			message = "Could not find codeComplexity with ID " + codeComplexityId
					+ ", or it might have been deleted";
			request.setAttribute("message", message);
			request.getRequestDispatcher("message.jsp").forward(request, response);
			return;
		}
		
		CodingQuestionDAO codingQuestionDAO = new CodingQuestionDAO();
		long numberOfCodingQuestions = codingQuestionDAO.countByCodeComplexity(codeComplexityId);
				
		if (numberOfCodingQuestions > 0) {
			message = "Could not delete the codeComplexity (ID: " + codeComplexityId + ") because it currently contains some codingQuestions.";
			message = String.format(message, numberOfCodingQuestions);
		} else {
			codeComplexityDAO.delete(codeComplexityId);		
			message = "The codeComplexity with ID " + codeComplexityId + " has been removed successfully.";
		}
		listCodeComplexity(message);
		
	}
}
