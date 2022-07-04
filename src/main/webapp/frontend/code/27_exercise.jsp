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
		<div class="card one" style="width:92%; height:600px;margin-bottom:30px;">
		<h3 class="title" style="margin-left:40%;margin-top:20px;">Easy-5: Fibonacci Series</h3>
		

		<div class="card one" style="width:53%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;">
		
		<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;background:#000;">

				<pre>
<p style="font-weight: bold;color:green;">Question:</p>Complete the program to print fibonacci series with and without recursion.
&nbsp;
<p style="font-weight: bold;color:green;">Expected Output:</p>Non-Recursive Fibonacci is: 0 1 1 2 3 5 8 13 21 34
Recursive Fibonacci is: 0 1 1 2 3 5 8 13 21 34
</pre>
			</div>

<pre>

<p style="font-weight: bold;color:cyan;">Fibonacci Series:</p>In fibonacci series, next number is the sum of previous two numbers.
For example 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 etc. 
The first two numbers of fibonacci series are 0 and 1.

<p style="font-weight: bold;color:cyan;">Two Ways:</p>There are two ways to write the fibonacci series program in java:

Fibonacci Series without using recursion
Fibonacci Series using recursion.

</pre>



			
		</div>
		<div class="card one" style="width:43%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;">
			
			<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;background:#000;">
			<h3>Output and Results</h3>

			<c:if test="${output!=null}">
					<pre style="text-align: left; width: 100%; color: #c8ff05; overflow-x: auto; overflow-y: hidden;">Output for your code is: <br>${output}</pre>
			</c:if>

			<c:if test="${message!=null}">
					<c:if test="${message=='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: #05ffd0">${message}</pre>
					</c:if>
					<c:if test="${message!='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: red; overflow-x: auto; overflow-y: hidden;">${message}</pre>
					</c:if>
			</c:if>
		</div>
		
		<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;">
		
				<form action="submit_javacoding" method="post" id="submitJavaCodeForm">
					&nbsp;
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="23" cols="80" style="background-color:rgba(0, 231, 255, 0.45) ; color:#fff">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="23" cols="80" style="background-color:rgba(0, 231, 255, 0.45) ; color:#fff" required="true">
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
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="Back" onclick="window.location.href='list_code_easy'">
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
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="Back" onclick="window.location.href='list_code_easy'">
					</c:if>
				</form>


</div>

		</div>
		
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