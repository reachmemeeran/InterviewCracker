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
	
            <div class="link-item-s">
               <i>PROGRESS</i>
            </div>
            <div class="link-item-s item-margin-2">
                <b>Coding Question Solved:${totalStudentCode}</b>
            </div>
            <div class="link-item-s">
                <b>Coding Question Pending:${totalPendingCode}</b>
            </div>
            <div class="link-item-s">
                <b>Module Covered:${totalStudentCourse}</b>
            </div>
            <div class="link-item-s">
                <b>Module Pending:${totalPendingCourse}</b>
            </div>
     </div>
	
	<div class="indexmiddlebartop">
	<div align="center">
		<h2>Coding Challenge:</h2>
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
		<h2>Java Courses:</h2>
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
	
            <div class="link-item-s">
                <h3>POP LEADER BOARD</h3>
            </div>
            
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
	
	<jsp:directive.include file="footer.jsp" />
	</div>
	
</body>
</html>