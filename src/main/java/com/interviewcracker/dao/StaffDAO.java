package com.interviewcracker.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.interviewcracker.entity.Staffs;

public class StaffDAO extends JpaDAO<Staffs> implements GenericDAO<Staffs> {

	public StaffDAO() {
	}
	
	@Override
	public Staffs create(Staffs staff) {
		return super.create(staff);
	}

	@Override
	public Staffs get(Object staffId) {
		return super.find(Staffs.class, staffId);
	}

	public Staffs findByEmail(String email) {
		List<Staffs> listStaffs = super.findWithNamedQuery("Staffs.findByEmail","email",email);
		if(listStaffs !=null && listStaffs.size()>0) {
			return listStaffs.get(0);
		}
		return null;
	}
	
	public boolean checkLogin(String email,String password) {
		Map<String,Object> parameters = new HashMap<>();
		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
		parameters.put("password", encryptedPassword);
		List<Staffs> listStaffs = super.findWithNamedQuery("Staffs.checkLogin", parameters);
		if(listStaffs !=null && listStaffs.size()==1) {
			return true;
		}
		return false;
	}
	
	public Staffs checkLoginwithDetails(String email, String password) {
		Map<String,Object> parameters = new HashMap<>();
		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
		parameters.put("password",encryptedPassword);
		List<Staffs> result = super.findWithNamedQuery("Staffs.checkLogin",parameters);
		if(!result.isEmpty()) {
			result.get(0).setPassword(password);
			return result.get(0);
		}
		return null;
	}

	@Override
	public void delete(Object staffId) {
		super.delete(Staffs.class, staffId);
	}

	@Override
	public List<Staffs> listAll() {
		return super.findWithNamedQuery("Staffs.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Staffs.countAll");
	}

}
