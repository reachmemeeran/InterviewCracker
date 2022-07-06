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

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.interviewcracker.dao.HashGenerator;
import com.interviewcracker.dao.StaffDAO;
import com.interviewcracker.dao.StudentCodingTestDAO;
import com.interviewcracker.dao.StudentDAO;
import com.interviewcracker.entity.Staffs;
import com.interviewcracker.entity.StudentCodingTest;
import com.interviewcracker.entity.Students;

public class StaffServices extends CommonUtility {
	private StaffDAO staffDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public StaffServices(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
		staffDAO = new StaffDAO();
	}

	public void listStaff()
			throws ServletException, IOException {
		listStaff(null);
	}

	public void listStaff(String message)
			throws ServletException, IOException {
		List<Staffs> listStaffs = staffDAO.listAll();

		request.setAttribute("listStaffs", listStaffs);

		if (message != null) {
			request.setAttribute("message", message);
		}

		String listPage = "staff_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);

		requestDispatcher.forward(request, response);

	}

	public void createStaff() throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");

		Staffs existStaff = staffDAO.findByEmail(email);
		
		if (existStaff != null) {
			String message = "Could not create staff. A staff with email " 
								+ email + " already exists";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
			
		} else {		
			Staffs newStaff = new Staffs(email, fullName, password);
			staffDAO.create(newStaff);
			listStaff("New staff created successfully");
		}

	}

	public void editStaff() throws ServletException, IOException {
		int staffId = Integer.parseInt(request.getParameter("id"));
		Staffs staff = staffDAO.get(staffId );

		String destPage = "staff_form.jsp";
		
		if (staff == null) {
			destPage = "message.jsp";
			String errorMessage = "Could not find staff with ID " + staffId;
			request.setAttribute("message", errorMessage);
		} else {
			// set password as null to make the password is left blank by default
			// if left blank, the staff's password won't be updated
			// this is to work with the encrypted password feature
			staff.setPassword(null);
			request.setAttribute("staff", staff);			
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
		requestDispatcher.forward(request, response);
		
	}

	public void updateStaff() throws ServletException, IOException {
		int staffId = Integer.parseInt(request.getParameter("staffId"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		Staffs staffById = staffDAO.get(staffId);
		
		Staffs staffByEmail = staffDAO.findByEmail(email);
		
		if (staffByEmail != null && staffByEmail.getStaffId() != staffById.getStaffId()) {
			String message = "Could not update staff. Staff with email " + email + " already exists.";
			request.setAttribute("message", message);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);			
			
		} else {
			staffById.setEmail(email);
			staffById.setFullname(fullName);
			
			if (password != null & !password.isEmpty()) {
				String encryptedPassword = HashGenerator.generateMD5(password);
				staffById.setPassword(encryptedPassword);				
			}
			
			staffDAO.update(staffById);

			String message = "Staff has been updated successfully";
			listStaff(message);
		}
		
	}
	
	private void updateStaffFieldsFromForm(Staffs staff) {
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		
		
		if (email != null && !email.equals("")) {
			staff.setEmail(email);
		}
		
		staff.setFullname(fullname);
		if (password != null & !password.isEmpty()) {
			staff.setPassword(password);
		}
		
		/*
		 * if (password != null & !password.isEmpty()) { String encryptedPassword =
		 * HashGenerator.generateMD5(password); staff.setPassword(encryptedPassword); }
		 */	
		
		
		
		try {
			//String profilepic = request.getParameter("profilepic");
			Part profilepic = request.getPart("profilepic");
			InputStream inpStm = null;
			
			if(profilepic != null) {
				inpStm = profilepic.getInputStream();
				byte[] bFile = new byte[inpStm.available()];
				inpStm.read(bFile);
				if(bFile.length>0) {
					staff.setProfilepic(bFile);
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


	public void deleteStaff() throws ServletException, IOException {
		int staffId = Integer.parseInt(request.getParameter("id"));
		
		String message = "Staff has been deleted successfully";
		
		if (staffId == 1) {
			message = "The default admin staff account cannot be deleted.";
			
			request.setAttribute("message", message);
			request.getRequestDispatcher("message.jsp").forward(request, response);
			return;
		}
		
		Staffs staff = staffDAO.get(staffId);		
		
		if (staff == null) {
			message = "Could not find staff with ID " + staffId
					+ ", or it might have been deleted by another admin";
			
			request.setAttribute("message", message);
			request.getRequestDispatcher("message.jsp").forward(request, response);			
		} else {
			staffDAO.delete(staffId);
			listStaff(message);
		}		
	}
	
	public void editProfile() throws ServletException, IOException {
		int staffId = Integer.parseInt(request.getParameter("id"));
		Staffs staff = staffDAO.get(staffId );

		String destPage = "staff_form.jsp";
		
		if (staff == null) {
			destPage = "message.jsp";
			String errorMessage = "Could not find staff with ID " + staffId;
			request.setAttribute("message", errorMessage);
		} else {
			// set password as null to make the password is left blank by default
			// if left blank, the staff's password won't be updated
			// this is to work with the encrypted password feature
			staff.setPassword(null);
			request.setAttribute("staff", staff);			
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
		requestDispatcher.forward(request, response);
		
	}
	
	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//boolean loginResult = staffDAO.checkLogin(email, password);
		Staffs loggedStaff = staffDAO.checkLoginwithDetails(email, password);
		
		if (loggedStaff!=null) {
			request.getSession().setAttribute("staffemail", email);
			
			HttpSession session = request.getSession();
			session.setAttribute("loggedStaff", loggedStaff);
			byte[] profilepic = loggedStaff.getProfilepic(); 
			if(profilepic!=null) {
				String encode = Base64.getEncoder().encodeToString(profilepic);
				session.setAttribute("profilepic", encode);
			}else {
				session.setAttribute("profilepic", null);
			}
			
			
			processPOP(request);
			processCode(request);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
			dispatcher.forward(request, response);
			
		} else {
			String message = "Login failed!";
			request.setAttribute("message", message);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);			
		}
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

	public void showStaffProfile() throws ServletException, IOException {
		forwardToPage("staff_profile.jsp", request, response);
	}
	
	public void showStaffProfileEditForm() throws ServletException, IOException {
		forwardToPage("edit_profile.jsp", request, response);
	}
	
	public void updateStaffProfile() throws ServletException, IOException {
		Staffs staff = (Staffs) request.getSession().getAttribute("loggedStaff");
		String password = staff.getPassword();
		updateStaffFieldsFromForm(staff);
		staffDAO.update(staff);
		
		staff.setPassword(password);
		byte[] profilepic = staff.getProfilepic(); 
		if(profilepic!=null) {
			String encode = Base64.getEncoder().encodeToString(profilepic);
			request.getSession().setAttribute("profilepic", encode);
		}else {
			request.getSession().setAttribute("profilepic", null);
		}
		
		request.getSession().setAttribute("loggedStaff", staff);
		
		showStaffProfile();
		
	}
}