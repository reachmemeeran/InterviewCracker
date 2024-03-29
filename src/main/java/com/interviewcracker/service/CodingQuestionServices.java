package com.interviewcracker.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.interviewcracker.dao.CodeComplexityDAO;
import com.interviewcracker.dao.CodingQuestionDAO;
import com.interviewcracker.entity.CodeComplexity;
import com.interviewcracker.entity.CodingQuestion;

public class CodingQuestionServices extends CommonUtility {
	
	private CodingQuestionDAO codingQuestionDAO;
	private CodeComplexityDAO codeComplexityDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CodingQuestionServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		codingQuestionDAO = new CodingQuestionDAO();
		codeComplexityDAO = new CodeComplexityDAO();
	}

	public void listCodingQuestion() 
			throws ServletException, IOException{
		listCodingQuestion(null);
	}
	
	public void listCodingQuestion(String message) throws ServletException, IOException {
		List<CodingQuestion> listcodingQuestions =  codingQuestionDAO.listAll();
		request.setAttribute("listcodingQuestions", listcodingQuestions);
		List<CodeComplexity> listCodeComplexity = codeComplexityDAO.listAll();
		request.setAttribute("listCodeComplexity", listCodeComplexity);
		
		if(message !=null) {
			request.setAttribute("message", message);
		}
		
		String listPage ="codingquestion_list.jsp";
		
		CommonUtility.forwardToPage(listPage, request, response);
	}
	
	public void showCodingQuestionNewForm() throws ServletException, IOException {
		
		String listPage ="codingquestion_form.jsp";
		
		List<CodeComplexity> listCodeComplexity = codeComplexityDAO.listAll();
		request.setAttribute("listCodeComplexity", listCodeComplexity);
		
		CommonUtility.forwardToPage(listPage, request, response);
	}

	public void createCodingQuestion() throws ServletException, IOException {
		Integer codeComplexityId = Integer.parseInt(request.getParameter("codeComplexityId"));
		String summary = request.getParameter("summary");
		String question = request.getParameter("question");
		String output = request.getParameter("output");
		String lesson = request.getParameter("lesson");
		String code = request.getParameter("code");
		String anscode = request.getParameter("anscode");
		
		CodingQuestion existCodingQuestion = codingQuestionDAO.findBySummary(summary);
		
		if(existCodingQuestion !=null) {
			String message = "Could not create new codingQuestion because the summary '" + summary + "' already Exists";
			listCodingQuestion(message);
			return;
		}
		
		CodingQuestion newCodingQuestion = new CodingQuestion();
		newCodingQuestion.setCodeComplexityId(codeComplexityId);
		newCodingQuestion.setSummary(summary);
		newCodingQuestion.setQuestion(question);
		newCodingQuestion.setOutput(output);
		newCodingQuestion.setLesson(lesson);
		newCodingQuestion.setCode(code);
		newCodingQuestion.setAnscode(anscode);
		newCodingQuestion.setStatus('N');
		
		CodingQuestion createdCodingQuestion = codingQuestionDAO.create(newCodingQuestion);
		
		if(createdCodingQuestion.getCodingQuestionId()>0) {
			String message = "A new CodingQuestion has been created successfully.";
			listCodingQuestion(message);
		}
	}
	
	public void readCodingQuestionFields(CodingQuestion codingQuestion) throws ServletException, IOException {
		Integer codeComplexityId = Integer.parseInt(request.getParameter("codeComplexity"));
		String title = request.getParameter("summary");
		
	}

	public void editCodingQuestion() throws ServletException, IOException {
		Integer codingQuestionId = Integer.parseInt(request.getParameter("id"));
		CodingQuestion codingQuestion = codingQuestionDAO.get(codingQuestionId);
		String destPage = "codingquestion_form.jsp";
		
		if (codingQuestion != null) {
			List<CodeComplexity> listCodeComplexity = codeComplexityDAO.listAll();
			
			request.setAttribute("codingQuestion", codingQuestion);
			request.setAttribute("listCodeComplexity", listCodeComplexity);
			
		} else {
			destPage = "message.jsp";
			String message = "Could not find codingQuestion with ID " + codingQuestionId;
			request.setAttribute("message", message);			
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
		requestDispatcher.forward(request, response);	
	}

	public void updateCodingQuestion() throws ServletException, IOException {
		Integer codingQuestionId = Integer.parseInt(request.getParameter("codingQuestionId"));
		Integer codeComplexityId = Integer.parseInt(request.getParameter("codeComplexityId"));
		String summary = request.getParameter("summary");
		String question = request.getParameter("question");
		String output = request.getParameter("output");
		String lesson = request.getParameter("lesson");
		String code = request.getParameter("code");
		String anscode = request.getParameter("anscode");
		
		CodingQuestion existCodingQuestion = new CodingQuestion();
		existCodingQuestion.setCodingQuestionId(codingQuestionId);
		existCodingQuestion.setCodeComplexityId(codeComplexityId);
		existCodingQuestion.setSummary(summary);
		existCodingQuestion.setQuestion(question);
		existCodingQuestion.setOutput(output);
		existCodingQuestion.setLesson(lesson);
		existCodingQuestion.setCode(code);
		existCodingQuestion.setAnscode(anscode);
		existCodingQuestion.setStatus('N');
		
		codingQuestionDAO.update(existCodingQuestion);
		
		String message = "The codingQuestion has been updated successfully.";
		listCodingQuestion(message);
	}

	public void deleteCodingQuestion() throws ServletException, IOException {
		Integer codingQuestionId = Integer.parseInt(request.getParameter("id"));
		codingQuestionDAO.delete(codingQuestionId);
		String message = "The codingQuestion has been deleted successfully.";
		listCodingQuestion(message);
	}

	public void listCodingQuestionByCodeComplexity() throws ServletException, IOException {
		int codeComplexityId = Integer.parseInt(request.getParameter("id"));
		
		
		CodeComplexity codeComplexity = codeComplexityDAO.get(codeComplexityId);
		
		if (codeComplexity == null) {
			String message = "Sorry, the codeComplexity ID " + codeComplexityId + " is not available.";
			request.setAttribute("message", message);
			request.getRequestDispatcher("frontend/message.jsp").forward(request, response);
			
			return;
		}
		request.setAttribute("codeComplexity", codeComplexity);
		
		List<CodingQuestion> listCodingQuestion = codingQuestionDAO.listByCodeComplexity(codeComplexityId);
		request.setAttribute("listCodingQuestion", listCodingQuestion);
		
		String listPage ="frontend/codingQuestions_list_by_codeComplexity.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void viewCodingQuestionDetail() throws ServletException, IOException {
		int codingQuestionId = Integer.parseInt(request.getParameter("id"));
		CodingQuestion codingQuestion = codingQuestionDAO.get(codingQuestionId);
		
		String destPage ="frontend/codingquestion_detail.jsp";
		
		if (codingQuestion != null) {
			request.setAttribute("codingQuestion", codingQuestion);
			
		} else {
			destPage = "frontend/message.jsp";
			String message = "Sorry, the codingQuestion with ID " + codingQuestionId + " is not available.";
			request.setAttribute("message", message);			
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
		requestDispatcher.forward(request, response);
	}

	public void search() throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		List<CodingQuestion> result = null;
		if(keyword.equals("")) {
			result = codingQuestionDAO.listAll();
		} else {
			result = codingQuestionDAO.search(keyword);
		}
		request.setAttribute("keyword", keyword);
		request.setAttribute("result", result);
		
		String resultPage ="frontend/search_result.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(resultPage);
		requestDispatcher.forward(request, response);
	}
}
