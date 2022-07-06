<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Code Complexity - InterviewCracker Administration</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<div class="main-container">
	<jsp:directive.include file="header.jsp" />
	<div class="card one" style="width:60%; min-height:200px; margin-left:20%;margin-top:10%;">
	
	<div align="center">
		<h3 class="pageheading">Coding Question Management</h3>
	</div>
	

	<div align="center">
		<h3>
			<a class="button-1" href="codingquestion_form.jsp">Create New Coding Question</a>
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
					<th>CodeComplexity</th>
					<th>Summary</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="codingQuestion" items="${listcodingQuestions}" varStatus="status">
						<tr>
							<td>
								<p class="num">${status.index+1}</p>
							</td>
							<td style="width:100px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
								<p class="link" style="margin:0.4rem">${codingQuestion.codingQuestionId}</p>
							</td>
							<td style="width:100px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
								<p class="link" style="margin:0.4rem">${codingQuestion.codeComplexityId}</p>
							</td>
							<td style="width:300px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
								<p class="link" style="margin:0.4rem">${codingQuestion.summary}</p>
							</td>
							<td style="width:200px; padding: .01rem 2%;">
								<a class="button-3" href="edit_codingQuestion?id=${codingQuestion.codingQuestionId}">Edit</a>
								<a class="button-1" onclick="deleteFunction(this.id);" id="${codingQuestion.codingQuestionId}">Delete</a>
							</td>
						</tr>
				</c:forEach>
			</table>
			&nbsp;
	</div>
</div>

	<jsp:directive.include file="footer.jsp" />

	<script>
		function deleteFunction(codeQuestionId) {
			console.log("codeQuestionId: " + codeQuestionId);
			if(confirm("Are you sure you want to delete the codeQuestion with ID " + codeQuestionId + " ?")){
				window.location = 'delete_codingQuestion?id='+codeQuestionId;
			}
		}
	</script>
</body>
</html>