package com.interviewcracker.controller.frontend;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interviewcracker.dao.StudentCodingTestDAO;
import com.interviewcracker.dao.StudentDAO;
import com.interviewcracker.entity.StudentCodingTest;
import com.interviewcracker.entity.Students;
import com.interviewcracker.service.ValueComparator;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		StudentCodingTestDAO studentCodingTestDAO=new StudentCodingTestDAO();
		List<StudentCodingTest> listPopLeaders = studentCodingTestDAO.popLeaders();
		
		System.out.println("result --> "+listPopLeaders.size());
		
		Map<String,Integer> leaderMap = new HashMap<>();
		
		StudentDAO studentDao = new StudentDAO();

		
		for(StudentCodingTest leader: listPopLeaders ) {
			
			Students student = studentDao.get(leader.getStudentId());
			
			
			String name = student.getFullname();
			System.out.println("name--->"+name);
		
			if(leaderMap.containsKey(name)) {
				Integer value = leaderMap.get(name);
				leaderMap.put(name, value+1);
			}else {
				leaderMap.put(name, +1);
			}
		}
		
		System.out.println("leaderMap--->"+leaderMap.toString());
		
		
		ValueComparator CustomComparator = new ValueComparator(leaderMap);
        TreeMap<String, Integer> sorted_map = new TreeMap<String, Integer>(CustomComparator);
        if(leaderMap.size()>1) {
			sorted_map.putAll(leaderMap);
			request.setAttribute("leaderMap", sorted_map);
		}else {
			request.setAttribute("leaderMap", leaderMap);
		}
        
        System.out.println("sorted_map--->"+sorted_map.toString());
        
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
			
			if (sorted_map.containsKey(studentName)) {
				rank = sorted_map.headMap(studentName).size();
	        }
			request.setAttribute("rank", rank);
		}
		String homePage= "frontend/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homePage);
		dispatcher.forward(request, response);
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	*/

}
