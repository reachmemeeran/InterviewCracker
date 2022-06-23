package com.interviewcracker.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.interviewcracker.dao.HashGenerator;
import com.interviewcracker.dao.PopExerciseDAO;
import com.interviewcracker.dao.StudentCodingTestDAO;
import com.interviewcracker.dao.StudentDAO;
import com.interviewcracker.entity.CodingQuestion;
import com.interviewcracker.entity.CodingTestCase;
import com.interviewcracker.entity.OkHttpResponse;
import com.interviewcracker.entity.POPExercises;
import com.interviewcracker.entity.StudentCodingTest;
import com.interviewcracker.entity.Students;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.ResponseBody;

public class PopExerciseServices extends CommonUtility {
	
	private StudentDAO studentDAO;
	private PopExerciseDAO popExerciseDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public PopExerciseServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.studentDAO = new StudentDAO();
		this.popExerciseDAO = new PopExerciseDAO();
	}
	
	public void listExercises(String message) throws ServletException, IOException {
		List<POPExercises> listPOPExercises = popExerciseDAO.listAll();		
		request.setAttribute("listPOPExercises", listPOPExercises);
		forwardToPage("frontend/popexercise_list.jsp", message, request, response);
	}
	
	public void listExercises() throws ServletException, IOException {
		listExercises(null);
	}
	
	public void attemptExercise(Integer exerciseId) throws ServletException, IOException {
		request.setAttribute("exerciseId", exerciseId);
		forwardToPage("frontend/popexercises/"+exerciseId+"_exercise.jsp", request, response);
	}
	
	public void attemptExercise() throws ServletException, IOException {
		Integer exerciseId = Integer.parseInt(request.getParameter("id"));
		System.out.println("Exercise id--> "+exerciseId);
		attemptExercise(exerciseId);
	}
	
	public void submitCCode() throws ServletException, IOException {
		
		String code = request.getParameter("ccode");
		Integer exerciseId = Integer.parseInt(request.getParameter("exerciseId"));
		
		request.setAttribute("attemptedCode", code);
		
		
		String answerCode = request.getParameter("answerCode");
		
		System.out.println("Code from Form-->"+code);
		
		
		JsonObject rootObject = new JsonObject();
	    rootObject.addProperty("code", code);
	    rootObject.addProperty("language", "c");
	    rootObject.addProperty("input", "");
	    
	    Gson gsonC = new Gson();
	    
	    String jsonCString = gsonC.toJson(rootObject);
	    
	    System.out.println("jsonCString--->"+jsonCString);
		
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
		
		
		
		if(entity != null) {
			String message = "";
			if (entity.getSuccess()) {
				System.out.println("Entity 1--IS Success?-->"+entity.getSuccess());
				System.out.println("Entity 2--Output?-->"+entity.getOutput().trim());
				System.out.println("Entity 3--Timestamp-->"+entity.getTimestamp());
				System.out.println("Entity 4--Language-->"+entity.getLanguage());
				
				if(entity.getOutput().trim().equals(answerCode.trim())) {
					message = "Successfully passed the test case";
					
					HttpSession session = request.getSession();
					Students student = (Students) session.getAttribute("loggedStudent");
					System.out.println("studentId--->"+student.getStudentsId());
					
					StudentCodingTest studentCodeTest = new StudentCodingTest();
					CodingQuestion codeQuestion = new CodingQuestion();
					codeQuestion.setCodingQuestionId(99999);
					studentCodeTest.setCodingQuestion(codeQuestion);
					CodingTestCase codingTestCase = new CodingTestCase();
					codingTestCase.setCodingTestCaseId(99999);
					studentCodeTest.setCodingTestCase(codingTestCase);
					studentCodeTest.setStudents(student);
					studentCodeTest.setHitCount(1);
					studentCodeTest.setStatus('Y');
					
					StudentCodingTestDAO studentCodingTestDAO = new StudentCodingTestDAO();
					studentCodingTestDAO.create(studentCodeTest);
					request.setAttribute("status", "Done");
					
				}else {
					message = "Test Case Failed - Expected output is: "+answerCode.trim();
				}
				request.setAttribute("output", entity.getOutput().trim());
			} else {		
				System.out.println("Entity 1--IS Success?-->"+entity.getSuccess());
				System.out.println("Entity 2--Output?-->"+entity.getError().trim());
				System.out.println("Entity 3--Timestamp-->"+entity.getTimestamp());
				System.out.println("Entity 4--Language-->"+entity.getLanguage());
				
				message = entity.getError();
				message=message.substring(message.indexOf("error: ") , message.length());
				request.setAttribute("output", null);
			}
			request.setAttribute("message", message);
			attemptExercise(exerciseId);
		}
	}
	
	public void createStudent() throws ServletException, IOException {
		String email = request.getParameter("email");
		System.out.println("email--````->"+email);
		Students existStudents = studentDAO.findByEmail(email);
		
		if (existStudents != null) {
			String message = "Could not create new student: the email "
					+ email + " is already registered by another student.";
			listExercises(message);
			
		} else {
			Students newStudents = new Students();
			updateStudentFieldsFromForm(newStudents);
			studentDAO.create(newStudents);
			
			String message = "New student has been created successfully.";
			listExercises(message);
			
		}
		
	}
	
	private void updateStudentFieldsFromForm(Students student) {
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		
		
		if (email != null && !email.equals("")) {
			student.setEmail(email);
		}
		
		student.setFullname(fullname);
		System.out.println("email--->"+email);
		System.out.println("fullname--->"+fullname);
		System.out.println("password--->"+password);
		
		if (password != null & !password.isEmpty()) {
			String encryptedPassword = HashGenerator.generateMD5(password);
			student.setPassword(encryptedPassword);				
		}		
		
		System.out.println("password-22-->"+student.getPassword());
		
		
		try {
			//String profilepic = request.getParameter("profilepic");
			Part profilepic = request.getPart("profilepic");
			InputStream inpStm = null;
			if(profilepic != null) {
				
					inpStm = profilepic.getInputStream();
					byte[] bFile = new byte[inpStm.available()];
					inpStm.read(bFile);
					if(bFile.length>0) {
						student.setProfilepic(bFile);
					}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

 	public void registerStudent() throws ServletException, IOException {
		String email = request.getParameter("email");
		Students existStudents = studentDAO.findByEmail(email);
		String message = "";
		
		if (existStudents != null) {
			message = "Could not register. The email "
					+ email + " is already registered by another student.";
		} else {
			
			Students newStudents = new Students();
			updateStudentFieldsFromForm(newStudents);			
			studentDAO.create(newStudents);
			
			message = "You have registered successfully! Thank you.<br/>"
					+ "<a href='login'>Click here</a> to login";			
		}
		
		showMessageFrontend(message, request, response);
	}	
	
	public void editStudent() throws ServletException, IOException {
		Integer studentId = Integer.parseInt(request.getParameter("id"));
		Students student = studentDAO.get(studentId);
		
		if (student == null) {
			String message = "Could not find student with ID " + studentId;
			showMessageBackend(message, request, response);
		} else {
			// set password as null to make the password is left blank by default
			// if left blank, the student's password won't be updated
			// this is to work with the encrypted password feature
			student.setPassword(null);
			request.setAttribute("student", student);	
			request.setAttribute("studentId", student.getStudentsId());
			forwardToPage("student_form.jsp", request, response);		
		}		
	}

	public void updateStudent() throws ServletException, IOException {
		Integer studentId = Integer.parseInt(request.getParameter("studentId"));
		String email = request.getParameter("email");
		
		Students studentByEmail = studentDAO.findByEmail(email);
		String message = null;
		
		if (studentByEmail != null && studentByEmail.getStudentsId() != studentId) {
			message = "Could not update the student ID " + studentId
					+ "because there's an existing student having the same email.";
			
		} else {
			
			System.out.println("studentId--->"+studentId);
			Students studentById = studentDAO.get(studentId);
			System.out.println("studentById--->"+studentById.getEmail());
			updateStudentFieldsFromForm(studentById);
			
			studentDAO.update(studentById);
			
			message = "The student has been updated successfully.";
		}
		
		listExercises(message);
	}

	public void deleteStudent() throws ServletException, IOException {
		Integer studentId = Integer.parseInt(request.getParameter("id"));
		Students student = studentDAO.get(studentId);
		
		if (student != null) {
			studentDAO.delete(studentId);			
			String message = "The student has been deleted successfully.";
			listExercises(message);
		} else {
			String message = "Could not find student with ID " + studentId + ", "
					+ "or it has been deleted by another admin";
			showMessageBackend(message, request, response);
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

	public void updateStudentProfile() throws ServletException, IOException {
		Students student = (Students) request.getSession().getAttribute("loggedStudent");
		updateStudentFieldsFromForm(student);
		studentDAO.update(student);
		
		showStudentProfile();
		
	}
}
