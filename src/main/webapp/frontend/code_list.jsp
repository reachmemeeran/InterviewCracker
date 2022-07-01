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
			Coding Challenges - ${complexity}
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
	
	<p>&nbsp;</p>
	<p>&nbsp;</p>

<c:if test="${fn:contains(complexity, 'Easy')}">
	<div class="costeasybarone">
	Level - ${complexity}
			<table border="1" cellpadding="5">
				<tr>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Summary</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Actions</th>
				</tr>
				<c:forEach var="codingQuestion" items="${listCodingQuestion}"
					varStatus="status">
						<tr>
							<td style="background-color:#002B5636">${status.index + 1}. ${codingQuestion.summary}</td>
							<td>
								<c:if test="${fn:contains(codingQuestion.status, 'Y')}">
									<a style="color:#3CA234" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solved</a> &nbsp; 
								</c:if>
								<c:if test="${fn:contains(codingQuestion.status, 'N')}">
									<a style="color:#BD1B1B" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solve</a> &nbsp; 
								</c:if>
							</td>
						</tr>
				</c:forEach>
			</table>
		</div>
			<div class="costmediumbar">
	<h3 style="background: #002b56; color: #fff; border-radius: 10px; text-align: center;"><p>&nbsp;</p><a style="color:#FFF;" href="list_code_medium">Level - Medium</a><p>&nbsp;</p></h3>
				<p>&nbsp;</p>       
<pre>
Stack
Queue
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
		</c:if>	

<c:if test="${fn:contains(complexity, 'Medium')}">
<div class="costeasybar">
	<h3 style="background: #002b56; color: #fff; border-radius: 10px; text-align: center;"><p>&nbsp;</p><a style="color:#FFF;" href="list_code_easy">Level - Easy</a><p>&nbsp;</p></h3>
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
<a style="color:red; position: absolute; text-align:right; top: 290px;" href="list_code_easy">Click to Solve</a>  
	</div>
	<div class="costmediumbarone">
	Level - ${complexity}
			<table border="1" cellpadding="5">
				<tr>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Summary</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Actions</th>
				</tr>
				<c:forEach var="codingQuestion" items="${listCodingQuestion}"
					varStatus="status">
						<tr>
							<td style="background-color:#002B5636">${status.index + 1}. ${codingQuestion.summary}</td>
							<td>
								<c:if test="${fn:contains(codingQuestion.status, 'Y')}">
									<a style="color:#3CA234" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solved</a> &nbsp; 
								</c:if>
								<c:if test="${fn:contains(codingQuestion.status, 'N')}">
									<a style="color:#BD1B1B" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solve</a> &nbsp; 
								</c:if>
							</td>
						</tr>
				</c:forEach>
			</table>
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
		</c:if>	
		


<c:if test="${fn:contains(complexity, 'Advanced')}">
<div class="costeasybar">
	<h3 style="background: #002b56; color: #fff; border-radius: 10px; text-align: center;"><p>&nbsp;</p><a style="color:#FFF;" href="list_code_easy">Level - Easy</a><p>&nbsp;</p></h3>
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
<a style="color:red; position: absolute; text-align:right; top: 290px;" href="list_code_easy">Click to Solve</a>  
	</div>	
			<div class="costmediumbar">
	<h3 style="background: #002b56; color: #fff; border-radius: 10px; text-align: center;"><p>&nbsp;</p><a style="color:#FFF;" href="list_code_medium">Level - Medium</a><p>&nbsp;</p></h3>
				<p>&nbsp;</p>       
<pre>
Stack
Queue
MultiThreading
Regular Expressions
</pre>
<p>&nbsp;</p>
<a style="color:red; position: absolute; text-align:right; top: 290px;" href="list_code_medium">Click to Solve</a> 
	</div>
	
<div class="costAdvancedbarone">
	Level - ${complexity}
			<table border="1" cellpadding="5">
				<tr>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Summary</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Actions</th>
				</tr>
				<c:forEach var="codingQuestion" items="${listCodingQuestion}"
					varStatus="status">
						<tr>
							<td style="background-color:#002B5636">${status.index + 1}. ${codingQuestion.summary}</td>
							<td>
								<c:if test="${fn:contains(codingQuestion.status, 'Y')}">
									<a style="color:#3CA234" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solved</a> &nbsp; 
								</c:if>
								<c:if test="${fn:contains(codingQuestion.status, 'N')}">
									<a style="color:#BD1B1B" href="attempt_code?id=${codingQuestion.codingQuestionId}">Solve</a> &nbsp; 
								</c:if>
							</td>
						</tr>
				</c:forEach>
			</table>
		</div>
		</c:if>	
		
			<a style="color:orange; position: absolute; text-align:right; top: 480px;" >Inspiration from the book "Cracking the Coding Interview 189 Programming Questions and Solutions by Gayle Laakmann McDowell"</a> 
		
		
</div>

	<jsp:directive.include file="footer.jsp" />

	<script>
	
		fn:contains(){
			boolean contains(java.lang.String, java.lang.String)
		}
	</script>
</body>
</html>