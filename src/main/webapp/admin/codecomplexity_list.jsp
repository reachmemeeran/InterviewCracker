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
	<div class="card one" style="width:50%; min-height:200px; margin-left:25%;margin-top:10%;">
	
	<div align="center">
		<h3 class="pageheading">Code Complexity Management</h3>
	</div>
	

	<div align="center">
		<h3>
			<a class="button-1" href="codecomplexity_form.jsp">Create New Code Complexity</a>
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
					<th>Name</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="codeComplexity" items="${listCodeComplexity}" varStatus="status">
						<tr>
							<td>
								<p class="num">${status.index+1}</p>
							</td>
							<td style="width:100px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
								<p class="link" style="margin:0.4rem">${codeComplexity.codeComplexityId}</p>
							</td>
							<td style="width:200px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
								<p class="link" style="margin:0.4rem">${codeComplexity.complexityDesc}</p>
							</td>
							<td style="width:200px; padding: .01rem 2%;">
								<a class="button-3" href="edit_codeComplexity?id=${codeComplexity.codeComplexityId}">Edit</a> &nbsp; 
								<a class="button-1" onclick="deleteFunction(this.id);" id="${codeComplexity.codeComplexityId}">Delete</a>
							</td>
						</tr>
				</c:forEach>
			</table>
			&nbsp;
	</div>
</div>

	<jsp:directive.include file="footer.jsp" />

	<script>
		function deleteFunction(codeComplexityId) {
			console.log("codeComplexityId: " + codeComplexityId);
			if(confirm("Are you sure you want to delete the Code Complexity with ID " + codeComplexityId + " ?")){
				window.location = 'delete_codeComplexity?id='+codeComplexityId;
			}
		}
	</script>
</body>
</html>