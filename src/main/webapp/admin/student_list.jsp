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
	<div class="main-container">
	<jsp:directive.include file="header.jsp" />
	<div class="card one" style="width:70%; min-height:200px; margin-left:15%;margin-top:10%;">
	
	<div align="center">
		<h3 class="pageheading">Student Management</h3>
	</div>

	<div align="center">
		<h3>
			<a class="button-1" href="student_form.jsp">Create New Student</a>
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
				<th>E-Mail</th>
				<th>Full Name</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="student" items="${listStudents}" varStatus="status">
				<tr>
					<td>
						<p class="num">${status.index+1}</p>
					</td>
					<td style="width:50px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
						<p class="link" style="margin:0.4rem">${student.studentsId}</p>
					</td>
					<td style="width:300px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
						<p class="link" style="margin:0.4rem">${student.email}</p>
					</td>
					<td style="width:300px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
						<p class="link" style="margin:0.4rem">${student.fullname}</p>
					</td>
					<td style="width:200px; padding: .01rem 2%;">
						<a class="button-3" href="edit_student?id=${student.studentsId}">Edit</a> &nbsp; 
						<a class="button-1" onclick="deleteFunction(this.id);" id="${student.studentsId}">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		&nbsp;
	</div>
</div>

	<jsp:directive.include file="footer.jsp" />

	<script>
		function deleteFunction(studentId) {
			console.log("studentId: " + studentId);
			if(confirm("Are you sure you want to delete the student with ID " + studentId + " ?")){
				window.location = 'delete_student?id='+studentId;
			}
		}
	</script>
</body>
</html>