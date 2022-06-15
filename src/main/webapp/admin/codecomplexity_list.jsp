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
	<jsp:directive.include file="header.jsp" />
	<div class="indexmiddlebar">
	<div align="center">
		<h2 class="pageheading">Code Complexity Management</h2>
	</div>

	<div align="center">
		<h3>
			<a href="codecomplexity_form.jsp">Create New Code Complexity</a>
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
					<th>Index</th>
					<th>ID</th>
					<th>Name</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="codeComplexity" items="${listCodeComplexity}" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${codeComplexity.codeComplexityId}</td>
							<td>${codeComplexity.complexityDesc}</td>
							<td>
								<a href="edit_codeComplexity?id=${codeComplexity.codeComplexityId}">Edit</a> &nbsp; 
								<a href="javascript:void(0);" class="deleteLink" id="${codeComplexity.codeComplexityId}">Delete</a>
							</td>
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
					codeComplexityId=$(this).attr("id");
					if(confirm("Are you sure you want to delete the Code Complexity with ID " + codeComplexityId + " ?")){
						window.location = 'delete_codeComplexity?id='+codeComplexityId;
					}
				});
			});
		});
	</script>
</body>
</html>