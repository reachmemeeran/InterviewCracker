<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
	<div class="poplistmiddlebar">
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
				<th style="background-color:#002B56; color:#FFF; padding: 10px;">Index</th>
				<th style="background-color:#002B56; color:#FFF; padding: 10px;">Week</th>
				<th style="background-color:#002B56; color:#FFF; padding: 10px;">Lesson</th>
				<th style="background-color:#002B56; color:#FFF; padding: 10px;">Actions</th>
			</tr>
			<c:forEach var="popExercise" items="${listPOPExercises}" varStatus="status">
				<tr style="padding: 10px">
				<c:if test = "${fn:contains(popExercise.week, 'Week 1: Writing')}">
					<td style="background-color:#002B5636">${popExercise.popExerciseId}</td>
					<td style="background-color:#002B5636">${popExercise.week}</td>
					<td style="background-color:#002B5636">${popExercise.lesson}</td>
					<td style="background-color:#002B5636">
						<c:if test="${fn:contains(popExercise.status, 'Y')}">
							<a style="color:#3CA234" href="attempt_exercise?id=${popExercise.popExerciseId}">Solved</a> &nbsp; 
						</c:if>
						<c:if test="${fn:contains(popExercise.status, 'N')}">
							<a style="color:#BD1B1B" href="attempt_exercise?id=${popExercise.popExerciseId}">Solve Exercise</a> &nbsp; 
						</c:if>
 					</td>
				</c:if>
				<c:if test = "${fn:contains(popExercise.week, 'Week 2')}">
					<td style="background-color:#BCD6F0">${popExercise.popExerciseId}</td>
					<td style="background-color:#BCD6F0">${popExercise.week}</td>
					<td style="background-color:#BCD6F0">${popExercise.lesson}</td>
					<td style="background-color:#BCD6F0">
						<c:if test="${fn:contains(popExercise.status, 'Y')}">
							<a style="color:#3CA234" href="attempt_exercise?id=${popExercise.popExerciseId}">Solved</a> &nbsp; 
						</c:if>
						<c:if test="${fn:contains(popExercise.status, 'N')}">
							<a style="color:#BD1B1B" href="attempt_exercise?id=${popExercise.popExerciseId}">Solve Exercise</a> &nbsp; 
						</c:if>
 					</td>
				</c:if>
				<c:if test = "${fn:contains(popExercise.week, 'Week 3')}">
					<td style="background-color:#002B5636">${popExercise.popExerciseId}</td>
					<td style="background-color:#002B5636">${popExercise.week}</td>
					<td style="background-color:#002B5636">${popExercise.lesson}</td>
					<td style="background-color:#002B5636">
						<c:if test="${fn:contains(popExercise.status, 'Y')}">
							<a style="color:#3CA234" href="attempt_exercise?id=${popExercise.popExerciseId}">Solved</a> &nbsp; 
						</c:if>
						<c:if test="${fn:contains(popExercise.status, 'N')}">
							<a style="color:#BD1B1B" href="attempt_exercise?id=${popExercise.popExerciseId}">Solve Exercise</a> &nbsp; 
						</c:if>
 					</td>
				</c:if>
				<c:if test = "${fn:contains(popExercise.week, 'Week 5')}">
					<td style="background-color:#BCD6F0">${popExercise.popExerciseId}</td>
					<td style="background-color:#BCD6F0">${popExercise.week}</td>
					<td style="background-color:#BCD6F0">${popExercise.lesson}</td>
					<td style="background-color:#BCD6F0">
						<c:if test="${fn:contains(popExercise.status, 'Y')}">
							<a style="color:#3CA234" href="attempt_exercise?id=${popExercise.popExerciseId}">Solved</a> &nbsp; 
						</c:if>
						<c:if test="${fn:contains(popExercise.status, 'N')}">
							<a style="color:#BD1B1B" href="attempt_exercise?id=${popExercise.popExerciseId}">Solve Exercise</a> &nbsp; 
						</c:if>
 					</td>
				</c:if>
				<c:if test = "${fn:contains(popExercise.week, 'Week 7')}">
					<td style="background-color:#002B5636">${popExercise.popExerciseId}</td>
					<td style="background-color:#002B5636">${popExercise.week}</td>
					<td style="background-color:#002B5636">${popExercise.lesson}</td>
					<td style="background-color:#002B5636">
						<c:if test="${fn:contains(popExercise.status, 'Y')}">
							<a style="color:#3CA234" href="attempt_exercise?id=${popExercise.popExerciseId}">Solved</a> &nbsp; 
						</c:if>
						<c:if test="${fn:contains(popExercise.status, 'N')}">
							<a style="color:#BD1B1B" href="attempt_exercise?id=${popExercise.popExerciseId}">Solve Exercise</a> &nbsp; 
						</c:if>
 					</td>
				</c:if>
				<c:if test = "${fn:contains(popExercise.week, 'Week 8')}">
					<td style="background-color:#BCD6F0">${popExercise.popExerciseId}</td>
					<td style="background-color:#BCD6F0">${popExercise.week}</td>
					<td style="background-color:#BCD6F0">${popExercise.lesson}</td>
					<td style="background-color:#BCD6F0">
						<c:if test="${fn:contains(popExercise.status, 'Y')}">
							<a style="color:#3CA234" href="attempt_exercise?id=${popExercise.popExerciseId}">Solved</a> &nbsp; 
						</c:if>
						<c:if test="${fn:contains(popExercise.status, 'N')}">
							<a style="color:#BD1B1B" href="attempt_exercise?id=${popExercise.popExerciseId}">Solve Exercise</a> &nbsp; 
						</c:if>
 					</td>
				</c:if>
				<c:if test = "${fn:contains(popExercise.week, 'Week 10: Object')}">
					<td style="background-color:#002B5636">${popExercise.popExerciseId}</td>
					<td style="background-color:#002B5636">${popExercise.week}</td>
					<td style="background-color:#002B5636">${popExercise.lesson}</td>
					<td style="background-color:#002B5636">
						<c:if test="${fn:contains(popExercise.status, 'Y')}">
							<a style="color:#3CA234" href="attempt_exercise?id=${popExercise.popExerciseId}">Solved</a> &nbsp; 
						</c:if>
						<c:if test="${fn:contains(popExercise.status, 'N')}">
							<a style="color:#BD1B1B" href="attempt_exercise?id=${popExercise.popExerciseId}">Solve Exercise</a> &nbsp; 
						</c:if>
 					</td>
				</c:if>
				<c:if test = "${fn:contains(popExercise.week, 'Week 11: Abstract')}">
					<td style="background-color:#BCD6F0">${popExercise.popExerciseId}</td>
					<td style="background-color:#BCD6F0">${popExercise.week}</td>
					<td style="background-color:#BCD6F0">${popExercise.lesson}</td>
					<td style="background-color:#BCD6F0">
						<c:if test="${fn:contains(popExercise.status, 'Y')}">
							<a style="color:#3CA234" href="attempt_exercise?id=${popExercise.popExerciseId}">Solved</a> &nbsp; 
						</c:if>
						<c:if test="${fn:contains(popExercise.status, 'N')}">
							<a style="color:#BD1B1B" href="attempt_exercise?id=${popExercise.popExerciseId}">Solve Exercise</a> &nbsp; 
						</c:if>
					</td>
				</c:if>
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