package com.interviewcracker.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.interviewcracker.entity.Staffs;

public class StaffDAOTest {

	private static StaffDAO staffDAO;
	
	@BeforeClass
	public static void setupClass() throws Exception {
		staffDAO = new StaffDAO();
	}

	@Test
	public void testCreateStaffs() {
		Staffs staff1 = new Staffs();
		staff1.setEmail("admincracker@admin.com");
		staff1.setFullname("Admin Cracker");
		staff1.setPassword("adminadmin");
		
		staff1 = staffDAO.create(staff1);
		
		assertTrue(staff1.getStaffId()>0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateStaffsFieldNotSet() {
		Staffs staff1 = new Staffs();
		staff1 = staffDAO.create(staff1);

	}
	
	@Test
	public void testUpdateStaffs() {
		Staffs staff = new Staffs();
		staff.setStaffId(1);
		staff.setEmail("admincracker@admin.com");
		staff.setFullname("Admin Cracker");
		staff.setPassword("secretadmin");
		
		staffDAO.update(staff);
		String expected = "ea909ccfbf42c1d230f26167db4d4fdb";
		String actual = staff.getPassword();
		assertEquals(expected, actual);
	}
	
	@Test
	public void testGetStaffsFound() {
		Integer staffId=1;
		Staffs staff = staffDAO.get(staffId);
		if (staff != null){
			System.out.println(staff.getEmail());
		}
		assertNotNull(staff);
	}
	
	@Test
	public void testGetStaffsNotFound() {
		Integer staffId=2;
		Staffs staff = staffDAO.get(staffId);
		if (staff != null){
			System.out.println(staff.getEmail());
		}
		assertNull(staff);
	}
	
	@Test
	public void testDeleteStaff() {
		Integer staffId=4;
		staffDAO.delete(staffId);
		Staffs staff = staffDAO.get(staffId);
		assertNull(staff);
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeleteNonExistStaff() {
		Integer staffId=5;
		staffDAO.delete(staffId);
	}
	
	@Test
	public void testListAll() {
		List<Staffs> listStaffs = staffDAO.listAll();
		for(Staffs staff: listStaffs) {
			System.out.println(staff.getEmail());
		}
		assertTrue(listStaffs.size()>0);
	}
	
	@Test
	public void testCountAll() {
		long totalStaffs = staffDAO.count();
		System.out.println(totalStaffs);
		assertEquals(1, totalStaffs);
	}
	
	@Test
	public void testCheckLoginSuccess() {
		String email="admincracker@admin.com";
		String password = "secretadmin";
		boolean loginResult = staffDAO.checkLogin(email, password);
		assertTrue(loginResult);
	}
	
	@Test
	public void testCheckLoginFail() {
		String email="admincracker@admin.com";
		String password = "meeran";
		boolean loginResult = staffDAO.checkLogin(email, password);
		assertFalse(loginResult);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "admincracker@admin.com";
		Staffs staff = staffDAO.findByEmail(email);
		assertNotNull(staff);
	}


	@AfterClass
	public static void tearDownClass() throws Exception {
		staffDAO.close();
	}
}
