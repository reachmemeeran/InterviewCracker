<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

	<div class="main-container">
		<jsp:directive.include file="header.jsp" />
		<div class="card one"
			style="width: 80%; min-height: 200px; margin-left: 10%; margin-top: 10%;">


			<div align="center">
				<h3 class="pageheading">POP Exercises</h3>
			</div>

			<c:if test="${message!=null}">
				<div align="center">
					<h4 class="message">${message}</h4>
				</div>
			</c:if>

			<div align="center">
				<h3>
					<a class="button-1" href="popexercise_form.jsp">Create New POP
						Exercise</a>
				</h3>
			</div>

			<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<th>Index</th>
					<th>Week</th>
					<th>Lesson</th>
					<th>Language</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="popExercise" items="${listPOPExercises}"
					varStatus="status">
					<tr>
						<td>
							<p class="num">${popExercise.popExerciseId}</p>
						</td>
						<td
							style="width: 400px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
							<p class="link" style="margin: 0.4rem">${popExercise.week}</p>
						</td>
						<td
							style="width: 300px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
							<p class="link" style="margin: 0.4rem">${popExercise.lesson}</p>
						</td>
						<td
							style="width: 50px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
							<p class="link" style="margin: 0.4rem">${popExercise.language}</p>
						</td>
						<td style="width: 200px; border-radius: 30px; padding: .01rem 2%;">
							<a class="button-3"
							href="edit_popExercise?id=${popExercise.popExerciseId}">Edit</a>
							<a class="button-1" onclick="deleteFunction(this.id);"
							id="${popExercise.popExerciseId}">Delete</a>
						</td>


					</tr>
				</c:forEach>


			</table>
			<p>&nbsp;</p>
			<p>&nbsp;</p>

		</div>
	</div>

	<jsp:directive.include file="footer.jsp" />

	<script>
		function deleteFunction(exerciseId) {
			console.log("Exercise id: " + exerciseId);
			if (confirm('Are you sure you want to delete the POP Exercise with ID '
					+ exerciseId + '?')) {
				window.location = 'delete_popExercise?id=' + exerciseId;
			}
		}
	</script>
</body>
</html>