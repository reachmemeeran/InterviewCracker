<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Student Login</title>
</head>
<body>
<div class="main-container">
	<jsp:directive.include file="header.jsp" />
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2>Student Login</h2>
		<c:if test="${message!=null}">
			<div align="center">
				<h4 class="message">${message}</h4>
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
					<td><input type="password" name="password" id="password"
						size="20"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">Login</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
	</div>

</body>
</html>