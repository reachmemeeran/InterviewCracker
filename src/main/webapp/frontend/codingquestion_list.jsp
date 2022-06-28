<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Coding Challenge</title>
	
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/jquery-ui.min.css">
	
	<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="poplistmiddlebar">
	<div align="center">

		<h2 class="pageheading">
			Coding Challenge
		</h2>
	</div>

	<div align="center">
		<h3>
			
		</h3>
	</div>

	<c:if test="${message!=null}">
		<div align="center">
			<h4 class="message">
				${message}
			</h4>
		</div>
	</c:if>
	
	<div class="costeasybar">
	<h3 style="background: #002b56; color: #fff; border-radius: 10px; text-align: center;"><p>&nbsp;</p><a style="color:#FFF;" href="list_code_easy">Level - Easy</a><p>&nbsp;</p></h3>
				<p>&nbsp;</p>  
				
		<pre>
Arrays
String
List
Set
Logics:
  Palindrome
  Fibonacci series 
  Recursive
  Iterative
  Prime numbers
</pre>

<p>&nbsp;</p>
<a style="color:red; position: absolute; text-align:right; top: 290px;" href="list_code_easy">Click to Solve</a>  
	</div>
	
	<div class="costmediumbar">
	<h3 style="background: #002b56; color: #fff; border-radius: 10px; text-align: center;"><p>&nbsp;</p><a style="color:#FFF;" href="list_code_medium">Level - Medium</a><p>&nbsp;</p></h3>
				<p>&nbsp;</p>       
<pre>
Implement Stack with Queue
Implement Queue with Stack
MultiThreading
Regular Expressions

</pre>
<p>&nbsp;</p>
<a style="color:red; position: absolute; text-align:right; top: 290px;" href="list_code_medium">Click to Solve</a> 
	</div>
	
	<div class="costAdvancedbar">
	<h3 style="background: #002b56; color: #fff; border-radius: 10px; text-align: center;"><p>&nbsp;</p><a style="color:#FFF;" href="list_code_advanced">Level - Advanced</a><p>&nbsp;</p></h3>
				<p>&nbsp;</p>       
<pre>
Trees
Graphs
Sorting
Searching
System Design
Design Patterns
Big O:
  Time Complexity
  Space Complexity
</pre>
<p>&nbsp;</p>
<a style="color:red; position: absolute; text-align:right; top: 290px;" href="list_code_advanced">Click to Solve</a> 
	</div>
	
	<a style="color:orange; position: absolute; text-align:right; top: 480px;" >Inspiration from the book "Cracking the Coding Interview 189 Programming Questions and Solutions by Gayle Laakmann McDowell"</a> 
	
</div>

	<jsp:directive.include file="footer.jsp" />

	<script>
	
		$(document).ready(function(){
			$(".deleteLink").each(function(){
				$(this).on("click",function(){
					popExerciseId=$(this).attr("id");
					if(confirm("Are you sure you want to delete the student with ID " + popExerciseId + " ?")){
						window.location = 'delete_student?id='+popExerciseId;
					}
				});
			});
		});
		
		fn:contains(){
			boolean contains(java.lang.String, java.lang.String)
		}
	</script>
</body>
</html>