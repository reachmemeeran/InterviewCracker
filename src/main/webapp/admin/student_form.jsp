<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Create New Student</title>
	
	<link rel="stylesheet" href="../css/style.css" >
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
	<div class="indexmiddlebar">
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${student != null}">
				Edit Student
			</c:if>
			<c:if test="${student == null}">
				Create New Student
			</c:if>
		</h2>
	</div>
	
	<div align="center">
		<c:if test="${student != null}">
			<form action="update_student" method="post" id="studentForm">
			<input type="hidden" name="studentId" value="${student.studentId}">
		</c:if>
		<c:if test="${student == null}">
			<form action="create_student" method="post" id="studentForm">
		</c:if>
		
		<table class="form">
			<tr>
				<td align="right">E-mail:</td>
				<td align="left"><input type="text" id="email" name="email" size="45" value="${student.email}" /></td>
			</tr>
			<tr>
				<td align="right">Full Name:</td>
				<td align="left"><input type="text" id="fullname" name="fullname" size="45" value="${student.fullname}" /></td>
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" id="password" name="password" size="45" value="${student.password}" /></td>
			</tr>
			<tr>
				<td align="right">Confirm Password:</td>
				<td align="left"><input type="password" id="confirmPassword" name="confirmPassword" size="45" value="${student.password}" /></td>
			</tr>			
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button id="buttonCancel">Cancel</button>
				</td>
			</tr>				
		</table>
		</form>
	</div>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">

	$(document).ready(function() {
		$("#studentForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				fullname: "required",
				
				<c:if test="${student == null}">
				password: "required",
				</c:if>
				
				confirmPassword: {
					<c:if test="${student == null}">
					required: true,
					</c:if>
					equalTo: "#password"
				},
				
			},
			
			messages: {
				email: {
					required: "Please enter e-mail address",
					email: "Please enter a valid e-mail address"
				},
				
				fullname: "Please enter full name",
				
				<c:if test="${student == null}">
				password: "Please enter password",
				</c:if>
				
				confirmPassword: {
					<c:if test="${student == null}">
					required: "Please confirm password",
					</c:if>
					equalTo: "Confirm password does not match password"
				},
				
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});	
</script>
</html>