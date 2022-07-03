<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Register as a Student</title>
	
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/jquery-ui.min.css">
	
	<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
<div class="main-container">
	<jsp:directive.include file="header.jsp" />
	<div class="card one" style="min-width:40%; min-height:250px; margin-left:30%;margin-top:15%;">

		<h2 style="margin-left:35%;margin-right:auto;">
			Register as a Student
		</h2>
		<form action="register_student" method="post" id="studentForm" enctype="multipart/form-data">

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
				<td align="left"><input type="password" id="password" name="password" size="45"  /></td>
			</tr>
			<tr>
				<td align="right">Confirm Password:</td>
				<td align="left"><input type="password" id="confirmPassword" name="confirmPassword" size="45"  /></td>
			</tr>
			<tr>
				<td align="right">Profile Picture:</td>
				<td align="left"><input type="file" id="profilepic" name="profilepic"  /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="button-3" style="float:right;margin-right:80px;margin-top:8px;" type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button class="button-1" style="margin-top:8px;" type="BUTTON" value="Cancel" id="buttonCancel">Cancel</button>
				</td>
			</tr>
		</table>
		</form>
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
				password: "required",
				confirmPassword: {
					required: true,
					equalTo: "#password",
				},
			},
			
			messages: {
				email: {
					required: "Please enter the e-mail address",
					email: "Please enter a valid e-mail address"
				},
				fullname: "Please enter Full Name of the Student",
				password: "Please enter Password of the Student",
				confirmPassword: {
					required: "Please enter Confirm Password of the Student",
					equalTo: "Confirm Password does not match the password",
				},
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
	
</script>
</html>