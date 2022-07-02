<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="ISO-8859-1">
   <title>InterviewCracker Administration</title>
   <link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div class="main-container">
     <jsp:directive.include file="header.jsp" />
     
    <div class="indexleftbar">
    	<p>&nbsp;</p> 
		<p>&nbsp;</p> 
		<h3 style="background: #002b56; color: #fff; border-radius: 25px; text-align: center;"><p>&nbsp;</p>Statistics<p>&nbsp;</p></h3>
		<p>&nbsp;</p>       
		<p>Total Number of POP Exercises:22</p>
		<p>&nbsp;</p>  
		<p>Total Coding Questions:23</p>  
		<p>&nbsp;</p>  
		<p>Total Staffs: ${totalAdmins}</p> 
		<p>&nbsp;</p> 
		<p>Total Students: ${totalStudents}</p> 
		<p>&nbsp;</p>  
     </div>
     
	<div class="indexmiddlebaradmin">     
		<div align="center">
		     <h2>Administrative Dashboard</h2>
		</div>
		<div align="center">
		<hr width="60%"/>
		<p>&nbsp;</p>  
		    <h2 class="pageheading">Quick Actions:</h2> 
		     <b>
		     <p>&nbsp;</p>  
		     <a href="staff_form.jsp">Create New Staff</a> <br>
		     <a href="student_form.jsp">Create New Student</a><p>&nbsp;</p>  <br>
		     
		     <a href="popexercise_form.jsp">Create New POP Exercise</a> <br>
		     <a href="codingquestion_form.jsp">Create New Coding Question</a><p>&nbsp;</p>  <br>
		     </b>
		</div>
		
		<div align="center">
		     <hr width="60%"/>
		     	<p>&nbsp;</p>  
				<p>&nbsp;</p>  
		     <h2 class="pageheading">Statistics</h2>
		     
		     <table border="1">
		     	<tr>
		     		<th style="background-color:#002B56; color:#FFF; padding: 10px;">Total POP Exercises</th>
		     		<th style="background-color:#002B56; color:#FFF; padding: 10px;">Total Coding Question</th>
		     		<th style="background-color:#002B56; color:#FFF; padding: 10px;">Total Staffs</th>
		     		<th style="background-color:#002B56; color:#FFF; padding: 10px;">Total Students</th>
		     	</tr>
		     	<tr>
		     		<td style="background-color:#002B5636; text-align: center">22</td>
		     		<td style="background-color:#002B5636; text-align: center">23</td>
					<td style="background-color:#002B5636; text-align: center">${totalAdmins}</td>
					<td style="background-color:#002B5636; text-align: center">${totalStudents}</td>
		     	</tr>
		     </table>
		</div>
		<p>&nbsp;</p>  
		     <p>&nbsp;</p>  
		     <p>&nbsp;</p>  
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

     </div>
     <jsp:directive.include file="footer.jsp" />
     </div>
</body>
</html>