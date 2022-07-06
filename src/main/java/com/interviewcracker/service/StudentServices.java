package com.interviewcracker.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.interviewcracker.dao.HashGenerator;
import com.interviewcracker.dao.StudentCodingTestDAO;
import com.interviewcracker.dao.StudentDAO;
import com.interviewcracker.entity.StudentCodingTest;
import com.interviewcracker.entity.Students;

public class StudentServices extends CommonUtility {
	
	private StudentDAO studentDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public StudentServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.studentDAO = new StudentDAO();
	}
	
	public void listStudents(String message) throws ServletException, IOException {
		List<Students> listStudents = studentDAO.listAll();		
		request.setAttribute("listStudents", listStudents);
		forwardToPage("student_list.jsp", message, request, response);
	}
	
	public void listStudents() throws ServletException, IOException {
		listStudents(null);
	}
	
	public void createStudent() throws ServletException, IOException {
		String email = request.getParameter("email");
		Students existStudents = studentDAO.findByEmail(email);
		
		if (existStudents != null) {
			String message = "Could not create new student: the email "
					+ email + " is already registered by another student.";
			listStudents(message);
			
		} else {
			Students newStudents = new Students();
			updateStudentFieldsFromForm(newStudents);
			studentDAO.create(newStudents);
			
			String message = "New student has been created successfully.";
			listStudents(message);
			
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
		if (password != null & !password.isEmpty()) {
			String encryptedPassword = HashGenerator.generateMD5(password);
			student.setPassword(encryptedPassword);				
		}		
		
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
			
			Students studentById = studentDAO.get(studentId);
			updateStudentFieldsFromForm(studentById);
			
			studentDAO.update(studentById);
			
			message = "The student has been updated successfully.";
		}
		
		listStudents(message);
	}

	public void deleteStudent() throws ServletException, IOException {
		Integer studentId = Integer.parseInt(request.getParameter("id"));
		Students student = studentDAO.get(studentId);
		
		if (student != null) {
			studentDAO.delete(studentId);			
			String message = "The student has been deleted successfully.";
			listStudents(message);
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
		
		processPOP();
		processCode();
		
		forwardToPage("frontend/index.jsp", request, response);
	}
	
	void processPOP(){
		StudentCodingTestDAO studentCodingTestDAO=new StudentCodingTestDAO();
		List<StudentCodingTest> listPopLeaders = studentCodingTestDAO.popLeaders();
		Map<String,Integer> leaderMap = new HashMap<>();
		StudentDAO studentDao = new StudentDAO();
		for(StudentCodingTest leader: listPopLeaders ) {
			Students student = studentDao.get(leader.getStudentId());
			String name = student.getFullname();
			if(leaderMap.containsKey(name)) {
				Integer value = leaderMap.get(name);
				leaderMap.put(name, value+1);
			}else {
				leaderMap.put(name, +1);
			}
		}
		
		Map<String,Integer>  sorted_map = newSortMapByValue(leaderMap);
        if(leaderMap.size()>1) {
			sorted_map.putAll(leaderMap);
			int i=1;
			Map<String, Integer> sorted_pop_map = new HashMap<>();
			for (Map.Entry<String, Integer> entry : sorted_map.entrySet()) {
				String name = entry.getKey();
			     if(name.contains(" ")){
			    	 name= name.substring(0, name.indexOf(" ")); 
			     }
	        	if(i==1) {
	        		request.setAttribute("pop1key", name);
	        		request.setAttribute("pop1value", entry.getValue());
	        	}else if(i==2) {
	        		request.setAttribute("pop2key", name);
	        		request.setAttribute("pop2value", entry.getValue());
	        	}else if(i==3) {
	        		request.setAttribute("pop3key", name);
	        		request.setAttribute("pop3value", entry.getValue());
	        	}
	        	if(i<=5) {
	        		sorted_pop_map.put(entry.getKey(), entry.getValue());
	        	}else {
	        		break;
	        	}
	        	i++;
	        }
			sorted_pop_map = newSortMapByValue(sorted_pop_map);
			request.setAttribute("leaderMap", sorted_pop_map);
		}else {
			request.setAttribute("leaderMap", leaderMap);
		}
        
		long solvedExercise = studentCodingTestDAO.countSolvedExercise();
		request.setAttribute("solvedExercise", solvedExercise);
		
		HttpSession session = request.getSession();
		Students student = (Students) session.getAttribute("loggedStudent");
		if(student!=null) {
			Integer studentId = student.getStudentsId();
			long solvedStudentExercise = studentCodingTestDAO.countSolvedStudentExercise(studentId);
			request.setAttribute("solvedStudentExercise", solvedStudentExercise);
			String studentName = student.getFullname();
			int rank = 0;
			for (String key : sorted_map.keySet()) {
				rank++;
				if(key.equals(studentName)) {
					break;
				}
			}
			if(!sorted_map.containsKey(studentName)) {
				rank=0;
			}
			request.setAttribute("rank", rank);
		}
	}
	
	public static <K extends Comparable<? super K>, V extends Comparable<? super V>> Map<K, V> newSortMapByValue(Map<K, V> map) {
        List<Map.Entry<K, V>> list = new LinkedList<>(map.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<K, V>>() {
            @Override
            public int compare(Map.Entry<K, V> e1, Map.Entry<K, V> e2) {
                // Check if values are the same
                if (e1.getValue().equals(e2.getValue()))
                    // Compare e1 to e2, because A should be first element
                    return e1.getKey().compareTo(e2.getKey());
                else
                    // Compare e2 to e1, because largest number should be first
                    return e2.getValue().compareTo(e1.getValue());
            }
        });

        Map<K, V> result = new LinkedHashMap<>();
        for (Map.Entry<K, V> entry : list) {
            result.put(entry.getKey(), entry.getValue());
        }
        return result;
	}
	
	void processCode(){
		StudentCodingTestDAO studentCodingTestDAO=new StudentCodingTestDAO();
		List<StudentCodingTest> listcodeLeaders = studentCodingTestDAO.codeLeaders();
		Map<String,Integer> leaderMap = new HashMap<>();
		StudentDAO studentDao = new StudentDAO();
		for(StudentCodingTest leader: listcodeLeaders ) {
			Students student = studentDao.get(leader.getStudentId());
			String name = student.getFullname();
			if(leaderMap.containsKey(name)) {
				Integer value = leaderMap.get(name);
				leaderMap.put(name, value+1);
			}else {
				leaderMap.put(name, +1);
			}
		}
		
        Map<String, Integer> sorted_map = newSortMapByValue(leaderMap);
        Map<String, Integer> sorted_code_map = new HashMap<String, Integer>();
        if(leaderMap.size()>1) {
        	sorted_map.putAll(leaderMap);
			int i=1;
			for (Map.Entry<String, Integer> entry : sorted_map.entrySet()) {
				String name = entry.getKey();
			     if(name.contains(" ")){
			    	 name= name.substring(0, name.indexOf(" ")); 
			     }
	        	if(i==1) {
	        		request.setAttribute("code1key", name);
	        		request.setAttribute("code1value", entry.getValue());
	        	}else if(i==2) {
	        		request.setAttribute("code2key", name);
	        		request.setAttribute("code2value", entry.getValue());
	        	}else if(i==3) {
	        		request.setAttribute("code3key", name);
	        		request.setAttribute("code3value", entry.getValue());
	        	}
	        	if(i<=5) {
	        		sorted_code_map.put(entry.getKey(), entry.getValue());
	        	}else {
	        		break;
	        	}
	        	i++;
	        }
			sorted_code_map = newSortMapByValue(sorted_code_map);
			request.setAttribute("codeleaderMap", sorted_code_map);
		}else {
			request.setAttribute("codeleaderMap", leaderMap);
		}
        
		long solvedCode = studentCodingTestDAO.countSolvedCode();
		request.setAttribute("solvedCode", solvedCode);
		
		HttpSession session = request.getSession();
		Students student = (Students) session.getAttribute("loggedStudent");
		if(student!=null) {
			Integer studentId = student.getStudentsId();
			long solvedStudentCode = studentCodingTestDAO.countSolvedStudentCode(studentId);
			request.setAttribute("solvedStudentCode", solvedStudentCode);
			String studentName = student.getFullname();
			int codeRank = 0;
			for (String key : sorted_map.keySet()) {
				codeRank++;
				if(key.equals(studentName)) {
					break;
				}
			}
			
			if(!sorted_map.containsKey(studentName)) {
				codeRank=0;
			}
			request.setAttribute("codeRank", codeRank);
		}
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
