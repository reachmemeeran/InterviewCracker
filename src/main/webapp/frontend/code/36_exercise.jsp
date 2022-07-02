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
		<h3>Medium-5: Regular Expression - Part-1</h3>
		</div>

		<div class="codelefttopbar">

<pre>
<p style="font-weight: bold;">Java Regex:</p>The Java Regex or Regular Expression is an API to define a pattern for 
searching or manipulating strings.

Java Regex API provides 1 interface and 3 classes in java.util.regex package.

The Matcher and Pattern classes provide the facility of Java regular expression. 
The java.util.regex package provides following classes and interfaces for regular expressions.

MatchResult - interface
Matcher - class
Pattern - class
PatternSyntaxException - class

Example:

	import java.util.regex.*;  
	
	public class RegexExample{  
		public static void main(String args[]){  
			//1st way  
			Pattern p = Pattern.compile(".s");//. represents single character  
			Matcher m = p.matcher("as");  
			boolean b1 = m.matches();  
			System.out.println("Print b1 here: "+b1);
			  
			//2nd way  
			boolean b2=Pattern.compile(".s").matcher("as").matches();  
			System.out.println("Print b2 here: "+b2);
			  
			//3rd way  
			boolean b3 = Pattern.matches(".s", "as");  
			System.out.println("Print b3 here: "+b3);
		}
	}  
</pre>

 <br>
 <br>
			<br>
		</div>
		<div class="codemiddlebar">
			
			<div align="left">

				<pre>
<p style="font-weight: bold;">Question:</p>Validate the IP Address using Java Regex. Complete the class MyRegex.
IP address is a string in the form "A.B.C.D", where the value of A, B, C, D 
may range from 0 to 255. Leading zeros are allowed. 
The length of A, B, C, or D can't be greater than 3.

<p style="font-weight: bold;">Expected Output:</p>ip 121.234.12.12is: true
ip 00.12.243.123111.143is: false
ip 121.234is: false
ip 255.255.255.255is: true
ip 021.134.12.A2is: false
ip 111.111.111.111is: true
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.List;
import java.util.ArrayList;

//IP address is a string in the form "A.B.C.D", where the value of A, B, C, and D may range from 0 to 255. Leading zeros are allowed. The length of A, B, C, or D can't be greater than 3.
class Main{
  public static void main(String args[]){
    List<String> stringIPArray = new ArrayList<>();
    stringIPArray.add("121.234.12.12"); // Correct format
    stringIPArray.add("00.12.243.123111.143"); // InCorrect format
    stringIPArray.add("121.234"); // InCorrect format
    stringIPArray.add("255.255.255.255"); // Correct format
    stringIPArray.add("021.134.12.A2"); // InCorrect format
    stringIPArray.add("111.111.111.111"); // Correct format

    for(String ip : stringIPArray){
      System.out.println("ip "+ip+ "is: "+ip.matches(new MyRegex().pattern));
    }    
  }
}

//Write your code here
class MyRegex{
    String pattern0to255="([0-9])";
    public String pattern = pattern0to255+"\\."+pattern0to255+"\\."+pattern0to255+"\\."+pattern0to255;
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
									onclick="window.location.href='list_code_medium'"></td>
							</tr>
						</table>

					</c:if>



					<textarea name="answerCode" style="display: none;">
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.List;
import java.util.ArrayList;

//IP address is a string in the form "A.B.C.D", where the value of A, B, C, and D may range from 0 to 255. Leading zeros are allowed. The length of A, B, C, or D can't be greater than 3.
class Main{
  public static void main(String args[]){
    List<String> stringIPArray = new ArrayList<>();
    stringIPArray.add("121.234.12.12"); // Correct format
    stringIPArray.add("00.12.243.123111.143"); // InCorrect format
    stringIPArray.add("121.234"); // InCorrect format
    stringIPArray.add("255.255.255.255"); // Correct format
    stringIPArray.add("021.134.12.A2"); // InCorrect format
    stringIPArray.add("111.111.111.111"); // Correct format

    for(String ip : stringIPArray){
      System.out.println("ip "+ip+ "is: "+ip.matches(new MyRegex().pattern));
    }    
  }
}

//Write your code here
class MyRegex{
    String pattern0to255="([0-9]|[0-9][0-9]|(0|1)[0-9][0-9]|2[0-4][0-9]|25[0-5])";
    public String pattern = pattern0to255+"\\."+pattern0to255+"\\."+pattern0to255+"\\."+pattern0to255;
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
									onclick="window.location.href='list_code_medium'">
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