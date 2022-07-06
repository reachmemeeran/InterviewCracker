<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create New Code Complexity</title>
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
			<c:if test="${codeComplexity!=null}">
				Edit Code Complexity
			</c:if>
			<c:if test="${codeComplexity==null}">
				Create New Code Complexity
			</c:if>
		</h2>
	</div>

	<div align="center">
		<c:if test="${codeComplexity!=null}">
			<form action="update_codeComplexity" method="post" id="codeComplexityForm">
				<input type="hidden" name="codeComplexityId" value="${codeComplexity.codeComplexityId}">
		</c:if>
		<c:if test="${codeComplexity==null}">
			<form action="create_codeComplexity" method="post" id="codeComplexityForm">
		</c:if>

&nbsp;
		<table style="margin-left:auto;margin-right:auto;">
			<tr>
				<td align="right">Name:</td>
				<td align="left"><input type="text" id="name" name="name"
					size="20" value="${codeComplexity.complexityDesc}" /></td>
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
	</div>


	<jsp:directive.include file="footer.jsp" />
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#codeComplexityForm").validate({
			rules : {
				name : "required",
			},
			messages : {
				name : " Please enter codeComplexity full name.",
			}
		});
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
</script>
</html>