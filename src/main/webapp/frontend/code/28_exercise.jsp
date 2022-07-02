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
		<h3>Easy-6: ArrayList</h3>
		</div>

		<div class="codelefttopbar">

<pre>
In Few languages, arrays (often called lists in this case) are automatically resizable. 
The array or list will grow as you append items. 
But in Java, arrays are fixed length. The size is defined when you 
create the array. When you need an array-like data structure that offers dynamic 
resizing, you would usually use an Arraylist.

An Arraylist is an array that resizes itself as needed while still providing 0(1) access. 
A typical implementation is that when the array is full, the array doubles in size. 
Each doubling takes 0(n) time, but happens so rarely that its amortized insertion time 
is still O (1).

	Arraylist<String> merge(String[] words, String[] more) {
		Arraylist<String> sentence= new Arraylist<String>();
		for (String w : words) sentence.add(w);
		for (String w: more) sentence.add(w);
		return sentence;
	}
	

Why is the amortized insertion runtime 0(1)?
Suppose you have an array of size N. We can work backwards to compute how many elements 
we copied at each capacity increase. 
Observe that when we increase the array to K elements, the array was previously half 
that size. Therefore, we needed to copy k/2 elements.

	final capacity increase		: n/2 elements to copy
	previous capacity increase	: n/4 elements to copy
	previous capacity increase	: n/8 elements to copy
	previous capacity increase	: n/16 elements to copy
	second capacity increase 	: 2 elements to copy
	first capacity increase 	: 1 element to copy
	
Therefore, the total number of copies to insert N elements is roughly 
N/2 + N/4 + N/8 + . . . + 2 + 1, which is just less than N.
</pre>

 <br>
 <br>
			<br>
		</div>
		<div class="codemiddlebar">
			
			<div align="left">

				<pre>
<p style="font-weight: bold;">Question:</p>Check if the two strings have identical character counts
<p style="font-weight: bold;">Expected Output:</p>Is same & same have identical character counts: true
Is same & emsa have identical character counts: true
Is yepsame & nopsame have identical character counts: false

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
    Permutation permutation = new Permutation();
    System.out.println("Is same & same have identical character counts: "+permutation.isIdentical("same","same"));
    System.out.println("Is same & emsa have identical character counts: "+permutation.isIdentical("same","emsa"));
    System.out.println("Is yepsame & nopsame have identical character counts: "+permutation.isIdentical("yepsame","nopsame"));
  }
}

public class Permutation{
  public boolean isIdentical(String s, String t) {
    	if (s.length() != t.length()) {
    		return false;
	}
	int[] letters = new int[128]; // Assumption
	char[] s_array = s.toCharArray();
	for (char c : s_array) { // count number of each char in s.
    		letters[c]++;
  	}
  	for (int i= 0; i < t.length(); i++) {
    		//Complete the code
  	}
  	return true;
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
    Permutation permutation = new Permutation();
    System.out.println("Is same & same have identical character counts: "+permutation.isIdentical("same","same"));
    System.out.println("Is same & emsa have identical character counts: "+permutation.isIdentical("same","emsa"));
    System.out.println("Is yepsame & nopsame have identical character counts: "+permutation.isIdentical("yepsame","nopsame"));
  }
}

public class Permutation{
  public boolean isIdentical(String s, String t) {
    if (s.length() != t.length()) {
    return false;
   }
  int[] letters = new int[128]; // Assumption
  char[] s_array = s.toCharArray();
  for (char c : s_array) { // count number of each char in s.
    letters[c]++;
  }
  for (int i= 0; i < t.length(); i++) {
    int c = (int) t.charAt(i);
    letters[c]--;
    if (letters[c] < 0) {
      return false;
    }
  }
  return true;
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