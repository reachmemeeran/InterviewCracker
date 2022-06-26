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
			<h3>POP Exercise Progress</h3>
				<p>&nbsp;</p>       
				<c:if test="${loggedStudent!=null}">
					<p>POP Exercises Solved:${solvedStudentExercise}</p>
					<p>&nbsp;</p>  
					<p>POP Exercises Pending:${22-solvedStudentExercise}</p>  
					<p>&nbsp;</p>  
					<p>Total POP Exercises Solved:${solvedExercise}</p>
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
			<h3>Coding Challenge Progress</h3>
				<p>&nbsp;</p>  
			<p>Coding Question Solved:${totalStudentCode}</p>
			<p>Coding Question Solved:${totalPendingCode}</p>
			
				
     </div>
	
	<div class="indexmiddlebartop">
	<div align="center">
		<h2>POP Exercises:</h2>
		<!-- jkhfjkdsfdsjfhdskjfdsnfldsncfbkdsjlcnsjnkdscbndscdsncldsncdccnskcnsdcnsdcjndscjkdsncdksncsdkncdsmcnds mcnsd mcnsdcmnds csdc sdmdsf <br>
		dsfsd<br>
		dsf<br>
		sdf<br>
		sdf<br>
		ds<br>
		fsd<br>jkhfjkdsfdsjfhdskjfdsnfldsncfbkdsjlcnsjnkdscbndscdsncldsncdccnskcnsdcnsdcjndscjkdsncdksncsdkncdsmcnds
		fdsf<br>
		fsd<br>
		fdsf<br>
		dsf <br>jkhfjkdsfdsjfhdskjfdsnfldsncfbkdsjlcnsjnkdscbndscdsncldsncdccnskcnsdcnsdcjndscjkdsncdksncsdkncdsmcnds
		dsfsd<br>
		dsf<br>
		sdf<br>jkhfjkdsfdsjfhdskjfdsnfldsncfbkdsjlcnsjnkdscbndscdsncldsncdccnskcnsdcnsdcjndscjkdsncdksncsdkncdsmcnds
		sdf<br>
		ds<br>
		fsd<br>jkhfjkdsfdsjfhdskjfdsnfldsncfbkdsjlcnsjnkdscbndscdsncldsncdccnskcnsdcnsdcjndscjkdsncdksncsdkncdsmcnds
		fdsf<br>
		fsd<br>
		fdsf<br> -->
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
            <!--  
            
            <c:forEach items="${listPopLeaders}" var="popLeaders">
            
            ${popLeaders.studentCodingTestId}
            ${popLeaders.students.studentsId}
            ${popLeaders.hitCount}
            
            </c:forEach>
            -->
            
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