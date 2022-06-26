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
			<h3 style="background: #002b56; color: #fff; border-radius: 25px; text-align: center;"><p>&nbsp;</p>POP Exercise Progress<p>&nbsp;</p></h3>
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
			<h3 style="background: #002b56; color: #fff; border-radius: 25px; text-align: center;"><p>&nbsp;</p>Coding Challenge Progress<p>&nbsp;</p></h3>
				<p>&nbsp;</p>  
			<p>Coding Question Solved:${totalStudentCode}</p>
			<p>Coding Question Pending:${totalPendingCode}</p>
			
				
     </div>
	
	<div class="indexmiddlebartop">
	<div align="center">
		<h2>POP Exercises:</h2>
		<div align="center">
			    <table border="1">
					<tr>
						<th style="background-color:#002B56; color:#FFF; padding: 10px; height:150px; width:150px;">
							<a style="color:#FFF" href="attempt_exercise?id=1">Week 1-Lesson 2: Your 1st Program <br> 
							<p>&nbsp;</p>  Language: C</a></th>
						<th>&nbsp;</th>
						<th style="background-color:#002B56; color:#FFF; padding: 10px; height:150px; width:150px;">
							<a style="color:#FFF" href="attempt_exercise?id=2">Week 1-Lesson 3: Variables<br> 
							<p>&nbsp;</p>  Language: C</a></th>
						<th>&nbsp;</th>
						<th style="background-color:#002B56; color:#FFF; padding: 10px; height:150px; width:150px;">
							<a style="color:#FFF" href="attempt_exercise?id=3">Week 1-Lesson 4: Errors and Debugging_21<br> 
							<p>&nbsp;</p>  Language: C</a></th>
					</tr>
				</table>
	        </div>
	        <a style="color:red; position: absolute; text-align:right; right: 40px;" href="list_pop_exercise">See More Exercises</a>
	</div>
	</div>
	<div class="indexmiddlebarbottom">
	<div align="center">
		<h2>Coding Challenge:</h2>
		<!-- dsf <br>
		dsfsd<br>
		dsf<br>
		sdf<br>
		sdf<br>
		ds<br>jkhfjkdsfdsjfhdskjfdsnfldsncfbkdsjlcnsjnkdscbndscdsncldsncdccnskcnsdcnsdcjndscjkdsncdksncsdkncdsmcnds
		fsd<br>
		fdsf<br>
		fsd<br>
		fdsf<br>jkhfjkdsfdsjfhdskjfdsnfldsncfbkdsjlcnsjnkdscbndscdsncldsncdccnskcnsdcnsdcjndscjkdsncdksncsdkncdsmcnds
		dsf <br>
		dsfsd<br>
		dsf<br>jkhfjkdsfdsjfhdskjfdsnfldsncfbkdsjlcnsjnkdscbndscdsncldsncdccnskcnsdcnsdcjndscjkdsncdksncsdkncdsmcnds
		sdf<br>
		sdf<br>
		ds<br>
		fsd<br>jkhfjkdsfdsjfhdskjfdsnfldsncfbkdsjlcnsjnkdscbndscdsncldsncdccnskcnsdcnsdcjndscjkdsncdksncsdkncdsmcnds
		fdsf<br>
		fsd<br>
		fdsf<br> -->
	</div>
	</div>
	
	<div class="indexrightbar">
	
	    <h3>POP Leader Board</h3>
		<p>&nbsp;</p>            
            
           <div align="center">
		    <table border="1">
				<tr>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Leader</th>
					<th style="background-color:#002B56; color:#FFF; padding: 10px;">Points</th>
				</tr>
				<c:forEach items="${leaderMap}" var="entry">
					<tr>
						<td style="background-color:#002B5636; text-align: center">${entry.key}</td>
						<td style="background-color:#002B5636; text-align: center">${entry.value}</td>
					</tr>
				</c:forEach>
			</table>
        </div>
		<p>&nbsp;</p>   
		<p>&nbsp;</p>   
		<p>&nbsp;</p>   
		<h3>Coding Challenge Leader Board</h3>
		<p>&nbsp;</p>    
	
	<jsp:directive.include file="footer.jsp" />
	</div>
	
</body>
</html>