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
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<jsp:directive.include file="../header.jsp" />

		<div class="popleftbar">

			<p>&nbsp;</p>
			<h3>Exercise:</h3>
			<p>&nbsp;</p>

			Complete the function printDate below so that it prints out the data in a struct Date in the format 
 <br>
 DD:MMM:YYYY - e.g. 01:JAN:2019<br>

			<p>&nbsp;</p>
			Output should be:<br>  01:JAN:2019 <br> 14:MAY:1980 <br>
			<br>
		</div>
		<div class="popmiddlebar">
			<div align="center">

				<h3 class="pageheading">13. Week 5: Abstract Data Types - Lesson 1 Exercise: Abstract Datatypes</h3>
			</div>


			<div align="center">
				<form action="submit_ccode" method="post" id="submitCCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="25" cols="70">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="25" cols="70" required="true">#include <stdio.h>



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
						<table class="form">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td colspan="1" align="center"><input type="BUTTON"
									value="List of Excersises"
									onclick="window.location.href='list_pop_exercise'"></td>
							</tr>
						</table>

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
						<table class="form">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button type="submit">Save</button>&nbsp;&nbsp;&nbsp; <input
									type="BUTTON" value="List of Excersises"
									onclick="window.location.href='list_pop_exercise'">
								</td>
							</tr>
						</table>
					</c:if>
				</form>
			</div>



		</div>
		<div class="poprightbar">
			<h3>Output and Results</h3>
			<p>&nbsp;</p>
			<p>&nbsp;</p>

			<c:if test="${output!=null}">
					<pre style="text-align: left; width: 100%; color: blue; overflow-x: auto; overflow-y: hidden;">Output for your code is: <br>${output}<br></br><p>&nbsp;</p></pre>
			</c:if>

			<p>&nbsp;</p>
			<p>&nbsp;</p>

			<c:if test="${message!=null}">
					<c:if test="${message=='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: green">${message}</pre>
					</c:if>
					<c:if test="${message!='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: red; overflow-x: auto; overflow-y: hidden;">${message}<br></br><p>&nbsp;</p></pre>
					</c:if>
			</c:if>
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