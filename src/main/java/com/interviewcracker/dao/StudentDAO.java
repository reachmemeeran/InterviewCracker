package com.interviewcracker.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.interviewcracker.entity.Students;

public class StudentDAO extends JpaDAO<Students> implements GenericDAO<Students> {

	
	@Override
	public Students create(Students student) {
		return super.create(student);
	}

	@Override
	public Students get(Object id) {
		return super.find(Students.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Students.class,id);
	}

	@Override
	public List<Students> listAll() {
		return super.findWithNamedQuery("Students.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Students.countAll");
	}
	
	public Students findByEmail(String email) {
		List<Students> result = super.findWithNamedQuery("Students.findByEmail","email",email);
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public Students checkLogin(String email, String password) {
		Map<String,Object> parameters = new HashMap<>();
		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
		parameters.put("password",encryptedPassword);
		List<Students> result = super.findWithNamedQuery("Students.checkLogin",parameters);
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	
}
