<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Student - InterviewCracker Administration</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="indexmiddlebar">
	<div align="center">
		<h2 class="pageheading">Student Management</h2>
	</div>

	<div align="center">
		<h3>
			<a href="student_form.jsp">Create New Student</a>
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
				<th>E-Mail</th>
				<th>Full Name</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="student" items="${listStudents}" varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td>${student.studentsId}</td>
					<td>${student.email}</td>
					<td>${student.fullname}</td>
					<td>
						<a href="edit_student?id=${students.student}">Edit</a> &nbsp; 
						<a href="javascript:void(0);" class="deleteLink" id="${students.student}">Delete</a>
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
					studentId=$(this).attr("id");
					if(confirm("Are you sure you want to delete the student with ID " + studentId + " ?")){
						window.location = 'delete_student?id='+studentId;
					}
				});
			});
		});
	</script>
</body>
</html>