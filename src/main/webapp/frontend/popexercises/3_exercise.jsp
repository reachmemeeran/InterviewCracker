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
			Week 1: Writing and Running Your First Programs - Lesson 4: Errors and Debugging_21
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
			 The code below contains some errors. <br>
			 Debug the code to get it to run.<br>
			 
			 Output should be: The initial value was 42 and the processed value is 1764.000000
			<br><br>
	</div>

	<div align="center">
		<form action="submit_ccode" method="post" id="submitCCodeForm">
		
		
		<c:if test="${attemptedCode!=null}">
			<textarea name="ccode" rows="12" cols="80">${attemptedCode}</textarea>
				
		</c:if>
		<c:if test="${attemptedCode==null}">
			<textarea name="ccode" rows="12" cols="80" required="true">#include <stdio.h>
            
int my_function(double n){
  double n2 = n*n
  return n;
}

int main(void) {
  int value = 42
  double processed_value = my_function(value);
  printf("The initial value was %d", value); 
  printf(" and the processed value is %d\n", processed_value);
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
int my_function(double n){
double n2 = n*n; // Syntax Errors
return n2; // Logical Errors
}

int main(void) {
int value = 42; // Syntax Error
double processed_value = my_function(value);
printf("The initial value was %d", value);
printf(" and the processed value is %f \n", processed_value); // Run time error
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