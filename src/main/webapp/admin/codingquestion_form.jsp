<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create new coding interview questions</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="indexmiddlebar">
	<div align="center">

		<h2 class="pageheading">
			<c:if test="${codingQuestion!=null}">
				Update codingQuestion Information
			</c:if>
			<c:if test="${codingQuestion==null}">
				New codingQuestion Information
			</c:if>
		</h2>
	</div>
	
	<div align="center">
		<c:if test="${codingQuestion!=null}">
			<form action="update_codingQuestion" method="post" id="codingQuestionForm">
				<input type="hidden" name="codeComplexityId" value="${codeComplexity.codeComplexityId}">
		</c:if>
		<c:if test="${codingQuestion==null}">
			<form action="create_codingQuestion" method="post" id="codingQuestionForm">
		</c:if>
		
		<table class="form">
			<tr>
				<td align="right">CodeComplexity:</td>
				<td align="left"><select name="codeComplexity">
						<option>Please select your CodeComplexity</option>
						<c:forEach items="${listCodeComplexity}" var="codeComplexity">
							<c:if test="${codeComplexity.codeComplexityId eq codingQuestion.codeComplexity.codeComplexityId}">
								<option value="${codeComplexity.codeComplexityId}" selected>
							</c:if>
							<c:if test="${codeComplexity.codeComplexityId ne codingQuestion.codeComplexity.codeComplexityId}">
								<option value="${codeComplexity.codeComplexityId}">
							</c:if>
							${codeComplexity.name}
							</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">Summary:</td>
				<td align="left"><input type="text" id="summary" name="summary"
					size="20" value="${codingQuestion.summary}" /></td>
			</tr>
			<tr>
				<td align="right">Coding Question:</td>
				<td align="left"><textarea name="question"
						rows="10 placeholder=" placeholder="Enter Coding Question here">${codingQuestion.question}</textarea>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button id="buttonCancel">Cancel</button>
				</td>
			</tr>
		</table>
		</form>
		</div>
	</div>


	<jsp:directive.include file="footer.jsp" />
</body>
<script type='text/javascript'>
	$(document).ready(function() {
		$("#codingQuestionForm").validate({
			rules : {
				codeComplexity : "required",
				summary : "required",
				question : "required",
			},
			messages : {
				codeComplexity : "Please select a codeComplexity for the codingQuestion.",
				summary : "Please enter summary of the codingQuestion.",
				question : "Please enter coding Question.",
			}
		});
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});

</script>
</html>