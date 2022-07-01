<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Coding Challenge</title>

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
		<div class="codeheading">
		<h3>Easy-1: Iteration</h3>
		</div>

		<div class="codelefttopbar">

<pre>
<p style="font-weight: bold;">Loops:</p>Loops can execute a block of code as long as a specified condition is reached.
Loops are handy because they save time, reduce errors, and they make code more readable.

<p style="font-weight: bold;">While Loop:</p>The while loop loops through a block of code as long as a specified condition is true:

while (condition) {
  // code block to be executed
}

<p style="font-weight: bold;">Do/While Loop:</p>The do/while loop is a variant of the while loop. This loop will execute the code block 
once, before checking if the condition is true, then it will repeat the loop as long 
as the condition is true.

do {
  // code block to be executed
}
while (condition);

<p style="font-weight: bold;">For Loop:</p>When you know exactly how many times you want to loop through a block of code, 
use the for loop instead of a while loop:

for (statement 1; statement 2; statement 3) {
  // code block to be executed
}
Statement 1 is executed (one time) before the execution of the code block.

Statement 2 defines the condition for executing the code block.

Statement 3 is executed (every time) after the code block has been executed.


</pre>

 <br>
 <br>
			<br>
		</div>
		<div class="codemiddlebar">
			
			<div align="left">

				<pre>
<p style="font-weight: bold;">Question:</p>Find Factorial with Iterative function call
Factorial, in mathematics, the product of all positive integers less than or 
equal to a given positive integer and denoted by that integer and an 
exclamation point. 
Thus, factorial seven is written 7!, meaning 1 × 2 × 3 × 4 × 5 × 6 × 7.
<p style="font-weight: bold;">Expected Output:</p>While Loop: 4 factorial is: 24
For Loop: 4 factorial is: 24
</pre>
			</div>


			<div align="center">
				<form action="submit_javacoding" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="20" cols="70" style="background-color:#002b56 ; color:#fff">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="20" cols="70" style="background-color:#002b56 ; color:#fff" required="true">
import java.util.*;

class Main{
  public static void main(String args[]){
    int number = 4, result, forResult;
    result = getFactorialWhileLoop(number);
    System.out.println("While Loop: " + number + " factorial is: " + result);
    forResult = getFactorialForLoop(number);
    System.out.println("For Loop: " + number + " factorial is: " + forResult);
  }

  public static int getFactorialWhileLoop(int n){
    int result = 1;
    while (n > 1) {
        //Complete While Loop
        n -= 1;
    }
    return result;
}

  public static int getFactorialForLoop(int n) {
    int result = 1;
  	if (n >= 1) {
  	    for (int i = 1; i <= n; i++) {
  	        //Complete For Loop
  	    }
  	    return result;
  	}
  	else {
  	  return result;
  	}
  }
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
									value="Back"
									onclick="window.location.href='list_code_easy'"></td>
							</tr>
						</table>

					</c:if>



					<textarea name="answerCode" style="display: none;">
import java.util.*;

class Main{
  public static void main(String args[]){
    int number = 4, result, forResult;
    result = getFactorialWhileLoop(number);
    System.out.println("While Loop: " + number + " factorial is: " + result);
    forResult = getFactorialForLoop(number);
    System.out.println("For Loop: " + number + " factorial is: " + forResult);
  }

  public static int getFactorialWhileLoop(int n){
    int result = 1;
    while (n > 1) {
        result = result * n;
        n -= 1;
    }
    return result;
}

  public static int getFactorialForLoop(int n) {
    int result = 1;
  	if (n >= 1) {
  	    for (int i = 1; i <= n; i++) {
  	        result = result * i;
  	    }
  	    return result;
  	}
  	else {
  	  return result;
  	}
  }
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
									type="BUTTON" value="Back"
									onclick="window.location.href='list_code_easy'">
								</td>
							</tr>
						</table>
					</c:if>
				</form>
			</div>



		</div>
		<div class="codeleftbottombar">
			<h3>Output and Results</h3>
			<p>&nbsp;</p>

			<c:if test="${output!=null}">
					<pre style="text-align: left; width: 100%; color: blue; overflow-x: auto; overflow-y: auto;">Output for your code is: <br>${output}<br></br><p>&nbsp;</p></pre>
			</c:if>

			<p>&nbsp;</p>

			<c:if test="${message!=null}">
					<c:if test="${message=='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: green">${message}</pre>
					</c:if>
					<c:if test="${message!='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: red; overflow-x: auto; overflow-y: auto;">${message}<br></br><p>&nbsp;</p></pre>
					</c:if>
			</c:if>
		</div>
		<jsp:directive.include file="../footer.jsp" />
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#submitJavaCodeForm").validate({
			rules : {},

			messages : {}
		});

		$("#buttonCancel").click(function() {
			history.back();
		});
	});
</script>
</html>