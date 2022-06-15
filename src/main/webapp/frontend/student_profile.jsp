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
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<br/>
		<h2>Welcome, ${loggedStudent.fullname}</h2>
		<br/>
	
	
		<table class="normal">
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
				<td><img src="data:image/jpeg;base64,${profilepic}" style="width:200px;height:300px;"/></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<b><a href="edit_profile">Edit My Profile</a></b>
				</td>
			</tr>
		</table>
	</div>

	<jsp:directive.include file="footer.jsp" />
	</div>
</body>
</html>