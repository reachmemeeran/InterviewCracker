package com.interviewcracker.dao;

import java.util.ArrayList;
import java.util.List;

import com.interviewcracker.entity.StudentCodingTest;
import com.interviewcracker.entity.Students;

public class StudentCodingTestDAO extends JpaDAO<StudentCodingTest> implements GenericDAO<StudentCodingTest> {

	@Override
	public StudentCodingTest create(StudentCodingTest studentCodingTest) {
		return super.create(studentCodingTest);
	}

	@Override
	public StudentCodingTest get(Object id) {
		return super.find(StudentCodingTest.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(StudentCodingTest.class,id);
	}

	@Override
	public List<StudentCodingTest> listAll() {
		return super.findWithNamedQuery("StudentCodingTest.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("StudentCodingTest.countAll");
	}
	
	public List<StudentCodingTest> popLeaders(){
		return super.findWithNamedQuery("StudentCodingTest.findAll");
		
		/*List<StudentCodingTest> popLeaders = new ArrayList<>();
		StudentCodingTest studentCodeTest = new StudentCodingTest();
		
		List<Object[]> result = super.findWithNamedQueryObjects("StudentCodingTest.findPOPLeaders",0,10);
		System.out.println("result --> "+result.size());
		
		if (!result.isEmpty()) {
			for (Object[] elements : result) {
				Students student = (Students) elements[0];
				studentCodeTest.setStudents(student);
				popLeaders.add(studentCodeTest);
				System.out.println("elements--->"+elements);
			}
		} 
		
		System.out.println("popLeaders --> "+popLeaders.size());
		
		return popLeaders;*/
	}

}
