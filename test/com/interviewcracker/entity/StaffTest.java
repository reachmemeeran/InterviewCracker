package com.interviewcracker.entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class StaffTest {

	public static void main(String[] args) {
		Staffs staff1 = new Staffs();
		staff1.setEmail("admincracker@gmail.com");
		staff1.setFullname("Admin Cracker");
		staff1.setPassword("admincracker");
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("InterviewCracker");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		
		entityManager.persist(staff1);
		
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		
		System.out.println("A staff object was persisted");
	}

}
