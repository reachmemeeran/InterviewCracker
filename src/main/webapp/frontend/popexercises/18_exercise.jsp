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

			
 Implement a method (or methods) which converts the height in cm to feet and inches and print as <br>

"Hello <name>, you are <age> and were born in <year>. You are <?> feet and <?> inches tall" <br>

			<p>&nbsp;</p>
			Output should be:<br>  Hello Name you are 35 and were born in 1986 . You are 11 feet and 4 inches tall  <br>
 <br>
			<br>
		</div>
		<div class="popmiddlebar">
			<div align="center">

				<h3 class="pageheading">18. Week 8: Java Types, Control Flow and Error Handing - Lesson 4 Exercise: Methods</h3>
			</div>


			<div align="center">
				<form action="submit_javacode" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="25" cols="70">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="25" cols="70" required="true">class Main {
  public static void main(String[] args) {
  	String name = "Name";
	int age = 35;
	int height=150;
    System.out.println("Hello "+age+" you are "+age+" and were born in 1986 . You are 50 feet and 9 inches tall");
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
  	 String name = "Name";
int age = 35;
int height=150;

 Main m = new Main();

System.out.println("Hello " + name + " you are " + age + " and were born in " + calculateBirthYear(age) + " . You are "
 + convertHeightToFeet(height) + " feet and " + convertHeightToInches(height) + " inches tall " );
}
   public static int calculateBirthYear(int a){
return 2021 - a;
}

public static int convertHeightToFeet(int height){
int tempHeight = Math.round(100 * height/254);
int inches = tempHeight % 12;
return inches;
}

public static int convertHeightToInches(int height){
int tempHeight = Math.round(100 * height/254);
int inches = tempHeight % 12;
int feet = Math.round((tempHeight - inches) / 12);
return feet;
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