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
		<h3>Easy-7: String</h3>
		</div>

		<div class="codelefttopbar">

<pre>
<p style="font-weight: bold;">String:</p>Reference: https://docs.oracle.com/javase/7/docs/api/java/lang/String.html
The String class represents character strings. All string literals in Java programs, 
such as "abc", are implemented as instances of this class. Strings are constant; 
their values cannot be changed after they are created. String buffers support mutable 
strings. Because String objects are immutable they can be shared. For example:

     String str = "abc";
 
is equivalent to:

     char data[] = {'a', 'b', 'c'};
     String str = new String(data);
 
Here are some more examples of how strings can be used:

     System.out.println("abc");
     String cde = "cde";
     
<p style="font-weight: bold;">String Builder:</p>Imagine you were concatenating a list of strings, as shown below. 
What would the running time of this code
be? For simplicity, assume that the strings are all the same length (call this x) and 
that there are n strings.

String joinWords(String[] words) {
	String sentence = "";
	for (String w: words) {
		sentence = sentence + w;
	}
	return sentence;
}

On each concatenation, a new copy of the string is created, and the two strings are 
copied over, character by character. The first iteration requires us to copy x 
characters. The second iteration requires copying 2x characters. The third iteration 
requires 3x, and so on. The total time therefore is O( x + 2x + . . . + nx).
This reduces to O(xn^2).

	Why is it O(xn^2)?Because1 + 2 + ... + n equals n(n+1)/2,or O(n^2 ).

StringBuilder can help you avoid.this problem. StringBuilder simply creates a 
resizable array of all the strings, copying them back to a string only when necessary.

String joinWords(String[] words) {
	StringBuilder sentence new StringBuilder();
	for (String w : words) {
		sentence.append(w);
	}
	return sentence.toString();
}
</pre>

 <br>
 <br>
			<br>
		</div>
		<div class="codemiddlebar">
			
			<div align="left">

				<pre>
<p style="font-weight: bold;">Question:</p>Implement a method to perform basic string compression using the counts
of repeated characters. For example, the string aabcccccaaa 
would become a2blc5a3. If the "compressed" string would not 
become smaller than the original string, your method should return
the original string. You can assume the string has only 
uppercase and lowercase letters (a - z).
<p style="font-weight: bold;">Expected Output:</p>Compressed String for aabcccccaaa is: a2blc5a3
Compressed String for aabcc is: aabcc
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
  public static void main(String args[]){
    StringCompression stringCompression = new StringCompression();
    System.out.println("Compressed String for aabcccccaaa is: "+stringCompression.compress("aabcccccaaa"));
    System.out.println("Compressed String for aabcc is: "+stringCompression.compress("aabcc"));
  }
}

class StringCompression{
  public String compress(String str) {
    /* Check final length and return input string if it would be longer. */
    int finallength = countCompression(str);
    if (finallength >= str.length()) return str;
    StringBuilder compressed= new StringBuilder(finallength); // initial capacity
    int countConsecutive = 0;
    for () {
      /* If next character is different than current, append this char to result.*/
      
    }
    return compressed.toString();
  }

  int countCompression(String str) {
    int compressedlength = 0;
    int countConsecutive = 0;
    for () {
      countConsecutive++;
      /* If next character is different than current, increase the length.*/
      
    }
    return compressedlength;
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
  public static void main(String args[]){
    StringCompression stringCompression = new StringCompression();
    System.out.println("Compressed String for aabcccccaaa is: "+stringCompression.compress("aabcccccaaa"));
    System.out.println("Compressed String for aabcc is: "+stringCompression.compress("aabcc"));
  }
}

class StringCompression{
  public String compress(String str) {
    /* Check final length and return input string if it would be longer. */
    int finallength = countCompression(str);
    if (finallength >= str.length()) return str;
    StringBuilder compressed= new StringBuilder(finallength); // initial capacity
    int countConsecutive = 0;
    for (int i= 0; i < str.length(); i++) {
      countConsecutive++;
      /* If next character is different than current, append this char to result.*/
      if (i + 1 >= str.length() || str.charAt(i) != str.charAt(i + 1)) {
        compressed.append(str.charAt(i));
        compressed.append(countConsecutive);
        countConsecutive = 0;
      }
    }
    return compressed.toString();
  }

  int countCompression(String str) {
    int compressedlength = 0;
    int countConsecutive = 0;
    for (int i= 0; i < str.length(); i++) {
      countConsecutive++;
      /* If next character is different than current, increase the length.*/
      if (i + 1 >= str.length() || str.charAt(i) != str.charAt(i + 1)) { 
        compressedlength += 1 + String.valueOf(countConsecutive).length();
        countConsecutive = 0;
      }
    }
    return compressedlength;
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