package com.interviewcracker.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.interviewcracker.entity.POPExercises;
import com.interviewcracker.entity.Students;

public class PopExerciseDAO extends JpaDAO<POPExercises> implements GenericDAO<POPExercises> {

	
	@Override
	public POPExercises create(POPExercises popExercises) {
		return super.create(popExercises);
	}

	@Override
	public POPExercises get(Object id) {
		return super.find(POPExercises.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(POPExercises.class,id);
	}

	@Override
	public List<POPExercises> listAll() {
		return super.findWithNamedQuery("POPExercises.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Students.countAll");
	}
	
	public POPExercises findByEmail(String email) {
		List<POPExercises> result = super.findWithNamedQuery("Students.findByEmail","email",email);
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public POPExercises checkLogin(String email, String password) {
		Map<String,Object> parameters = new HashMap<>();
		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
		parameters.put("password",encryptedPassword);
		List<POPExercises> result = super.findWithNamedQuery("Students.checkLogin",parameters);
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	
}
