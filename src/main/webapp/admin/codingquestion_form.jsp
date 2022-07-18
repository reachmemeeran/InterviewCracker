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
	<div class="main-container">
	<jsp:directive.include file="header.jsp" />
	<div class="card one" style="width:90%; min-height:200px; margin-left:7%;margin-top:5%;">
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
	
	&nbsp;
	<div align="center">
		<c:if test="${codingQuestion!=null}">
			<form action="update_codingQuestion" method="post" id="codingQuestionForm">
				<input type="hidden" name="codingQuestionId" value="${codingQuestion.codingQuestionId}">
		</c:if>
		<c:if test="${codingQuestion==null}">
			<form action="create_codingQuestion" method="post" id="codingQuestionForm">
		</c:if>
		
		<table style="margin-left:auto;margin-right:auto;">
			<tr>
				<td align="right">CodeComplexity:</td>
				<td>
					<select id="codeComplexityId" name="codeComplexityId">
						<c:if test="${codingQuestion!=null}">
							<c:forEach items="${listCodeComplexity}" var="codeComplexity">
								<c:if test="${codeComplexity.codeComplexityId eq codingQuestion.codeComplexityId}">
									<option value="${codeComplexity.codeComplexityId}" selected>
								</c:if>
								<c:if test="${codeComplexity.codeComplexityId ne codingQuestion.codeComplexityId}">
									<option value="${codeComplexity.codeComplexityId}">
								</c:if>
								${codeComplexity.complexityDesc}
								</option>
							</c:forEach>
						</c:if>
						<c:if test="${codingQuestion==null}">
							<c:forEach items="${listCodeComplexity}" var="codeComplexity">
								<option value="${codeComplexity.codeComplexityId}">${codeComplexity.complexityDesc}
								</option>
							</c:forEach>
						</c:if>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">Summary:</td>
				<td align="left"><input type="text" id="summary" name="summary"
					size="40" value="${codingQuestion.summary}" /></td>
			</tr>
			<tr>
				<td align="right">Question:</td>
				<td align="left"><textarea id="question" name="question"
					cols="140" rows="5">${codingQuestion.question}</textarea></td>
			</tr>
			<tr>
				<td align="right">Expected Output:</td>
				<td align="left"><textarea id="output" name="output"
					cols="140" rows="4">${codingQuestion.output}</textarea></td>
			</tr>
			<tr>
				<td align="right">Lesson:</td>
				
				<c:if test="${codingQuestion!=null}">
					<td align="left"><textarea id="lesson" name="lesson"
					cols="140" rows="10">${codingQuestion.lesson}</textarea></td>
				</c:if>
				<c:if test="${codingQuestion==null}">
					<td align="left"><textarea id="lesson" name="lesson"
					cols="140" rows="10"><p style="font-weight: bold;color:cyan;">Heading:</p>Explanation
//Code if any
while (condition) {
  // code block to be executed
}
					</textarea></td>
				</c:if>
			</tr>
			<tr>
				<td align="right">Sample Code:</td>
				<td align="left"><textarea id="code" name="code"
					cols="140" rows="30" style="background-color:rgba(0, 231, 255, 0.45) ; color:#000">${codingQuestion.code}</textarea></td>
			</tr>
			<tr>
				<td align="right">Answer Code:</td>
				<td align="left"><textarea id="anscode" name="anscode"
					cols="140" rows="30" style="background-color:#000 ; color:#fff">${codingQuestion.anscode}</textarea></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="button-1" id="buttonCancel">Cancel</button>
					<button class="button-3" type="submit">Save</button>&nbsp;&nbsp;&nbsp;
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
		$("#codingQuestionForm").validate({
			rules : {
				codeComplexity : "required",
				summary : "required",
				question: "required",
				output: "required",
				lesson: "required",
				code: "required",
				anscode: "required",
			},
			messages : {
				codeComplexity : "Please select a codeComplexity.",
				summary : "Please enter summary.",
				question: "Please enter Question.",
				output: "Please enter Expected Output.",
				lesson: "Please enter Lesson.",
				code: "Please enter Default code.",
				anscode: "Please enter the expected answer code",
			}
		});
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});

</script>
</html>