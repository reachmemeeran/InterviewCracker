<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>POP Exercises</title>
	
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/jquery-ui.min.css">
	
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<div class="main-container">
	<jsp:directive.include file="../header.jsp" />
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<jsp:directive.include file="../header.jsp" />
	
	<div class="popmiddlebar">
	<div align="center">

		<h2 class="pageheading">
			Lesson 2: Your 1st Program
		</h2>
	</div>
	
		<c:if test="${output!=null}">
		<div align="center">
			<h4 class="message">
				Output for your code is: ${output}
			</h4>
		</div>
	</c:if>
	
	<c:if test="${message!=null}">
		<div align="center">
			<h4 class="message">
				${message}
			</h4>
		</div>
	</c:if>


	<div align="left">
	<br><br>
			 1. Run the "Hello World" program below by selecting the run button<br>
			 2. Edit the code so the program prints out "Goodbye World" instead.<br>
			 3. Edit the code further so the program prints out different text<br>
			<br><br>
	</div>

	<div align="center">
		<form action="submit_ccode" method="post" id="submitCCodeForm">
		
		
		<c:if test="${attemptedCode!=null}">
			<textarea name="ccode" rows="16" cols="80">${attemptedCode}</textarea>
				
		</c:if>
		<c:if test="${attemptedCode==null}">
			<textarea name="ccode" rows="16" cols="80" required="true">#include <stdio.h>
            
int main(void) {
	printf("Hello World\n");
	return 0;
}
        </textarea>
		</c:if>
		
		<c:if test="${status!=null}">
			<table class="form">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="1" align="center">
					<input type="BUTTON" value="List of Excersises" onclick="window.location.href='list_pop_exercise'">
				</td>
			</tr>
		</table>
				
		</c:if>
		
		
        
        <textarea name="answerCode" style="display:none;">Goodbye World</textarea>
        <input type="hidden" name="exerciseId" value="${exerciseId}">

		<c:if test="${status==null}">
		<table class="form">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<input type="BUTTON" value="List of Excersises" onclick="window.location.href='list_pop_exercise'">
				</td>
			</tr>
		</table>
		</c:if>
		</form>
	</div>

</div>
	<jsp:directive.include file="../footer.jsp" />
	</div>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		$("#submitCCodeForm").validate({
			rules: {
			},
			
			messages: {
			}
		});
		
		$("#buttonCancel").click(function() {
			history.back();
		});
	});
	
</script>
</html>