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
			Week 2: Functions and Parameters - Lesson 2: Global Variables 
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
 Create a function that contains a local variable n.  Initialise this variable to 
 100 and print to the screen the value of n*n.  <br>
  
 Modify your code so that you can print out the result of this calculation
 in the main function?  Do this both via a return in the function you have defined
 and by using a global variable.<br>

			 Output should be: Global Variable 4 Local Variable 10000
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


int n = 2;

int variable(){
int n=100;
int result = n*n;
return result;
}

int main(void) {
printf("Global Variable %d\n",n*n);
printf("Local Variable %d\n",variable());
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