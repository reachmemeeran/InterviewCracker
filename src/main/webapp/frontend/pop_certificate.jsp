<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POP Certificate</title>
<link rel="stylesheet" href="css/style.css"> 
<link rel="stylesheet" type="text/css" media="print" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>

<style type="text/css" media="print">
    @page { 
        size: landscape;
    }
</style>
<style type="text/css" media="all">
   @import "css/style.css";
</style>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("#btnPrint").live("click", function () {
            var divContents = $("#print").html();
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(divContents);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            printWindow.print();
        });
    </script>
</head>
<body>
<div class="cert-container">
	<input class="button-3" style="margin-top:20px;" type="BUTTON" value="Home" onclick="window.location.href='${pageContext.request.contextPath}'">
         
	<button class="button-1" onclick="window.print()">Print Certificate</button>
	<!--  <button onclick="PrintElem(document.getElementById('print'))">Print element</button>
	<input type="button" value="Print Div Contents" id="btnPrint" />-->

	<div id="print" class="card one" style="width:90%; height:90%; box-shadow:0px 0px 0px 10px grey inset;">
	
	
		<div style="width: 60%; float:left;">
		<div style="text-align: left;margin-top: 2%; color: gray">
			<p class="certhead">CERTIFICATE</p> 
			<p class="certheadAchieve">Of Achievement</p>
			<hr style="width:40%; color:black; margin-left:3%; height:5px; background-color:#fff;">  
			<p class="certpresent">THIS CERTIFICATE PROUDLY PRESENTED TO:</p>
			<p class="module-border-wrap">${loggedStudent.fullname} &nbsp</p>
			
			<c:if test="${solvedExercise==23}">
				<p class="certcontent">for successfully completing all 22 Exercises in the Principles of Programming module.</p>
				
			</c:if>
			<c:if test="${solvedExercise!=23}">
				<p class="certcontent">for successfully completing <b> ${solvedExercise} out of 22 Exercises </b> and ranked <b> Number - ${rank}</b> in the Principles of Programming module.</p>
				
			</c:if>
			
			
			<div style="width: 45%; float:left; margin-left:3%;">
				<%
			         Date date = new Date();
			         out.print( "<p class = \"certdatedis\">" +date.toString()+"</p>");
			    %>
				<hr style="width:80%; color:black; margin-left:3%; height:5px; background-color:#fff;"> 
				<p class="certdate">DATE</p>
			</div>
			<div style="width: 45%; float:right; margin-left:3%;">
			         <p class ="certsigndis">PROFESSOR SIGNATURE</p>
				<hr style="width:80%; color:black; margin-left:3%; height:5px; background-color:#fff;"> 
				<p class="certdate">SIGNATURE</p>
			</div>
		</div>
		
		
		
		</div>
		<div style="width: 40%; float:right;">
			<div style="display: flex; justify-content: center;margin-top: 3%;margin-right: 3%;">
				<img src="images/InterviewCracker.jpg" style="width:400px;height:400px;">
			</div>
			<div>
				<p style="color: gray; margin-top: 10%; margin-left: 20%;">Issued by InterviewCracker</p> 
				<p style="color: gray; margin-left: 20%;">as part of the university programme</p> 
			</div>
		</div>
	</div>
</div>
	

</body>

<script type="text/javascript">

function PrintElem(elem) {
    Popup($(elem).html());
}

function Popup(data) {
    var mywindow = window.open('', 'new div', 'height=400,width=600');
    mywindow.document.write('<html><head><title></title>');
    mywindow.document.write('<link rel="stylesheet" href="css/style.css" type="text/css" />');
    mywindow.document.write('</head><body >');
    mywindow.document.write(data);
    mywindow.document.write('</body></html>');
    mywindow.focus();
    setTimeout(function(){mywindow.print();},1000);
    return true;
}
</script>

</html>