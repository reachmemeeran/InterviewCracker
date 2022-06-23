<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>POP Exercises</title>
	
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/jquery-ui.min.css">
	
	<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	
	<script src="https://www.jdoodle.com/assets/jdoodle-pym.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:directive.include file="../header.jsp" />
	<div class="popmiddlebar">
	<div align="center">

		<h2 class="pageheading">
			Lesson 2: Your 1st Program
		</h2>
	</div>
	
		<c:if test="${message!=null}">
		<div align="center">
			<h4 class="message">
				${message}
			</h4>
		</div>
	</c:if>

	<div align="left">
	<br><br>
			 1. Run the "Hello World" program below by selecting the run button<br>
			 2. Edit the code so the program prints out "Goodbye World" instead.<br>
			 3. Edit the code further so the program prints out different text<br>
			<br><br>
	</div>
	
	
	
	<!--<iframe id="exeFrame" name="exeFrame" 
	style='max-width:100%; border: none; height: 375px; width: 700px;' height=375 width=700 
	src=https://www.interviewbit.com/embed/snippet/9c8db3f6c92a309b41dd 
	title='Interviewbit Ide snippet/9c8db3f6c92a309b41dd' loading="lazy"
	 allow="clipboard-write" allowfullscreen referrerpolicy="unsafe-url" 
	 sandbox="allow-scripts allow-same-origin allow-popups allow-top-navigation-by-user-activation allow-popups-to-escape-sandbox"
	 ></iframe> -->
	
	<!-- <form method="post" action="https://www.jdoodle.com/api/redirect-to-post/online-compiler-c++">
  
        <textarea name="initScript" 
            rows="8" cols="80">
        </textarea>
          
        <input type="submit" value="Test">
    </form> 
	
	<div data-pym-src="https://www.jdoodle.com/embed/v0/4UYL"></div>
	
	
	
	<iframe id="exeFrame" name="exeFrame" frameborder="0" width="100%" height="430px" 
	src="https://www.jdoodle.com/embed/v0/4UYL"></iframe>  -->
	
	
	<!-- <div>
	
	 <iframe frameborder="0" width="100%" height="500px" 
	src="https://replit.com/@meeranbath/Lesson-2-Exercise?v=1?embed=true"></iframe> 

	</div> -->
	
	
	<div align="center">
		<form action="submit_c_code" method="post" id="submitCCodeForm">
		
		<textarea name="ccode" rows="16" cols="80"> #include <stdio.h>
            
int main(void) {
	printf("Hello World\n");
	return 0;
}
        </textarea>
		
		<table class="form">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id="buttonSubmit" type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button id="buttonCancel">Cancel</button>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		</form>
	</div>
		
		
</div>

	<jsp:directive.include file="../footer.jsp" />
</body>
<script type="text/javascript">

/* function setFocusThickboxIframe() {
    var iframe = $("#exeFrame")[0];
    iframe.contentWindow.focus();
}


function checkIframeLoaded() {
    // Get a handle to the iframe element
    var iframe = document.getElementById('exeFrame');
    var iframeDoc = iframe.contentDocument || iframe.contentWindow.document;

    // Check if loading is complete
    if (  iframeDoc.readyState  == 'complete' ) {
        //iframe.contentWindow.alert("Hello");
        iframe.contentWindow.onload = function(){
            alert("I am loaded");
        };
        // The loading is complete, call the function we want executed once the iframe is loaded
        afterLoading();
        return;
    } 

    // If we are here, it is not loaded. Set things up so we check   the status again in 100 milliseconds
    window.setTimeout(checkIframeLoaded, 100);
}

function afterLoading(){
    alert("I am here");
} */

	$(document).ready(function() {
		
		
		/* $("#buttonSubmit").click(function() {
			
			/* checkIframeLoaded();
			afterLoading();

			  setTimeout(setFocusThickboxIframe, 1); */
			/*      
			
			debugger;
			//if(document.getElementsByClassName('ace_text-layer') && 
			//		document.getElementsByClassName('ace_text-layer').length){
				var iframe = document.getElementById("exeFrame");
				//var answer = document.getElementsByClassName('ace_text-layer')[1].childNodes[0].innerHTML;
				//var answer = iframe.contentWindow.document.getElementsByClassName('ace_text-layer')[1].childNodes[0].innerHTML;
				var answer = iframe.contentWindow.document.getElementsByClassName('editor-output__spaced')[0].innerText ;
				debugger;
				console.log(answer);
				debugger;
				alert(answer);
				debugger;
				return false;
			//}
		}); */
		
		
		
		$("#submitCCodeForm").validate({
			rules: {
				
			},
			
			messages: {
						
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
</script>
</html>