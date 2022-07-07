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
		<h3 class="title" style="margin-left:40%;margin-top:20px;">Advanced-5: Lambda Expressions</h3>
		

		<div class="card one" style="width:53%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;">
		
		<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;background:#000;">

				<pre>
<p style="font-weight: bold;color:green;">Question:</p>Complete the following methods that return a lambda expression performing a 
specified action:

PerformOperation isOdd(): 
 The lambda expression must return true if it is odd or false if it is even.
PerformOperation isPrime(): 
 The lambda expression must return true if it is prime or false if it is composite.
PerformOperation isPalindrome(): 
 The lambda expression must return true if it is a palindrome or false if it is not.
&nbsp;
<p style="font-weight: bold;color:green;">Expected Output:</p>4 is: EVEN
5 is: PRIME
898 is: PALINDROME

</pre>
			</div>

<pre>

<p style="font-weight: bold;color:cyan;">Lambda Expression:</p>A lambda expression is a short block of code which takes in parameters and 
returns a value. Lambda expressions are similar to methods, but they do not need a 
name and they can be implemented right in the body of a method.

<p style="font-weight: bold;color:cyan;">Syntax:</p>Below are the Syntax of Lambda Expression

<p style="font-weight: bold;color:cyan;">Single Parameter:</p>parameter -> expression

<p style="font-weight: bold;color:cyan;">Multiple Parameter:</p>(parameter1, parameter2) -> expression

<p style="font-weight: bold;color:cyan;">Complex Operation:</p>(parameter1, parameter2) -> { code block }

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

public class Main {

  public static void main(String[] args) {
    MyMath ob = new MyMath();
    PerformOperation op;
    boolean ret = false;
    String ans = null;
    int num = 4;
    op = ob.isOdd();
    ret = ob.checker(op, num);
    ans = (ret) ? "ODD" : "EVEN";
    System.out.println(num+ " is: "+ans);
    
    num = 5;
    op = ob.isPrime();
    ret = ob.checker(op, num);
    ans = (ret) ? "PRIME" : "COMPOSITE";
    System.out.println(num+ " is: "+ans);
    
    num=898;
    op = ob.isPalindrome();
    ret = ob.checker(op, num);
    ans = (ret) ? "PALINDROME" : "NOT PALINDROME";
    System.out.println(num+ " is: "+ans);
  }
}

interface PerformOperation {
  boolean check(int a);
}

class MyMath {
  public static boolean checker(PerformOperation p, int num) {
    return p.check(num);
  }
  
  public static PerformOperation isOdd(){
    return (int a) -> false;
  }
  
  public static PerformOperation isPrime(){
    return (int a) -> false;
  }
  
  public static PerformOperation isPalindrome(){
    return (int a) ->  false;
  }
}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="Back" onclick="window.location.href='list_code_advanced'">
					</c:if>



					<textarea name="answerCode" style="display: none;">
import java.util.*;

public class Main {

  public static void main(String[] args) {
    MyMath ob = new MyMath();
    PerformOperation op;
    boolean ret = false;
    String ans = null;
    int num = 4;
    op = ob.isOdd();
    ret = ob.checker(op, num);
    ans = (ret) ? "ODD" : "EVEN";
    System.out.println(num+ " is: "+ans);
    
    num = 5;
    op = ob.isPrime();
    ret = ob.checker(op, num);
    ans = (ret) ? "PRIME" : "COMPOSITE";
    System.out.println(num+ " is: "+ans);
    
    num=898;
    op = ob.isPalindrome();
    ret = ob.checker(op, num);
    ans = (ret) ? "PALINDROME" : "NOT PALINDROME";
    System.out.println(num+ " is: "+ans);
  }
}

interface PerformOperation {
  boolean check(int a);
}

class MyMath {
  public static boolean checker(PerformOperation p, int num) {
    return p.check(num);
  }
  
  public static PerformOperation isOdd(){
    return (int a) -> a % 2 != 0;
  }
  
  public static PerformOperation isPrime(){
    return (int a) -> java.math.BigInteger.valueOf(a).isProbablePrime(1);
  }
  
  public static PerformOperation isPalindrome(){
    return (int a) ->  Integer.toString(a).equals( new StringBuilder(Integer.toString(a)).reverse().toString() );
  }
}
</textarea>
					<input type="hidden" name="exerciseId" value="${exerciseId}">

					<c:if test="${status==null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="Back" onclick="window.location.href='list_code_advanced'">
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