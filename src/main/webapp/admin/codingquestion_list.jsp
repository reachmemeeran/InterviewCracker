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
	<div class="indexmiddlebar">
		<div align="center">
			<h2 class="pageheading">Coding Question Management</h2>
		</div>

		<div align="center">
			<h3>
				<a href="codingquestion_form.jsp">Create New Coding Question</a>
			</h3>
		</div>

		<c:if test="${message!=null}">
			<div align="center">
				<h4 class="message">${message}</h4>
			</div>
		</c:if>

		<div align="center">
			<table border="1" cellpadding="5">
				<tr>
					<th>Index</th>
					<th>ID</th>
					<th>CodeComplexity</th>
					<th>Summary</th>
					<th>Question</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="codingQuestion" items="${listcodingQuestions}"
					varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${codingQuestion.codingQuestionId}</td>
							<td>${codingQuestion.codeComplexity.name}</td>
							<td>${codingQuestion.summary}</td>
							<td>${codingQuestion.question}</td>
							<td>
								<a href="edit_codingQuestion?id=${codingQuestion.codingQuestionId}">Edit</a> &nbsp; 
								<a href="javascript:void(0);" class="deleteLink" id="${codingQuestion.codingQuestionId}">Delete</a>
							</td>
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