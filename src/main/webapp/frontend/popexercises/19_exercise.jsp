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

			
 Implement the class methods in MyMath class. <br>
 Test your implementations using the main method <br>


			<p>&nbsp;</p>
			Output should be:<br>  Add: 5<br>
Sub: 1<br>
Multiply: 6<br>
Division: 1<br>
Power: 1<br>
Square Root: 2<br>
PI: 3.14159 <br>
 <br>
			<br>
		</div>
		<div class="popmiddlebar">
			<div align="center">

				<h3 class="pageheading">19. Week 10: Object Oriented Classes and Inheritance - Lesson 1: Class Methods</h3>
			</div>


			<div align="center">
				<form action="submit_javacode" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="25" cols="70" style="background-color:#002b56 ; color:#fff">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="25" cols="70" style="background-color:#002b56 ; color:#fff" required="true">/* 
 * Implement the class methods in MyMath class. 
 *
 * Test your implementations using the main method below
 */ 

class Main {
	public static void main(String[] args) {
	
		MyMath m = new MyMath();
		
		System.out.println("Add: "+m.add(3,2));
		System.out.println("Sub: "+m.sub(3,2));
		System.out.println("Multiply: "+m.mult(3,2));
		System.out.println("Division: "+m.div(3,2));
		System.out.println("Power: "+m.pow(3,2));
		System.out.println("Square Root: "+m.sqrt(4));
		System.out.println("PI: "+m.PI);
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
					class Main {
public static void main(String[] args) {

MyMath m = new MyMath();


System.out.println("Add: "+m.add(3,2));
System.out.println("Sub: "+m.sub(3,2));
System.out.println("Multiply: "+m.mult(3,2));
System.out.println("Division: "+m.div(3,2));
System.out.println("Power: "+m.pow(3,2));
System.out.println("Square Root: "+m.sqrt(4));
System.out.println("PI: "+m.PI);
}
}


public class MyMath{

public static final float PI = 3.14159f;

// addition
public static int add(int x, int y){
return x + y;
}

// subtraction
public static int sub(int x, int y){
return x - y;
}

// multiplication
public static int mult(int x, int y){
return x * y;
}

// division
public static int div(int x, int y){
if (y == 0){
return -1;
}
return (int)(x / y);
}

// raise x to the power y - x^y
public static int pow(int x, int y){
return x ^ y;
}

// square root
public static int sqrt(int x){
if (x < 0){
return -1;
}
return (int)Math.sqrt(x);
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