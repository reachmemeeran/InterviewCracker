<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>POP Exercises</title>
	
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/jquery-ui.min.css">
	
	<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="popmiddlebar">
	<div align="center">

		<h2 class="pageheading">
			POP Exercises
		</h2>
	</div>

	<div align="center">
		<h3>
			
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
				<th>Week</th>
				<th>Lesson</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="popExercise" items="${listPOPExercises}" varStatus="status">
				<tr>
					<td>${popExercise.popExerciseId}</td>
					<td>${popExercise.week}</td>
					<td>${popExercise.lesson}</td>
					<td>
						<a href="attempt_exercise?id=${popExercise.popExerciseId}">Attempt Exercise</a> &nbsp; 
<%-- 						<a href="javascript:void(0);" class="deleteLink" id="${popExercise.popExerciseId}">Delete</a>
 --%>					</td>
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
					popExerciseId=$(this).attr("id");
					if(confirm("Are you sure you want to delete the student with ID " + popExerciseId + " ?")){
						window.location = 'delete_student?id='+popExerciseId;
					}
				});
			});
		});
	</script>
</body>
</html>