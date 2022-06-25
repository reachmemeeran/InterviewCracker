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
			Week 1: Writing and Running Your First Programs - Lesson 3: Variables
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
			 In the code below, <br>
			 1. change the value stored in n to 24. Now, using the printf function in the stdio.h library (imported above),<br>
			 2. print out the value of n<br>
			 3. change the value of n to 4 and in a new variable, store the value of n multiplied by 3 and print it out<br>
			 
			 Output should be: Result:12
			<br><br>
	</div>

	<div align="center">
		<form action="submit_ccode" method="post" id="submitCCodeForm">
		
		
		<c:if test="${attemptedCode!=null}">
			<textarea name="ccode" rows="12" cols="80">${attemptedCode}</textarea>
				
		</c:if>
		<c:if test="${attemptedCode==null}">
			<textarea name="ccode" rows="12" cols="80" required="true">#include <stdio.h>
            
int main(void) {
  int n = 14;
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
		
		
        
        <textarea name="answerCode" style="display:none;">#include <stdio.h>

int main(void) {
int n = 24;
n=4;
int mulValue = n * 3;
printf("Result:%d \n", mulValue);
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