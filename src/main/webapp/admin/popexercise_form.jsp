<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create New POP Exercise</title>
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
			<c:if test="${codingQuestion!=null}">
				Update POP Exercise
			</c:if>
			<c:if test="${codingQuestion==null}">
				New POP Exercise
			</c:if>
		</h2>
	</div>
	
	&nbsp;
	<div align="center">
		<c:if test="${popExercise!=null}">
			<form action="update_popExercise" method="post" id="popExerciseForm">
				<input type="hidden" name="popExerciseId" value="${popExercise.popExerciseId}">
		</c:if>
		<c:if test="${popExercise==null}">
			<form action="create_popExercise" method="post" id="popExerciseForm">
		</c:if>
		
		<table style="margin-left:auto;margin-right:auto;">
			<tr>
				<td align="right">week:</td>
				<td align="left"><input type="text" id="week" name="week"
					size="50" value="${popExercise.week}" /></td>
			</tr>
			<tr>
				<td align="right">lesson:</td>
				<td align="left"><input type="text" id="lesson" name="lesson"
					size="50" value="${popExercise.lesson}" /></td>
			</tr>
			<tr>
				<td align="right">language:</td>
				<td align="left"><input type="text" id="language" name="language"
					size="20" value="${popExercise.language}" /></td>
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
		&nbsp;
	</div>


	<jsp:directive.include file="footer.jsp" />
	</div>
</body>
<script type='text/javascript'>
	$(document).ready(function() {
		$("#popExerciseForm").validate({
			rules : {
				week : "required",
				lesson : "required",
				language : "required",
			},
			messages : {
				week : "Please enter a week.",
				lesson : "Please enter lesson.",
				language : "Please enter language.",
			}
		});
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});

</script>
</html>