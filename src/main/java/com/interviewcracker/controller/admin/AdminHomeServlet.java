package com.interviewcracker.controller.admin;

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

import com.interviewcracker.dao.StaffDAO;
import com.interviewcracker.dao.StudentCodingTestDAO;
import com.interviewcracker.dao.StudentDAO;
import com.interviewcracker.entity.StudentCodingTest;
import com.interviewcracker.entity.Students;
import com.interviewcracker.service.ValueComparator;


@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminHomeServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	StudentDAO studentDAO = new StudentDAO();
    	StaffDAO staffDAO = new StaffDAO();
    	
    	long totalStudents = studentDAO.count();
    	long totalAdmins = staffDAO.count();
    	
    	String homepage = "index.jsp";
		
		request.setAttribute("totalStudents", totalStudents);
		request.setAttribute("totalAdmins", totalAdmins);
		
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
		ValueComparator CustomComparator = new ValueComparator(leaderMap);
        TreeMap<String, Integer> sorted_map = new TreeMap<String, Integer>(CustomComparator);
        if(leaderMap.size()>1) {
			sorted_map.putAll(leaderMap);
			request.setAttribute("leaderMap", sorted_map);
		}else {
			request.setAttribute("leaderMap", leaderMap);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);

	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
