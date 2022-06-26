<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Code Questions - InterviewCracker Administration</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="courselistmiddlebar">
		<div align="center">
			<h2 class="pageheading">Coding Question Management</h2>
		</div>
		<p>&nbsp;</p>
		<div align="center">
			<h3>
				<a href="codingquestion_form.jsp">Create New Coding Question</a>
			</h3>
		</div>

		<p>&nbsp;</p>
	
		<c:if test="${message!=null}">
			<div align="center">
				<h4 class="message">${message}</h4>
			</div>
		</c:if>

		<div align="center" style="height:400px;">
			<table border="1" cellpadding="5">
				<tr>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Index</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">ID</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">CodeComplexity</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Summary</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Actions</th>
					<th>&nbsp;</th>
				</tr>
				<c:forEach var="codingQuestion" items="${listcodingQuestions}"
					varStatus="status">
						<tr>
							<td style="background-color:#002B5636">${status.index + 1}</td>
							<td style="background-color:#002B5636">${codingQuestion.codingQuestionId}</td>
							<td style="background-color:#002B5636">${codingQuestion.codeComplexityId}</td>
							<td style="background-color:#002B5636">${codingQuestion.summary}</td>
							<td>
								<a href="edit_codingQuestion?id=${codingQuestion.codingQuestionId}">Edit</a> &nbsp; 
								<a href="javascript:void(0);" class="deleteLink" id="${codingQuestion.codingQuestionId}">Delete</a>
							</td>
							<td> &nbsp;</td>
						</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script>
	function deleteFunction(codingQuestionId) {
		console.log("CodingQuestion id: " + codingQuestionId);
		if (confirm('Are you sure you want to soft delete the codingQuestion with ID '
				+ codingQuestionId + '?')) {
			window.location = 'delete_codingQuestion?id=' + codingQuestionId;
		}
	}
</script>
</html>