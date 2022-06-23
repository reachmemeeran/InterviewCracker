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
		<div class="link-item-s">
		   <i>STATISTICS</i>
		</div>
		<div class="link-item-s item-margin-2">
		    <b>Total Coding Question: ${totalCode}</b>
		</div>
		<div class="link-item-s">
		    <b>Total Course: ${totalCourse}</b>
		</div>
		<div class="link-item-s">
		    <b>Total Staffs: ${totalAdmins}</b>
		</div>
		<div class="link-item-s">
		    <b>Total Students: ${totalStudents}</b>
		</div>
     </div>
     
	<div class="indexmiddlebar">     
		<div align="center">
		     <h2>Administrative Dashboard</h2>
		</div>
		<div align="center">
		<hr width="60%"/>
		    <h2 class="pageheading">Quick Actions:</h2> 
		     <b>
		     <a href="codingquestion_form.jsp">New Code</a>&nbsp;&nbsp;&nbsp;
		     <a href="course_form.jsp">New Course</a>&nbsp;&nbsp;&nbsp;
		     <a href="staff_form.jsp">New Staff</a>&nbsp;&nbsp;&nbsp;
		     <a href="student_form.jsp">New Student</a>
		     </b>
		</div>
		
		<div align="center">
		     <hr width="60%"/>
		     <h2 class="pageheading">Statistics</h2>
		     <table>
		     	<tr>
		     		
		     		<td><b>Total Coding Question: ${totalCode}</b></td>
				<td><b>Total Course: ${totalCourse}</b></td>
				<td><b>Total Staffs: ${totalAdmins}</b></td>
				<td><b>Total Students: ${totalStudents}</b></td>
		     	</tr>
		     </table>
		</div>
     </div>
     
     <div class="indexrightbar">
	
         <div class="link-item-s">
             <i>LEADER BOARD - CODING CHALLENGE</i>
         </div>
         <div class="link-item-s item-margin-2">
             TO BE UPDATED
         </div>

     </div>
     <jsp:directive.include file="footer.jsp" />
     </div>
</body>
</html>