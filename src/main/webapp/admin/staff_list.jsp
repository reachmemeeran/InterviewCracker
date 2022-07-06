<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Staffs - InterviewCracker Administration</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<div class="main-container">
	<jsp:directive.include file="header.jsp" />
	<div class="card one" style="width:60%; min-height:200px; margin-left:25%;margin-top:10%;">
	
		<div align="center">
			<h3>
				Staffs Management
			</h3>
		</div>

	<div align="center">
		<h3>
			<a class="button-1" href="staff_form.jsp">Create New Staff</a>
		</h3>
	</div>

	<c:if test="${message!=null}">
		<div align="center">
			<h4 class="message">
				${message}
			</h4>
		</div>
	</c:if>
	
	&nbsp;

		<table style="margin-left:auto;margin-right:auto;">
			<tr>
				<th>Index</th>
				<th>ID</th>
				<th>Email</th>
				<th>Full Name</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="staff" items="${listStaffs}" varStatus="status">
				<tr>
					<td>
						<p class="num">${status.index+1}</p>
					</td>
					<td style="width:100px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
						<p class="link" style="margin:0.4rem">${staff.staffId}</p>
					</td>
					<td style="width:200px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
						<p class="link" style="margin:0.4rem">${staff.email}</p>
					</td>
					<td style="width:200px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
						<p class="link" style="margin:0.4rem">${staff.fullname}</p>
					</td>
					<td style="width:200px; padding: .01rem 2%;">
						<a class="button-3" href="edit_staff?id=${staff.staffId}">Edit</a> &nbsp; 
						<a class="button-1" onclick="deleteFunction(this.id);" id="${staff.staffId}">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		&nbsp;
	</div>
</div>

	<jsp:directive.include file="footer.jsp" />

	<script>
		function deleteFunction(staffId) {
			console.log("Staff id: " + staffId);
			if(confirm("Are you sure you want to delete the staff with ID " + staffId + " ?")){
				window.location = 'delete_staff?id='+staffId;
			}
		}
	</script>
</body>
</html>