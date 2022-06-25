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

		<h3 class="pageheading">
			Week 2: Functions and Parameters - Lesson 4: Recursion
		</h3>
	</div>
	
		<c:if test="${output!=null}">
		<div align="center">
			<h4 class="message" style="text-align: left; width: 100%; color: blue">
				Output for your code is: ${output}
			</h4>
		</div>
	</c:if>
	
	<c:if test="${message!=null}">
		<div align="center">
			<c:if test="${message=='Successfully passed the test case'}">
				<h4 class="message" style="text-align: left; width: 100%; color: green">
				${message}
			</h4>
			</c:if>
			<c:if test="${message!='Successfully passed the test case'}">
				<h4 class="message" style="text-align: left; width: 100%; color: red">
				${message}
			</h4>
			</c:if>
		</div>
	</c:if>


	<div align="left" >
	<br><br>
Complete the recursive function below which performs multiplication of two numbers without using the inbuilt multiply sign <br>

			 
			 Output should be: The multiplication of 2 by 3 is 6 The multiplication of 9 by 8 is 72
			<br><br>
	</div>

	<div align="center">
		<form action="submit_ccode" method="post" id="submitCCodeForm">
		
		
		<c:if test="${attemptedCode!=null}">
			<textarea name="ccode" rows="12" cols="80">${attemptedCode}</textarea>
				
		</c:if>
		<c:if test="${attemptedCode==null}">
			<textarea name="ccode" rows="12" cols="80" required="true">#include <stdio.h>


int multiply(int number, int by){
  return 1;
}

int main(void) {
  printf("The multiplication of 2 by 3 is %d\n", multiply(2,3));
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
		
		
        
        <textarea name="answerCode" style="display:none;">#include <stdio.h>


int multiply(int number, int by){
if(by==0){
return 0;
} else {
return number+multiply(number, (by-1));
}
}

int main(void) {
printf("The multiplication of 2 by 3 is %d\n", multiply(2,3));
printf("The multiplication of 9 by 8 is %d\n", multiply(9,8));
return 0;
}</textarea>
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