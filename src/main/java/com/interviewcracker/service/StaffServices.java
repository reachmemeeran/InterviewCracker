package com.interviewcracker.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.interviewcracker.dao.HashGenerator;
import com.interviewcracker.dao.StaffDAO;
import com.interviewcracker.entity.Staffs;
import com.interviewcracker.entity.Staffs;

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
		
		System.out.println("password->"+staff.getPassword());
		
		
		try {
			//String profilepic = request.getParameter("profilepic");
			Part profilepic = request.getPart("profilepic");
			InputStream inpStm = null;
			
			System.out.println("111111->"+staff.getPassword());
			if(profilepic != null) {
				
				
				
					inpStm = profilepic.getInputStream();
					byte[] bFile = new byte[inpStm.available()];
					inpStm.read(bFile);
					System.out.println("22222->"+bFile.length);
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
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
			dispatcher.forward(request, response);
			
		} else {
			String message = "Login failed!";
			request.setAttribute("message", message);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);			
		}
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