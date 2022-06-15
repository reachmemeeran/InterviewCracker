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
	<jsp:directive.include file="header.jsp" />
	<div class="indexmiddlebar">
	<div align="center">
		<h2 class="pageheading">Staffs Management</h2>
	</div>

	<div align="center">
		<h3>
			<a href="staff_form.jsp">Create New Staff</a>
		</h3>
	</div>

	<c:if test="${message!=null}">
		<div align="center">
			<h4 class="message">
				${message}
			</h4>
		</div>
	</c:if>

	<div align="center">
		<table border="1" cellpadding="5">
			<tr>
				<th>Index</th>
				<th>ID</th>
				<th>Email</th>
				<th>Full Name</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="staff" items="${listStaffs}" varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td>${staff.staffId}</td>
					<td>${staff.email}</td>
					<td>${staff.fullname}</td>
					<td>
						<a href="edit_staff?id=${staff.staffId}">Edit</a> &nbsp; 
						<a href="javascript:void(0);" class="deleteLink" id="${staff.staffId}">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

	<jsp:directive.include file="footer.jsp" />

	<script>
	
		$(document).ready(function(){
			$(".deleteLink").each(function(){
				$(this).on("click",function(){
					staffId=$(this).attr("id");
					if(confirm("Are you sure you want to delete the staff with ID " + staffId + " ?")){
						window.location = 'delete_staff?id='+staffId;
					}
				});
			});
		});
	</script>
</body>
</html>