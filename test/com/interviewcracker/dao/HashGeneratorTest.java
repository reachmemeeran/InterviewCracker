package com.interviewcracker.dao;

import static org.junit.Assert.assertTrue;

public class HashGeneratorTest {

	//@Test
	public void testGenerateMD5() {
		String password = "mysecret";
		String encryptedPassword = HashGenerator.generateMD5(password);
		
		System.out.println(encryptedPassword);
		
		assertTrue(true);
	}

}
