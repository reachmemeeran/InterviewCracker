<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create New Staff</title>
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
			<c:if test="${staff!=null}">
				Edit Staff
			</c:if>
			<c:if test="${staff==null}">
				Create New Staff
			</c:if>
		</h2>
	</div>

	<div align="center">
		<c:if test="${staff!=null}">
			<form action="update_staff" method="post" id="staffForm">
				<input type="hidden" name="staffId" value="${staff.staffId}">
		</c:if>
		<c:if test="${staff==null}">
			<form action="create_staff" method="post" id="staffForm">
		</c:if>
		
		&nbsp;

		<table style="margin-left:auto;margin-right:auto;">
			<tr>
				<td align="right">Email:</td>
				<td align="left"><input type="text" id="email" name="email"
					size="20" value="${staff.email}" /></td>
			</tr>
			<tr>
				<td align="right">Full Name:</td>
				<td align="left"><input type="text" id="fullname"
					name="fullname" size="20" value="${staff.fullname}" /></td>
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" id="password"
					name="password" size="20" value="${staff.password}" /></td>
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
		</div>
	</div>


	<jsp:directive.include file="footer.jsp" />
	</div>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		$("#staffForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
		
				fullname: "required",
				
				<c:if test="${staff == null}">
				password: "required"
				</c:if>
			},
			
			messages: {
				email: {
					required: "Please enter email",
					email: "Please enter an valid email address"
				},
				
				fullname: "Please enter full name",
				
				<c:if test="${staff == null}">
				password: "Please enter password"
				</c:if>				
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
</script>
</html>