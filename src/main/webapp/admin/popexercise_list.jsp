<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>POP Exercises</title>
	
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/jquery-ui.min.css">
	
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="poplistmiddlebar">
	<div align="center">

		<h2 class="pageheading">
			POP Exercises Management
		</h2>
	</div>
	
	<p>&nbsp;</p>
	<div align="center">
			<h3>
				<a href=popexercise_form.jsp>Create New POP Exercise</a>
			</h3>
		</div>

		<p>&nbsp;</p>

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
	
	<div align="center" style="height:400px;">
			<table border="1" cellpadding="5">
				<tr>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Index</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">ID</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Week</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Lesson</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Language</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Actions</th>
					<th>&nbsp;</th>
				</tr>
				<c:forEach var="popExercise" items="${listPOPExercises}"
					varStatus="status">
						<tr>
							<td style="background-color:#002B5636">${status.index + 1}</td>
							<td style="background-color:#002B5636">${popExercise.popExerciseId}</td>
							<td style="background-color:#002B5636">${popExercise.week}</td>
							<td style="background-color:#002B5636">${popExercise.lesson}</td>
							<td style="background-color:#002B5636">${popExercise.language}</td>
							<td>
								<a href="edit_codingQuestion?id=${popExercise.popExerciseId}">Edit</a> &nbsp; 
								<a href="javascript:void(0);" class="deleteLink" id="${popExercise.popExerciseId}">Delete</a>
							</td>
							<td> &nbsp;</td>
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
		
		fn:contains(){
			boolean contains(java.lang.String, java.lang.String)
		}
	</script>
</body>
</html>