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
	<div class="card one" style="width:40%; min-height:200px; margin-left:30%;margin-top:15%;">
		<h2 style="margin-left:35%;margin-right:auto;">Student Login</h2>
		<h2>&nbsp;</h2>
		<c:if test="${message!=null}">
			<div align="center">
				<h4 class="message">${message}</h4>
			</div>
		</c:if>
		<form id="formLogin" action="login" method="post">
			<table style="margin-left:auto;margin-right:auto;">
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
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="button-1" type="submit">Login</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
	</div>

</body>
</html>