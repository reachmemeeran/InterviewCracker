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
			Week 2: Functions and Parameters - Lesson 3: The Flow of Execution
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
			 Write a function which returns true if a number is divisible by 3 and false if it is not.<br>
			 Hint: use the modulo (%) operator.<br>
			 Modify your code so that your function now returns true if a number 3 is divisible by 3 or 5 and false if it is not.<br>

			 
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
#include <stdbool.h>


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
		
		
        
        <textarea name="answerCode" style="display:none;">#include <stdio.h>
#include <stdbool.h>


bool is_divisible_by_3(int num){
if(num%3==0){
return true;
}else{
return false;
}
}

bool is_divisible_by_3_or_5(int num){
if(num%3==0 || num%5==0){
return true;
}else{
return false;
}
}

int main(void) {
int num=3;
bool x = is_divisible_by_3(num);
printf("The Number %d is divisble by 3? %s \n", num, x ? "YES(true)" : "NO(false)");

bool y = is_divisible_by_3_or_5(num);
printf("The Number %d is divisble by 3 or 5? %s \n", num, y ? "YES(true)" : "NO(false)");
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