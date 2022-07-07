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
   <script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<body>
	<div class="main-container">
     <jsp:directive.include file="header.jsp" />
     <div class="card one" style="margin-left:150px;width:300px;">
				<h3 style="border-radius: 25px; text-align: center; font-size: 20px; padding: .7em 20%;">Statistics</h3>

				<canvas id="progressChart" style="width: 100%; max-width: 400px; margin:1rem"></canvas>
				<script>
					var xValues = [ "POP", "Code","Staffs","Students" ,"" ];
					var admins = ${totalAdmins};
					var students = ${totalStudents};
					var yValues = [ 22, 20,admins,students, 0 ];
					var barColors = [ "cyan", "gold","purple","orange" ];

					new Chart("progressChart", {
						type : "bar",
						data : {
							labels : xValues,
							datasets : [ {
								backgroundColor : barColors,
								data : yValues
							} ]
						},
						options : {
							legend : {
								display : false
							},
							title : {
								display : true,
								text : "Stat"
							}
						}
					});
				</script>
				
				<div class="card one" style="width:80%;margin-top:10px;margin-right:-1px;margin-bottom:-1px;margin-left:30px;border-radius:0px;min-height:30px;background:#008092;">
					<h3 style="border-radius: 25px; text-align: center; font-size: 20px; padding: .7em 20%;">Quick Actions:</h3>
				     <b>
				     <a class="button-1" href="staff_form.jsp">Create New Staff</a> <br><p>&nbsp;</p>  
				     <a class="button-3" style="float:right;" href="student_form.jsp">Create New Student</a>  <br><p>&nbsp;</p>  
				     
				     <a class="button-1" href="popexercise_form.jsp">Create New POP Exercise</a> <br><p>&nbsp;</p>  
				     <a class="button-3" style="float:right;" href="codingquestion_form.jsp">Create New Coding Question</a><p>&nbsp;</p>  
				     <p>&nbsp;</p>  
				     </b>
			     </div>
			</div>
			
			
			<div class="card one">
			<h3 class="title" style="padding: .7em 20%;">POP Leaderboard</h3>
			<div></div>
			<div class="profile">
				<div class="person second">
					<div class="num">2</div>
					<i class="fas fa-caret-up"></i> <img
						src="https://image.flaticon.com/icons/png/512/949/949666.png"
						alt="" class="photo">
					<p class="link">${pop2key}</p>
					<p class="points">${pop2value}</p>
				</div>
				<div class="person first">
					<div class="num">1</div>
					<i class="fas fa-crown"></i> <img
						src="https://image.flaticon.com/icons/png/512/4086/4086600.png"
						alt="" class="photo main">
					<p class="link">${pop1key}</p>
					<p class="points">${pop1value}</p>
				</div>
				<div class="person third">
					<div class="num">3</div>
					<i class="fas fa-caret-up"></i> <img
						src="https://image.flaticon.com/icons/png/512/4333/4333609.png"
						alt="" class="photo">
					<p class="link">${pop3key}</p>
					<p class="points">${pop3value}</p>
				</div>
			</div>
			<c:forEach items="${leaderMap}" var="entry" varStatus="status">
					<table>
						<tr>
							<td>
							<div class="rank">
									<i class="fas fa-caret-up"></i>
									<p class="num">${status.index + 1}</p>
								</div>
							</td>
							<td style="width:200px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
									<p class="link" style="margin:0.4rem">${entry.key}</p>
							</td>
							<td style="width:30px; border-radius: 10px; background: rgba(0, 231, 255, 0.45);">
									<p class="link" style="margin:0.4rem">${entry.value}</p>
							</td>
						</tr>
							
						
						</table>
			</c:forEach>
		</div>
		
		<div class="card one" style="margin-right:10px;">
			<h3 class="title" style="padding: .7em 10%;">Code Challenge Leaderboard</h3>
			<div></div>
			<div class="profile">
				<div class="person second">
					<div class="num">2</div>
					<i class="fas fa-caret-up"></i> <img
						src="https://image.flaticon.com/icons/png/512/949/949666.png"
						alt="" class="photo">
					<p class="link">${code2key}</p>
					<p class="points">${code2value}</p>
				</div>
				<div class="person first">
					<div class="num">1</div>
					<i class="fas fa-crown"></i> <img
						src="https://image.flaticon.com/icons/png/512/4086/4086600.png"
						alt="" class="photo main">
					<p class="link">${code1key}</p>
					<p class="points">${code1value}</p>
				</div>
				<div class="person third">
					<div class="num">3</div>
					<i class="fas fa-caret-up"></i> <img
						src="https://image.flaticon.com/icons/png/512/4333/4333609.png"
						alt="" class="photo">
					<p class="link">${code3key}</p>
					<p class="points">${code3value}</p>
				</div>
			</div>
			<c:forEach items="${codeleaderMap}" var="entry" varStatus="status">
					<table>
						<tr>
							<td>
							<div class="rank">
									<i class="fas fa-caret-up"></i>
									<p class="num">${status.index + 1}</p>
								</div>
							</td>
							<td style="width:200px; border-radius: 30px; background: rgba(0, 231, 255, 0.45);">
									<p class="link" style="margin:0.4rem">${entry.key}</p>
							</td>
							<td style="width:30px; border-radius: 10px; background: rgba(0, 231, 255, 0.45);">
									<p class="link" style="margin:0.4rem">${entry.value}</p>
							</td>
						</tr>
							
						
						</table>
			</c:forEach>
		</div>
     </div>
     <jsp:directive.include file="footer.jsp" />
     
</body>
</html>