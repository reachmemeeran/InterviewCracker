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
		<h3 class="title" style="margin-left:25%;margin-top:20px;">13. Week 5: Abstract Data Types - Lesson 1 Exercise: Abstract Datatypes</h3>
		<div class="card one" style="width:22%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">

			<h3 style="margin-top:2%;">Exercise:</h3>
			<p>&nbsp;</p>

			Complete the function printDate below so that it prints out the data in a struct Date in the format 
 <br>
 DD:MMM:YYYY - e.g. 01:JAN:2019<br>
			<p>&nbsp;</p>
			<h4 style="margin-top:2%;">Expected Output:</h4>
			<br>  01:JAN:2019 <br> 14:MAY:1980 <br>
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



struct Date
{
	int day;
	char month[4];
	int year;
};

void printDate(struct Date d){
  
}

int main(void) {
  struct Date date1;
  date1.day = 1;
  date1.month[0] = 'J';
  date1.month[1] = 'A';
  date1.month[2] = 'N';
  date1.month[3] = '\0';
  date1.year = 2019;
  printDate(date1);
  return 0;
}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="List of Excersises" onclick="window.location.href='list_pop_exercise'">
					</c:if>



					<textarea name="answerCode" style="display: none;">#include <stdio.h>

/* 
 * Complete the function printDate below so that it prints out the data
 * in a struct Date in the format 
 * 
 * DD:MMM:YYYY - e.g. 01:JAN:2019
 */

struct Date
{
	int day;
	char month[4];
	int year;
};

void printDate(struct Date d){
  printf("%02d:%s:%d\n",d.day,d.month,d.year); //d. is used to reference to the values in the date struct.
}

int main(void) {
  struct Date date1;
  struct Date date2; // May 14 1980
  date1.day = 1;
  date1.month[0] = 'J';
  date1.month[1] = 'A';
  date1.month[2] = 'N';
  date1.month[3] = '\0';
  date1.year = 2019;
  printDate(date1);
  date2.day = 14;
  date2.month[0] = 'M';
  date2.month[1] = 'A';
  date2.month[2] = 'Y';
  date2.month[3] = '\0';
  date2.year = 1980;
  printDate(date2);
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
		<div class="card one" style="width:20%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">
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