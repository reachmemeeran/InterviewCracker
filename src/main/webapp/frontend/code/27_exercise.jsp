<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Coding Challenge</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/jquery-ui.min.css">

<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<div class="main-container">
		<jsp:directive.include file="../header.jsp" />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<jsp:directive.include file="../header.jsp" />
		<div class="codeheading">
		<h3>Easy-5: Fibonacci Series</h3>
		</div>

		<div class="codelefttopbar">

<pre>
<p style="font-weight: bold;">Fibonacci Series:</p>In fibonacci series, next number is the sum of previous two numbers.
For example 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 etc. 
The first two numbers of fibonacci series are 0 and 1.

There are two ways to write the fibonacci series program in java:

Fibonacci Series without using recursion
Fibonacci Series using recursion

</pre>

 <br>
 <br>
			<br>
		</div>
		<div class="codemiddlebar">
			
			<div align="left">

				<pre>
<p style="font-weight: bold;">Question:</p>Complete the program to print fibonacci series with and without recursion
<p style="font-weight: bold;">Expected Output:</p>Non-Recursive Fibonacci is: 0 1 1 2 3 5 8 13 21 34
Recursive Fibonacci is: 0 1 1 2 3 5 8 13 21 34
</pre>
			</div>


			<div align="center">
				<form action="submit_javacoding" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="20" cols="70" style="background-color:#002b56 ; color:#fff">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="20" cols="70" style="background-color:#002b56 ; color:#fff" required="true">
import java.util.*;

class Main{
  static int n1=0,n2=1,n3=0;   
  public static void main(String args[]){
    int count = 10;
    System.out.print("Non-Recursive Fibonacci is: "+n1+" "+n2);//printing 0 and 1
    nonRecursiveFibonacci(count);
    System.out.println("");
    n1=0;
    n2=1;
    System.out.print("Recursive Fibonacci is: "+n1+" "+n2);//printing 0 and 1
    recursiveFibonacci(count-2);
  }

  static void nonRecursiveFibonacci(int count){  
    for(int i=2;i< count;++i) {    
    //COMPLETE THE LOOP
      System.out.print(" "+n3);    
         
    }
  }

  static void recursiveFibonacci(int count){  
    if(count>0){    
      
      System.out.print(" "+n3);   
      // PERFORM RECURSIVE CALL   
     }  
  }
}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<table class="form">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td colspan="1" align="center"><input type="BUTTON"
									value="Back"
									onclick="window.location.href='list_code_easy'"></td>
							</tr>
						</table>

					</c:if>



					<textarea name="answerCode" style="display: none;">
import java.util.*;

class Main{
  static int n1=0,n2=1,n3=0;   
  public static void main(String args[]){
    int count = 10;
    System.out.print("Non-Recursive Fibonacci is: "+n1+" "+n2);//printing 0 and 1
    nonRecursiveFibonacci(count);
    System.out.println("");
    n1=0;
    n2=1;
    System.out.print("Recursive Fibonacci is: "+n1+" "+n2);//printing 0 and 1
    recursiveFibonacci(count-2);
  }

  static void nonRecursiveFibonacci(int count){  
    for(int i=2;i<count;++i) {    
      n3=n1+n2;    
      System.out.print(" "+n3);    
      n1=n2;    
      n2=n3;    
    }
  }

  static void recursiveFibonacci(int count){  
    if(count>0){    
      n3 = n1 + n2;    
      n1 = n2;    
      n2 = n3;    
      System.out.print(" "+n3);   
      recursiveFibonacci(count-1);    
     }  
  }
}
</textarea>
					<input type="hidden" name="exerciseId" value="${exerciseId}">

					<c:if test="${status==null}">
						<table class="form">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button type="submit">Save</button>&nbsp;&nbsp;&nbsp; <input
									type="BUTTON" value="Back"
									onclick="window.location.href='list_code_easy'">
								</td>
							</tr>
						</table>
					</c:if>
				</form>
			</div>



		</div>
		<div class="codeleftbottombar">
			<h3>Output and Results</h3>
			<p>&nbsp;</p>

			<c:if test="${output!=null}">
					<pre style="text-align: left; width: 100%; color: blue; overflow-x: auto; overflow-y: auto;">Output for your code is: <br>${output}<br></br><p>&nbsp;</p></pre>
			</c:if>

			<p>&nbsp;</p>

			<c:if test="${message!=null}">
					<c:if test="${message=='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: green">${message}</pre>
					</c:if>
					<c:if test="${message!='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: red; overflow-x: auto; overflow-y: auto;">${message}<br></br><p>&nbsp;</p></pre>
					</c:if>
			</c:if>
		</div>
		<jsp:directive.include file="../footer.jsp" />
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#submitJavaCodeForm").validate({
			rules : {},

			messages : {}
		});

		$("#buttonCancel").click(function() {
			history.back();
		});
	});
</script>
</html>