<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students InterviewCracker</title>
<link rel="stylesheet" href="css/style.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<body>
	<div class="main-container">
		<jsp:directive.include file="header.jsp" />
		
		<div>
		<p style="font-size:7px;">&nbsp;</p>
		</div>

			<c:if test="${loggedStudent!=null}">
			<div class="card one" style="margin-left:150px;">
				<h3
					style="border-radius: 25px; text-align: center; font-size: 20px;padding: .7em 10%;">POP
					Exercise Progress</h3>
				<div class="pie"
					style="--p:${(solvedStudentExercise/22) * 100};--b:25px;--c:orange;left:50px;">${solvedStudentExercise}</div>
				<p style="padding: 1em 30%;">Your Rank:${rank}</p>

			<h3
				style="border-radius: 25px; text-align: center; font-size: 20px;padding: .7em 10%;">Coding
				Challenge Progress</h3>
				<div class="pie"
					style="--p:${(solvedStudentCode/22) * 100};--b:25px;--c:purple;left:50px;">${solvedStudentCode}</div>
				<p style="padding: 1em 30%;">Your Rank:${codeRank}</p>
				</div>
			</c:if>
		

		<c:if test="${loggedStudent==null}">
			<div class="card one" style="margin-left:150px;">
				<h3 style="border-radius: 25px; text-align: center; font-size: 20px; padding: .7em 20%;">Progress</h3>

				<canvas id="progressChart" style="width: 100%; max-width: 500px; margin:2rem"></canvas>
				<script>
					var xValues = [ "POP", "Code", "" ];
					var pop = ${solvedExercise};
					var code = ${solvedCode};
					var yValues = [ pop, code, 0 ];
					var barColors = [ "cyan", "gold" ];

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
								text : "Total problems solved"
							}
						}
					});
				</script>
				<p style="margin:2rem">Login to see your customised statistics</p>
			</div>
		</c:if>

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