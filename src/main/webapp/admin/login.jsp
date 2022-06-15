<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin Login</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<div class="main-container">
		<div class="indexmiddlebar">
			<div align="center">
				<h1>InterviewCracker Administrator</h1>
				<h2>Admin Login</h2>
				
				<c:if test="${message!=null}">
					<div align="center">
						<h4 class="message">
							${message}
						</h4>
					</div>
				</c:if>
				<form id="formLogin" action="login" method="post">
					<table>
						<tr>
							<td>Email:</td>
							<td><input type="text" name="email" id="email" size="20"></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" name="password" id="password" size="20"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button type="submit">Login</button>
							</td>	
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

	$(document).ready(function(){
		$("#formLogin").validate({
			rules: {
				email: {
					required: true,
					email:true
				},
				fullname: "required",
				password: "required",
			},
			messages: {
				email: {
					required: "Please enter email",
					email: "Please enter an valid email address"
				},
				fullname: "Please enter full name",
				password: "Please enter password"
			}
		});
	});
</script>
</html>