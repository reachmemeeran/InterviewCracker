<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Profile - InterviewCracker</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="main-container">
	<jsp:directive.include file="header.jsp" />

	<div class="card one" style="width:40%; min-height:200px; margin-left:30%;margin-top:10%;">
		<br/>
		<h2 style="margin-left:15%;margin-right:auto;">Welcome, ${loggedStudent.fullname}</h2>
		<br/>
	
	
		<table style="margin-left:auto;margin-right:auto;">
			<tr>
				<td><b>E-mail Address:</b></td>
				<td>${loggedStudent.email}</td>
			</tr>
			<tr>
				<td><b>Full Name:</b></td>
				<td>${loggedStudent.fullname}</td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td><b>Profile Picture:</b></td>
				<td><img src="data:image/jpeg;base64,${profilepic}" style="width:250px;height:250px;"/></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<b><a class="button-1" href="edit_profile">Edit My Profile</a></b>
				</td>
			</tr>
		</table>
	</div>

	<jsp:directive.include file="footer.jsp" />
	</div>
</body>
</html>