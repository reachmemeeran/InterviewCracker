<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<div class="main-container">
	<jsp:directive.include file="header.jsp" />

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
	
	<div class="card one" style="width:92%; height:400px; overflow:hidden;">
		<h3 class="title" style="margin-left:40%;margin-top:30px;">Coding Challenges</h3>
		<p>&nbsp;</p>  
		<h4 style="color:orange; text-align:center; " >Inspiration from the book <i>"Cracking the Coding Interview"</i> by Gayle Laakmann McDowell</h4> 
			
	<div class="card one" style="width:20%; height:200px; ">
	<h3 style="background: rgb(19, 126, 144); color: #fff; border-radius: 10px; text-align: center;"><a style="color:#FFF;" href="list_code_easy">Level - Beginner</a></h3>
				<p>&nbsp;</p>  
				
		<pre>
Arrays
String
List
Set
Logics:
  Recursive
  Iterative
  Palindrome
  Prime numbers
  Fibonacci series 
</pre>

<p>&nbsp;</p>
<a class="button-3" href="list_code_easy">Solve Challenge</a>
	</div>
	
	<div class="card one" style="width:20%;height:200px;  ">
	<h3 style="background: rgb(19, 126, 144); color: #fff; border-radius: 10px; text-align: center;"><a style="color:#FFF;" href="list_code_medium">Level - Intermediate</a></h3>
				<p>&nbsp;</p>       
<pre>
Stack
Queue
MultiThreading
Regular Expressions

</pre>
<p>&nbsp;</p>
<a class="button-3" href="list_code_medium">Solve Challenge</a>
	</div>
	
	<div class="card one" style="width:20%;height:200px;  ">
	<h3 style="background: rgb(19, 126, 144); color: #fff; border-radius: 10px; text-align: center;"><a style="color:#FFF;" href="list_code_advanced">Level - Expert</a></h3>
				<p>&nbsp;</p>       
<pre>
Trees
Graphs
Sorting
Searching
Lambda Expressions
</pre>
<p>&nbsp;</p>
<a class="button-3" href="list_code_advanced">Solve Challenge</a>
	</div>
	
	</div>
</div>

	<jsp:directive.include file="footer.jsp" />

</body>
</html>