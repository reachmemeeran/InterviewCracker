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
		<h3 class="title" style="margin-left:40%;margin-top:30px;">Coding Challenges - ${complexity}</h3>
		<p>&nbsp;</p>  
		<h4 style="color:orange; text-align:center; " >Inspiration from the book "Cracking the Coding Interview 189 Programming Questions and Solutions by Gayle Laakmann McDowell"</h4> 


<c:if test="${fn:contains(complexity, 'Beginner')}">
	<div class="card one">
	
	<table style="margin-left:auto;margin-right:auto;">
						<tr>
							<th>Index</th>
							<th>Summary</th>
							<th>Actions</th>
						</tr>
						<c:forEach var="codingQuestion" items="${listCodingQuestion}" varStatus="status">
						<tr>
							<td>
								<p class="num">${status.index + 1}</p>
							</td>
							<td style="width:1000px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
								<p class="link" style="margin:0.4rem">${codingQuestion.summary}</p>
							</td>
							<td style="width:200px; border-radius: 30px;padding: .01rem 2%;">
							<form>
								<c:if test="${fn:contains(codingQuestion.status, 'Y')}">
									<a class="button-1" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solved</a>
								</c:if>
								<c:if test="${fn:contains(codingQuestion.status, 'N')}">
									<a class="button-3" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solve</a>
								</c:if>
								</form>
		 					</td>
		 					
							
						</tr>
							</c:forEach>
							
						
						</table>

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
		</c:if>	

<c:if test="${fn:contains(complexity, 'Intermediate')}">
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
	<div class="card one">
	
	<table style="margin-left:auto;margin-right:auto;">
						<tr>
							<th>Index</th>
							<th>Summary</th>
							<th>Actions</th>
						</tr>
						<c:forEach var="codingQuestion" items="${listCodingQuestion}" varStatus="status">
						<tr>
							<td>
								<p class="num">${status.index + 1}</p>
							</td>
							<td style="width:800px; border-radius: 20px; background: rgba(0, 231, 255, 0.45);">
								<p class="link" style="margin:0.4rem">${codingQuestion.summary}</p>
							</td>
							<td style="width:200px; border-radius: 20px;padding: .01rem 2%;">
							<form>
								<c:if test="${fn:contains(codingQuestion.status, 'Y')}">
									<a class="button-1" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solved</a>
								</c:if>
								<c:if test="${fn:contains(codingQuestion.status, 'N')}">
									<a class="button-3" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solve</a>
								</c:if>
								</form>
		 					</td>
		 					
							
						</tr>
							</c:forEach>
							
						
						</table>

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
		</c:if>	
		


<c:if test="${fn:contains(complexity, 'Expert')}">
	
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
	<div class="card one">
	
	<table style="margin-left:auto;margin-right:auto;">
						<tr>
							<th>Index</th>
							<th>Summary</th>
							<th>Actions</th>
						</tr>
						<c:forEach var="codingQuestion" items="${listCodingQuestion}" varStatus="status">
						<tr>
							<td>
								<p class="num">${status.index + 1}</p>
							</td>
							<td style="width:400px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
								<p class="link" style="margin:0.4rem">${codingQuestion.summary}</p>
							</td>
							<td style="width:200px; border-radius: 30px;padding: .01rem 2%;">
							<form>
								<c:if test="${fn:contains(codingQuestion.status, 'Y')}">
									<a class="button-1" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solved</a>
								</c:if>
								<c:if test="${fn:contains(codingQuestion.status, 'N')}">
									<a class="button-3" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solve</a>
								</c:if>
								</form>
		 					</td>
		 					
							
						</tr>
							</c:forEach>
							
						
						</table>

		</div>
		</c:if>	
		
		
		</div>
</div>

	<jsp:directive.include file="footer.jsp" />

	<script>
	
		fn:contains(){
			boolean contains(java.lang.String, java.lang.String)
		}
	</script>
</body>
</html>