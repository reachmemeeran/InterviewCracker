package com.interviewcracker.service;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.interviewcracker.dao.CodingQuestionDAO;
import com.interviewcracker.dao.StudentCodingTestDAO;
import com.interviewcracker.dao.StudentDAO;
import com.interviewcracker.entity.CodingQuestion;
import com.interviewcracker.entity.CodingTestCase;
import com.interviewcracker.entity.OkHttpResponse;
import com.interviewcracker.entity.StudentCodingTest;
import com.interviewcracker.entity.Students;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.ResponseBody;

public class CodeServices extends CommonUtility {
	
	private StudentDAO studentDAO;
	private CodingQuestionDAO codingQuestionDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CodeServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.studentDAO = new StudentDAO();
		this.codingQuestionDAO = new CodingQuestionDAO();
	}
	
	public void listCode(String message, List<CodingQuestion> listCodingQuestion) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Students student = (Students) session.getAttribute("loggedStudent");
		Integer studentId = student.getStudentsId();
		StudentCodingTestDAO studentCodingTestDAO = new StudentCodingTestDAO();
		
		for(CodingQuestion code : listCodingQuestion) {
			Character status = studentCodingTestDAO.getExerciseStatus(studentId,code.getCodingQuestionId());
			if(code.getCodeComplexityId()==1) {
				request.setAttribute("complexity", "Easy");
			}else if(code.getCodeComplexityId()==2) {
				request.setAttribute("complexity", "Medium");
			}else if(code.getCodeComplexityId()==3) {
				request.setAttribute("complexity", "Advanced");
			}
			code.setStatus(status);
		}
		request.setAttribute("listCodingQuestion", listCodingQuestion);
		forwardToPage("frontend/code_list.jsp", message, request, response);
	}
	
	public void listCode() throws ServletException, IOException {
		request.setAttribute("attemptedCode", null);
		String fileName = "frontend/codingquestion_list.jsp";
		forwardToPage(fileName, request, response);
	}
	
	public void listEasyCode() throws ServletException, IOException {
		request.setAttribute("attemptedCode", null);
		List<CodingQuestion> listCodingQuestion = codingQuestionDAO.listEasy();
		listCode(null,listCodingQuestion);
	}
	
	public void listMediumCode() throws ServletException, IOException {
		request.setAttribute("attemptedCode", null);
		List<CodingQuestion> listCodingQuestion = codingQuestionDAO.listMedium();
		listCode(null,listCodingQuestion);
	}
	
	public void listAdvancedCode() throws ServletException, IOException {
		request.setAttribute("attemptedCode", null);
		List<CodingQuestion> listCodingQuestion = codingQuestionDAO.listAdvanced();
		listCode(null,listCodingQuestion);
	}
	
	public void attemptCode(Integer exerciseId) throws ServletException, IOException {
		request.setAttribute("exerciseId", exerciseId);
		
		HttpSession session = request.getSession();
		Students student = (Students) session.getAttribute("loggedStudent");
		Integer studentId = student.getStudentsId();
		StudentCodingTestDAO studentCodingTestDAO = new StudentCodingTestDAO();
		
			String attemptedCode = studentCodingTestDAO.getExerciseCode(studentId,exerciseId);
			if(attemptedCode!=null && !attemptedCode.isEmpty()) {
				request.setAttribute("attemptedCode", attemptedCode);
			}else {
				request.setAttribute("attemptedCode", null);
			}
			
		
		
		forwardToPage("frontend/code/"+exerciseId+"_exercise.jsp", request, response);
	}
	
	public void attemptCodeSubmit(Integer exerciseId) throws ServletException, IOException {
		request.setAttribute("exerciseId", exerciseId);
		forwardToPage("frontend/code/"+exerciseId+"_exercise.jsp", request, response);
	}
	
	public void attemptCode() throws ServletException, IOException {
		Integer exerciseId = Integer.parseInt(request.getParameter("id"));
		attemptCode(exerciseId);
	}
	
	
	public void submitCode(String language) throws ServletException, IOException {
		
		String code = request.getParameter("ccode");
		Integer exerciseId = Integer.parseInt(request.getParameter("exerciseId"));
		request.setAttribute("attemptedCode", code);
		
		String answerCode = request.getParameter("answerCode");
		
		// User Answer
		JsonObject rootObject = new JsonObject();
	    rootObject.addProperty("code", code);
	    rootObject.addProperty("language", language);
	    rootObject.addProperty("input", "");
	    
	    Gson gsonC = new Gson();
	    String jsonCString = gsonC.toJson(rootObject);
		
		OkHttpClient client = new OkHttpClient();
		MediaType mediaType = MediaType.parse("application/json; charset=utf-8");
		//RequestBody body = RequestBody.create(mediaType, "{\r\n  \"code\": \"public class Test{ public static void main(String []args) { System.out.println(\\\"Meeran\\\");}}\",\r\n  \"language\": \"java\",\r\n  \"input\": \"\"\r\n}");
		RequestBody body = RequestBody.create(mediaType, jsonCString);

		Request requestBuild = new Request.Builder()
		  .url("https://codex-api.herokuapp.com/")
		  .method("POST", body)
		  .addHeader("Content-Type", "application/json")
		  .build();
		
		Gson gson = new Gson(); 
		ResponseBody responseBody = client.newCall(requestBuild).execute().body(); 
		OkHttpResponse entity = gson.fromJson(responseBody.string(), OkHttpResponse.class);
		//
		
		// Answer
		JsonObject ansObject = new JsonObject();
		ansObject.addProperty("code", answerCode);
		ansObject.addProperty("language", language);
		ansObject.addProperty("input", "");
	    
	    String jsonCAnsString = gsonC.toJson(ansObject);
		
		RequestBody ansBody = RequestBody.create(mediaType, jsonCAnsString);

		Request requestAnsBuild = new Request.Builder()
		  .url("https://codex-api.herokuapp.com/")
		  .method("POST", ansBody)
		  .addHeader("Content-Type", "application/json")
		  .build();
		
		ResponseBody responseAnsBody = client.newCall(requestAnsBuild).execute().body(); 
		OkHttpResponse ansEntity = gson.fromJson(responseAnsBody.string(), OkHttpResponse.class);
		
		if(ansEntity.getOutput()!=null) {
			System.out.println("ansEntity--Output?-->"+ansEntity.getOutput());
		}else if (ansEntity.getError()!=null) {
			System.out.println("ansEntity--Error?-->"+ansEntity.getError());
		}
		
		//
		
		
		if(entity != null) {
			String message = "";
			if (entity.getSuccess()) {
				System.out.println("Entity--Output?-->"+entity.getOutput());
				
				if(entity.getOutput().trim().equals(ansEntity.getOutput().trim())) {
					message = "Successfully passed the test case";
					
					HttpSession session = request.getSession();
					Students student = (Students) session.getAttribute("loggedStudent");
					
					StudentCodingTest studentCodeTest = new StudentCodingTest();
					studentCodeTest.setCodingQuestionId(exerciseId);
					CodingTestCase codingTestCase = new CodingTestCase();
					codingTestCase.setCodingTestCaseId(99999);
					studentCodeTest.setCodingTestCase(codingTestCase);
					studentCodeTest.setStudents(student);
					studentCodeTest.setCode(code);
					studentCodeTest.setHitCount(1);
					studentCodeTest.setStatus('Y');
					
					StudentCodingTestDAO studentCodingTestDAO = new StudentCodingTestDAO();
					studentCodingTestDAO.create(studentCodeTest);
					request.setAttribute("status", "Done");
					
				}else {
					message = "Test Case Failed - Expected output is:\n"+ansEntity.getOutput();
				}
				request.setAttribute("output", entity.getOutput().trim());
			} else {		
				System.out.println("Entity 2--Error?-->"+entity.getError().trim());
				
				message = entity.getError();
				if(message.contains("error")) {
					message=message.substring(message.indexOf("error: ") , message.length());
				}else if(message.contains("warning")) {
					message=message.substring(message.indexOf("warning: ") , message.length());
				}
				request.setAttribute("output", null);
			}
			request.setAttribute("message", message);
			attemptCodeSubmit(exerciseId);
		}
	}
	

	public void showLogin() throws ServletException, IOException {
		forwardToPage("frontend/login.jsp", request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Students student = studentDAO.checkLogin(email, password);
		
		if (student == null) {
			String message = "Login failed. Please check your email and password.";
			request.setAttribute("message", message);
			showLogin();
			
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loggedStudent", student);
			byte[] profilepic = student.getProfilepic(); 
			if(profilepic!=null) {
				String encode = Base64.getEncoder().encodeToString(profilepic);
				session.setAttribute("profilepic", encode);
			}else {
				session.setAttribute("profilepic", null);
			}
			
			Object objRedirectURL = session.getAttribute("redirectURL");
			
			if (objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			} else {
				showStudentIndex();
			}
		}
	}
	
	public void showStudentProfile() throws ServletException, IOException {
		forwardToPage("frontend/student_profile.jsp", request, response);
	}
	
	public void showStudentIndex() throws ServletException, IOException {
		forwardToPage("frontend/index.jsp", request, response);
	}

	public void showStudentProfileEditForm() throws ServletException, IOException {
		forwardToPage("frontend/edit_profile.jsp", request, response);
	}

}
