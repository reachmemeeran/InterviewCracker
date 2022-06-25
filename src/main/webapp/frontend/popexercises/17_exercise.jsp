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

			
1. Implement the Method isModThree which returns true if a number is divisible by 3 and false if it is not. <br>
Hint: use the modulo (%) operator.  <br>
2. Implement the Recursive method multiply which performs multiplication of two numbers without using the inbuilt * sign <br>
3. Complete the fibonacci method below such that it calculates the 
   nth term of the Fibonacci sequence using iteration.<br>
   The first 4 terms of the Fibonacci sequence in this example are  1, 1, 2, 3 <br>
   For example if we call fibonacci(1) we should get the value 1 returned, <br>
   if we call fibonacci(4) we should get the value 3 returned.   <br>

			<p>&nbsp;</p>
			Output should be:<br>  true <br>
15 <br>
55<br>
 <br>
			<br>
		</div>
		<div class="popmiddlebar">
			<div align="center">

				<h3 class="pageheading">17. Week 8: Java Types, Control Flow and Error Handing - Lesson 2 Exercise: Methods</h3>
			</div>


			<div align="center">
				<form action="submit_javacode" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="25" cols="70">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="25" cols="70" required="true">/*
 * Implement the methods below.
 */ 

class Main {
  public static void main(String[] args) {
    Main m = new Main();
   
    // demo for isModThree method.
    int number = 3;
    System.out.println(m.isModThree(number));
   
    // demo for multiply method.
    int number2 = 5;
    System.out.println(m.multiply(number, number2));

    // demo for fib method.
    System.out.println(m.fib(10));
  }

  // Method which returns true if a number is divisible by 3 and  
  // false if it is not.  Hint: use the modulo (%) operator.
  public boolean isModThree(int n){
    return false;
  }

  // Recursive method which performs multiplication of two 
  // numbers without using the inbuilt * sign
  public int multiply(int n, int by){
    return 0;
  }

  /*
   * Complete the fibonacci method below such that it calculates the 
   * nth term of the Fibonacci sequence using iteration.
   * 
   * The first 4 terms of the Fibonacci sequence in this example 
   * are  1, 1, 2, 3
   *
   * For example if we call fibonacci(1) we should get the value 1 returned,
   * if we call fibonacci(4) we should get the value 3 returned. 
   */
   public int fib(int term){
     return term;
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
									value="List of Excersises"
									onclick="window.location.href='list_pop_exercise'"></td>
							</tr>
						</table>

					</c:if>



					<textarea name="answerCode" style="display: none;">
					/*
 * Implement the methods below.
 */

class Main {
   
  public static void main(String[] args) {
   
    Main m = new Main();
   
    // demo for isModThree method.
    int number = 3;
    System.out.println(m.isModThree(number));
   
    // demo for multiply method.
    int number2 = 5;
    System.out.println(m.multiply(number, number2));

    // demo for fib method.
    System.out.println(m.fib(10));

  }

    // Method which returns true if a number is divisible by 3 and  
    // false if it is not.  Hint: use the modulo (%) operator.
    public boolean isModThree(int n){
       
    if ((n % 3) == 0){
      return true;
    }
    return false;
    }

    // Recursive method which performs multiplication of two
    // numbers without using the inbuilt * sign
    public int multiply(int n, int by){
        if (by > 1) {
      return n + multiply(n, by-1);
    }
    return n;
    }

    /*
    * Complete the fibonacci method below such that it calculates the
    * nth term of the Fibonacci sequence using iteration.
    *
    * The first 4 terms of the Fibonacci sequence in this example
    * are  1, 1, 2, 3
    *
    * For example if we call fibonacci(1) we should get the value 1 returned,
    * if we call fibonacci(4) we should get the value 3 returned.
    */
    public int fib(int term){
        if (term == 1 || term == 0){
      return term;
    }
    return fib(term - 1) + fib(term - 2);
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
					<pre style="text-align: left; width: 100%; color: blue; overflow-x: auto; overflow-y: auto;">Output for your code is: <br>${output}<br></br><p>&nbsp;</p></pre>
			</c:if>

			<p>&nbsp;</p>
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