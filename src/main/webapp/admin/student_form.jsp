<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Student</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<div class="main-container">
	<jsp:directive.include file="header.jsp" />
	<div class="card one" style="width:40%; min-height:200px; margin-left:30%;margin-top:10%;">
	<div align="center">

		<h2 class="pageheading">
			<c:if test="${student!=null}">
				Edit Student
			</c:if>
			<c:if test="${student==null}">
				Create New Student
			</c:if>
		</h2>
	</div>
&nbsp;
		<div align="center">
			<c:if test="${student != null}">
				<form action="update_student" method="post" id="studentForm" enctype="multipart/form-data">
					<input type="hidden" name="studentId" value="${student.studentsId}">
					<table style="margin-left:auto;margin-right:auto;">
						<tr>
							<td align="right">Email:</td>
							<td align="left"><b>${student.email }</b>(Cannot be changed)</td>
						</tr>
						<tr>
							<td align="right">Full Name:</td>
							<td align="left"><input type="text" id="fullname" name="fullname" size="45" value="${student.fullname}" /></td>
						</tr>

						<tr>
							<td colspan="2" align="center"><i>(Leave password fields blank, if you don't want to change the password)</i></td>
						</tr>
						<tr>
							<td align="right">Password:</td>
							<td align="left"><input type="password" id="password" name="password" size="45" /></td>
						</tr>
						<tr>
							<td align="right">Confirm Password:</td>
							<td align="left"><input type="password" id="confirmPassword" name="confirmPassword" size="45" /></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button class="button-3" type="submit">Save</button>&nbsp;&nbsp;&nbsp;
								<button class="button-1" id="buttonCancel">Cancel</button>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
			<c:if test="${student == null}">
				<form action="create_student" method="post" id="studentForm" enctype="multipart/form-data">
					<table style="margin-left:auto;margin-right:auto;">
						<tr>
							<td align="right">Email:</td>
							<td align="left"><input type="text" id="email" name="email" size="45" /></td>
						</tr>
						<tr>
							<td align="right">Full Name:</td>
							<td align="left"><input type="text" id="fullname" name="fullname" size="45" /></td>
						</tr>
						<tr>
							<td align="right">Password:</td>
							<td align="left"><input type="password" id="password" name="password" size="45" /></td>
						</tr>
						<tr>
							<td align="right">Confirm Password:</td>
							<td align="left"><input type="password" id="confirmPassword" name="confirmPassword" size="45" /></td>
						</tr>
						<tr>
							<td align="right">Profile Picture:</td>
							<td align="left"><input type="file" id="profilepic" name="profilepic" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button class="button-3" type="submit">Save</button>&nbsp;&nbsp;&nbsp;
								<button class="button-1" id="buttonCancel">Cancel</button>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
		&nbsp;

	</div>

	<jsp:directive.include file="footer.jsp" />
	</div>
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