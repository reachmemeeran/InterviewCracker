<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students InterviewCracker</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="main-container">
	<jsp:directive.include file="header.jsp" />
	<div class="indexleftbar">
	
	<p>&nbsp;</p> 
	<p>&nbsp;</p> 
			<h3 style="text-decoration: underline; color: #002b56; border-radius: 25px; text-align: center; font-size: 20px;">POP Exercise Progress</h3>
				<p>&nbsp;</p>       
				<c:if test="${loggedStudent!=null}">
					<p>POP Exercises Solved:${solvedStudentExercise}</p>
					<p>&nbsp;</p>  
					<p>POP Exercises Pending:${22-solvedStudentExercise}</p>  
					<p>&nbsp;</p>  
					<p>Your Rank:${rank}</p>
				</c:if>
				<c:if test="${loggedStudent==null}">
					<p>Total POP Exercises Solved:${solvedExercise}</p>
					<p>&nbsp;</p>  
					<p>Login to see your customised statistics</p>
					<p>&nbsp;</p>  
				</c:if>
			
			<p>&nbsp;</p> 
			<p>&nbsp;</p> 
			<p>&nbsp;</p> 
			<p>&nbsp;</p> 
			<p>&nbsp;</p> 
			<p>&nbsp;</p> 
			
			<div class="line"></div>
			
			<h3 style="text-decoration: underline; color: #002b56; border-radius: 25px; text-align: center; font-size: 20px;">Coding Challenge Progress</h3>
				<p>&nbsp;</p>  
			<c:if test="${loggedStudent!=null}">
					<p>Coding Question Solved:${solvedStudentCode}</p>
					<p>&nbsp;</p>  
					<p>Coding Question Pending:${23-solvedStudentCode}</p>  
					<p>&nbsp;</p>  
					<p>Your Rank:${codeRank}</p>
				</c:if>
				<c:if test="${loggedStudent==null}">
					<p>Total Coding Question Solved:${solvedCode}</p>
					<p>&nbsp;</p>  
					<p>Login to see your customised statistics</p>
					<p>&nbsp;</p>  
				</c:if>
			
				
     </div>
	
	<div class="indexmiddlebartop">
	
	<div align="center">
		<h3>POP Exercises:</h3>
			<div class="costeasybarindex">
<h4 style="text-decoration: underline; text-align: center;"><a style="color:#002b56;"  href="list_pop_exercise">Week-1</a></h4>
<p>&nbsp;</p> 
<pre>
Your 1st Program
Variables
Errors
Debugging
</pre>

<a style="color:#025acc; position: absolute; text-align:middle; top: 80%;" href="list_pop_exercise">Click to Solve</a>  
	</div>
	
	<div class="costmediumbarindex">
	<h4 style="text-decoration: underline; text-align: center;"><a style="color:#002b56;"  href="list_pop_exercise">Week-2</a></h4>
	<p>&nbsp;</p> 
<pre>
Functions
Global Variables
Flow of Execution
Recursion
Iteration
</pre>
<a style="color:#025acc; position: absolute; text-align:middle; top: 80%;" href="list_pop_exercise">Click to Solve</a> 
	</div>
	
	<div class="costAdvancedbarindex">
	<h4 style="text-decoration: underline; text-align: center;"><a style="color:#002b56;"  href="list_pop_exercise">Week-3</a></h4>
	<p>&nbsp;</p> 
<pre>
Encapsulation
Arrays
Strings
String Functions
</pre>
<a style="color:#025acc; position: absolute; text-align:middle; top: 80%;" href="list_pop_exercise">Click to Solve</a> 
	</div>
	
		
	</div>
	
	
	
	
	<div align="center">
	        <a style="color:#025acc; position: absolute; text-align:right; right: 3%; top: 5%" href="list_pop_exercise">See More Exercises</a>
	</div>
	</div>
	<div class="indexmiddlebarbottom">
	<div align="center">
		<h3>Coding Challenge:</h3>
			<div class="costeasybarindex">
	<h4 style="text-decoration: underline; text-align: center;"><a style="color:#002b56;" href="list_code_easy">Level-Easy</a></h4>
				<p>&nbsp;</p> 
		<pre>
Arrays & String
List & Set
Recursive
Iterative
Palindrome
Prime numbers
Fibonacci series
</pre>

<a style="color:#025acc; position: absolute; text-align:middle; top: 90%;" href="list_code_easy">Click to Solve</a>  
	</div>
	
	<div class="costmediumbarindex">
	<h4 style="text-decoration: underline; text-align: center;"><a style="color:#002b56;"  href="list_code_medium">Level-Medium</a></h4>
<p>&nbsp;</p> 
<pre>
Stack
Queue
MultiThreading
Regular Expression
</pre>
<a style="color:#025acc; position: absolute; text-align:middle; top: 90%;" href="list_code_medium">Click to Solve</a> 
	</div>
	
	<div class="costAdvancedbarindex">
	<h4 style="text-decoration: underline; text-align: center;"><a style="color:#002b56;"  href="list_code_advanced">Level-Advanced</a></h4>
<p>&nbsp;</p> 
<pre>
Trees & Graphs
Sorting
Searching
System Design
Design Patterns
Time Complexity
Space Complexity
</pre>
<a style="color:#025acc; position: absolute; text-align:middle; top: 90%;" href="list_code_advanced">Click to Solve</a> 
	</div>
	
		
	</div>
	
	</div>
	
	<div class="indexrightbar">
	
	    <h3>POP Leader Board</h3>
		<p>&nbsp;</p>            
            
           <div align="center">
		    <table border="1">
				<tr>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Rank</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Programmer</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Score</th>
				</tr>
				<c:forEach items="${leaderMap}" var="entry" varStatus="status">
					<tr>
						<td style="background-color:#002B5636; text-align: center">${status.index + 1}</td>
						<td style="background-color:#002B5636; text-align: center">${entry.key}</td>
						<td style="background-color:#002B5636; text-align: center">${entry.value}</td>
					</tr>
				</c:forEach>
			</table>
        </div>
		<p>&nbsp;</p>   
		<p>&nbsp;</p>   
		<p>&nbsp;</p>   
					<p>&nbsp;</p> 
			<p>&nbsp;</p> 
			
			<div class="line"></div>
		<h3>Coding Challenge Leader Board</h3>
		<p>&nbsp;</p>    
		<div align="center">
		    <table border="1">
				<tr>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Rank</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Programmer</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Score</th>
				</tr>
				<c:forEach items="${codeleaderMap}" var="entry" varStatus="status">
					<tr>
						<td style="background-color:#002B5636; text-align: center">${status.index + 1}</td>
						<td style="background-color:#002B5636; text-align: center">${entry.key}</td>
						<td style="background-color:#002B5636; text-align: center">${entry.value}</td>
					</tr>
				</c:forEach>
			</table>
        </div>
	
	<jsp:directive.include file="footer.jsp" />
	</div>
	
</body>
</html>