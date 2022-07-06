package com.interviewcracker.controller.admin;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
		
		processPOP(request);
		processCode(request);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);

	}
	
	void processPOP(HttpServletRequest request) {
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
	}
	
	void processCode(HttpServletRequest request) {
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


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
