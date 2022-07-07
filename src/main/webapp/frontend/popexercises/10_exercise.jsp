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

	<div class="card one" style="width:92%; height:600px;margin-bottom:30px;">
		<h3 class="title" style="margin-left:25%;margin-top:20px;">10. Week 3: Arrays and Strings - Lesson 2: Arrays</h3>
		<div class="card one" style="width:22%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">

			<p style="font-weight: bold;color:green;">Exercise:</p>
			<p>&nbsp;</p>

			Modify the function populateArray so that it populates the array evenNumbers with calculated value rather than printing it out.<br>
			Now create a function that prints out this evenNumbers array and call it from the main function<br>

			<p>&nbsp;</p>
			<p style="font-weight: bold;color:green;">Expected Output:</p>
			<br> <br>2<br> 4<br>6<br> 8<br> 10<br> 12<br> 14<br> 16<br> 18<br> 20 <br>
			<br>
		</div>
		<div class="card one" style="width:50%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">

				<form action="submit_ccode" method="post" id="submitCCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="23" cols="80" style="background-color:rgba(0, 231, 255, 0.45) ; color:#fff">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="23" cols="80" style="background-color:rgba(0, 231, 255, 0.45) ; color:#fff" required="true">#include <stdio.h>


int evenNumbersSize = 10;
int evenNumbers[10];

void populateArray(){
}

int main(void) {
  populateArray();
  return 0;
}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="List of Excersises" onclick="window.location.href='list_pop_exercise'">
					</c:if>



					<textarea name="answerCode" style="display: none;">#include <stdio.h>


int evenNumbersSize = 10;
int evenNumbers[10];

void populateArray(){
for(int i = 0; i < evenNumbersSize; i++){
evenNumbers[i] = (i+1)*2;
}
}

void printArray(){
for(int i = 0; i < evenNumbersSize; i++){
printf("%d\n",evenNumbers[i]);
}
}

int main(void) {
populateArray();
printArray();
return 0;
}
</textarea>
					<input type="hidden" name="exerciseId" value="${exerciseId}">

					<c:if test="${status==null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="List of Excersises" onclick="window.location.href='list_pop_exercise'">
					</c:if>
				</form>

		</div>
		<div class="card one" style="width:20%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;background:#000;">
			<h3>Output and Results</h3>
			<p>&nbsp;</p>

			<c:if test="${output!=null}">
					<pre style="text-align: left; width: 100%; color: #c8ff05; overflow-x: auto; overflow-y: hidden;">Output for your code is: <br>${output}<br></br><p>&nbsp;</p></pre>
			</c:if>

			<p>&nbsp;</p>

			<c:if test="${message!=null}">
					<c:if test="${message=='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: #05ffd0">${message}</pre>
					</c:if>
					<c:if test="${message!='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: red; overflow-x: auto; overflow-y: hidden;">${message}<br></br><p>&nbsp;</p></pre>
					</c:if>
			</c:if>
		</div>
		</div>
		<jsp:directive.include file="../footer.jsp" />
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#submitCCodeForm").validate({
			rules : {},

			messages : {}
		});

		$("#buttonCancel").click(function() {
			history.back();
		});
	});
</script>
</html>