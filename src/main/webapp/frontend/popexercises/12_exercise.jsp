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
			12. Week 3: Arrays and Strings - Lesson 4: String Functions
		</h3>
	</div>
	
		<c:if test="${output!=null}">
		<div align="center">
			<h4 class="message" style="text-align: left; width: 100%; color: blue; overflow-x: auto; overflow-y: hidden;">
				Output for your code is: ${output}
			</h4>
		</div>
	</c:if>
	
	<c:if test="${message!=null}">
		<div align="center">
			<c:if test="${message=='Successfully passed the test case'}">
				<pre class="message" style="text-align: left; width: 100%; color: green">${message}</pre>
			</c:if>
			<c:if test="${message!='Successfully passed the test case'}">
				<pre class="message" style="text-align: left; width: 100%; color: red">${message}</pre>
			</c:if>
		</div>
	</c:if>


	<div align="left" >
	<br><br>

Complete the fibonacci function below such that it calculates the nth term of the Fibonacci sequence using iteration.<br>
The first 4 terms of the Fibonacci sequence in this example are  1, 1, 2, 3 <br>
call fibonacci(10) we should get the value 1 1 2 3 5 8 13 21 34 55 returned <br>

			 
			 Output should be:<br> The Fibonacci series of 10 is : 1 1 2 3 5 8 13 21 34 55
			<br><br>
	</div>

	<div align="center">
		<form action="submit_ccode" method="post" id="submitCCodeForm">
		
		
		<c:if test="${attemptedCode!=null}">
			<textarea name="ccode" rows="12" cols="80">${attemptedCode}</textarea>
				
		</c:if>
		<c:if test="${attemptedCode==null}">
			<textarea name="ccode" rows="12" cols="80" required="true">#include <stdio.h>


int fibonacci(int term){
  return 1;
}

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


int fibonacci(int term){

int prev = 0;
int current = 1;
int next =0;
int count = 1;


while(count<=term){
if(count==1){
printf("%d ", count);
}else{
next= prev + current;
prev=current;
current=next;
printf("%d ", current);
}
count +=1;
}
return current;
}

int main(void) {
int term=10;
printf("The Fibonacci series of %d is : ",term);
fibonacci(term);
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