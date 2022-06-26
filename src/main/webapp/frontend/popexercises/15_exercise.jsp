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

		<div class="popleftbar">

			<p>&nbsp;</p>
			<h3>Exercise:</h3>
			<p>&nbsp;</p>

			
1. Modify the method printCharsInString so that it prints out each character in the string on a new line. <br>
2. Modify the method printStringInReverse so that it prints out the string in reverse order<br>
3. Modify the method printStringInUppercase so that it prints out the string as all uppercase <br>
4. Implement the method encryptText which encrypts the text passed in as an argument using a Ceaser cypher.  <br>
  /* <br>
  * https://en.wikipedia.org/wiki/Caesar_cipher <br>
  * <br>
  * This is illustrated below <br>
  *<br>
  * input string = "ABC"<br>
  * shift by = 3<br>
  * encrypted text = "DEF"<br>
  */<br>

5. Implement the method decryptText which decrypts a Ceaser cypher encrypted message <br>

			<p>&nbsp;</p>
			Output should be:<br>  DEF <br> ABC <br>
			<br>
		</div>
		<div class="popmiddlebar">
			<div align="center">

				<h3 class="pageheading">15. Week 7: Java and Object Oriented Programming - Lesson 4 Exercise: Strings</h3>
			</div>


			<div align="center">
				<form action="submit_javacode" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="25" cols="70" style="background-color:#002b56 ; color:#fff">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="25" cols="70" style="background-color:#002b56 ; color:#fff" required="true">class Main {

  public static void main(String[] args) {
    Main m = new Main();
    m.printCharsInString("This is an example string");
  }

  /*
  * Modify the method below so that it prints out each character in the string
  * on a new line.
  */

  public void printCharsInString(String s){
    System.out.println(s);
  }

  /*
  * Modify the method below so that it prints out
  * the string in reverse order
  */

  public void printStringInReverse(String s){
    System.out.println(s);
  }

  /*
  * Modify the method below so that it prints out
  * the string as all uppercase
  */

  public void printStringInUppercase(String s){
    System.out.println(s);
  }

  /*
  * Implement the method below which encrypts the
  * text passed in as an argument using a 
  * Ceaser cypher.  
  * 
  * https://en.wikipedia.org/wiki/Caesar_cipher
  * 
  * This is illustrated below 
  *
  * input string = "ABC"
  * shift by = 3
  * encrypted text = "DEF"
  */
  public String encryptText(String s, int shiftBy){
    return s;
  }

  /*
  * Implement the method below which decrypts a
  * Ceaser cypher encrypted message
  *
  */

  public String decryptText(String s, int shiftBy){
    return s;
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
									value="List of Excersises"
									onclick="window.location.href='list_pop_exercise'"></td>
							</tr>
						</table>

					</c:if>



					<textarea name="answerCode" style="display: none;">
					class Main {

public static void main(String[] args) {
Main m = new Main();
//m.printCharsInString("This is an example string");
//m.printStringInReverse("This is an example string");
//m.printStringInUppercase("This is an example string");
String encrpyted = m.encryptText("ABC", 3);
System.out.println(encrpyted);
String decrpyted = m.decryptText("DEF", 3);
System.out.println(decrpyted);
}

/*
* Modify the method below so that it prints out each character in the string on a new line.
*/

public void printCharsInString(String s) {
//System.out.println(s);
for(int i = 0; i < s.length(); i++ ){
System.out.println(s.charAt(i));
}

}

/*
* Modify the method below so that it prints out the string in reverse order.
*/

public void printStringInReverse(String s) {
//System.out.println(s);
for(int i = s.length() - 1; i >= 0; i--){
System.out.println(s.charAt(i));
}
}

/*
* Modify the method below so that it prints out the string as all uppercase.
*/

public void printStringInUppercase(String s){
System.out.println(s.toUpperCase());
}

/*
* Implement the method below which encrypts the
* text passed in as an argument using a
* Ceaser cypher.
*
* https://en.wikipedia.org/wiki/Caesar_cipher
*
* This is illustrated below
*
* input string = "ABC"
* shift by = 3
* encrypted text = "DEF"
*/
public String encryptText(String s, int shiftBy){
// if shiftBy is greater that 26.
if (shiftBy > 26){

shiftBy = shiftBy % 26;
}
// if shiftBy is negative.
else if (shiftBy < 0){
shiftBy = (shiftBy % 26) + 26;
}

// initialising cipher string to be returned.
String cipher = "";

// split the string in to characters and loop through each character in the array.
for (char i: s.toCharArray()) {
// if the character is a letter.
if (Character.isLetter(i)) {
// if character is lower case.
if (Character.isLowerCase(i)) {
// using ASCII numbers for letters
char c = (char)(i + shiftBy);
if (c > 'z') {
cipher += (char)(i - (26 - shiftBy));
}
else {
cipher += c;
}
}
// if character is upper case.
else if (Character.isUpperCase(i)) {
// using ASCII numbers for letters
char c = (char)(i + shiftBy);
if (c > 'Z') {
cipher += (char)(i - (26 - shiftBy));
}
else {
cipher += c;
}
}
}
}
return cipher;
}

/*
* Implement the method below which decrypts a
* Ceaser cypher encrypted message
*
*/

public String decryptText(String s, int shiftBy){
return encryptText(s, -shiftBy);
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
									type="BUTTON" value="List of Excersises"
									onclick="window.location.href='list_pop_exercise'">
								</td>
							</tr>
						</table>
					</c:if>
				</form>
			</div>



		</div>
		<div class="poprightbar">
			<h3>Output and Results</h3>
			<p>&nbsp;</p>
			<p>&nbsp;</p>

			<c:if test="${output!=null}">
					<pre style="text-align: left; width: 100%; color: blue; overflow-x: auto; overflow-y: auto;">Output for your code is: <br>${output}<br></br><p>&nbsp;</p></pre>
			</c:if>

			<p>&nbsp;</p>
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