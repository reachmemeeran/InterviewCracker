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
		<h3 class="title" style="margin-left:40%;margin-top:20px;">Easy-3: Palindrome</h3>
		

		<div class="card one" style="width:53%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;">
		
		<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;background:#000;">

				<pre>
<p style="font-weight: bold;color:green;">Question:</p>Complete the program to check if the number and the word is Palindrome.
&nbsp;
<p style="font-weight: bold;color:green;">Expected Output:</p>Is 454 is palindrome: true
Is racecar is palindrome: true
</pre>
			</div>

<pre>

<p style="font-weight: bold;color:cyan;">Palindrome:</p>A palindrome is a word, phrase, number, or sequence of words that reads the same backward 
as forward. Punctuation and spaces between the words or lettering are allowed.

<p style="font-weight: bold;color:cyan;">Examples:</p>civic
level
madam
noon
racecar
my gym
red rum, sir, is murder
never odd or even
I did, did I?
Was it a cat I saw?
454
345543

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
  public static void main(String args[]){
    int number = 454;
    System.out.println("Is " + number + " is palindrome: " + isPalindromeNumber(number));
    String string = "racecar";
    System.out.println("Is " + string + " is palindrome: " + isPalindromeString(string));
  }

  public static boolean isPalindromeNumber(int n){
    int r,sum=0,temp;    
    temp=n;    
    while(n>0){    
     //Complete the loop   
    }    
    if(temp==sum)    
     return true;    
    else    
     return false;    
}

  public static boolean isPalindromeString(String original){
    String reverse = "";  
    int length = original.length();   
    for ( int i = length - 1; i >= 0; i-- )  
       //Complete the loop
    if (original.equals(reverse))    
     return true;    
    else    
     return false;    
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
  public static void main(String args[]){
    int number = 454;
    System.out.println("Is " + number + " is palindrome: " + isPalindromeNumber(number));
    String string = "racecar";
    System.out.println("Is " + string + " is palindrome: " + isPalindromeString(string));
  }

  public static boolean isPalindromeNumber(int n){
    int r,sum=0,temp;    
    temp=n;    
    while(n>0){    
     r=n%10;   
     sum=(sum*10)+r;    
     n=n/10;    
    }    
    if(temp==sum)    
     return true;    
    else    
     return false;    
}

  public static boolean isPalindromeString(String original){
    String reverse = ""; // Objects of String class  
    int length = original.length();   
    for ( int i = length - 1; i >= 0; i-- )  
       reverse = reverse + original.charAt(i);  
    if (original.equals(reverse))    
     return true;    
    else    
     return false;    
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