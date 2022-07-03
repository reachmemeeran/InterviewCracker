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

	<div class="card one" style="width:92%; height:600px;margin-bottom:30px;">
		<h3 class="title" style="margin-left:25%;margin-top:20px;">16. Week 8: Java Types, Control Flow and Error Handing - Lesson 1 Exercise: Methods</h3>
		<div class="card one" style="width:22%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">

			<h3 style="margin-top:2%;">Exercise:</h3>
			<p>&nbsp;</p>

			Implement the methods convertIntArray to  <br>
1. convert an array of ints to an array of doubles <br>
2. convert an array of ints to an ArrayList  <br>

			<p>&nbsp;</p>
			<h4 style="margin-top:2%;">Expected Output:</h4>
			<br>  [1.0 2.0 3.0 4.0 5.0 ] <br>
[1 2 3 4 5 ]
			<br>
		</div>
		<div class="card one" style="width:50%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">

				<form action="submit_javacode" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="23" cols="80" style="background-color:rgba(0, 231, 255, 0.45) ; color:#fff">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="23" cols="80" style="background-color:rgba(0, 231, 255, 0.45) ; color:#fff" required="true">import java.util.*;

/*
 * Implement the methods marked with a * in the comments below.  
 * 
 * You can test your implementations by calling them from 
 * the main method,
 * 
 * e.g. double[] newArray = m.convertIntArray(exampleArray);
 *      m.printArray(newArray);
 */

class Main {
  public static void main(String[] args) {
    Main m = new Main();
    m.printArray(new double[]{1.3,2.3,3.3,4.3});
    m.printArray(new int[]{1,2,3,4});
  }

  // * - method to convert an array of ints to an array of doubles 
  public double[] convertIntArray(int[] array){
    return null;
  }

  // * - method to convert an array of ints to an ArrayList 
  public ArrayList<Integer> convertIntArrayToArrayList(int[] array){
    return null;
  }

  // ---------------------------------------------------
  // helpful methods to print arrays of different types
  // ---------------------------------------------------
  public void printArray(int[] array){
    System.out.print("[");
    for(int i=0; i< array.length; i++){
      System.out.print(array[i] + " ");
    }
    System.out.println("]");
  }

  public void printArray(double[] array){
    System.out.print("[");
    for(int i=0; i< array.length; i++){
      System.out.print(array[i] + " ");
    }
    System.out.println("]");
  }

  public void printArrayList(ArrayList array){
    System.out.print("[");
    for(int i=0; i< array.size(); i++){
      System.out.print(array.get(i) + " ");
    }
    System.out.println("]");
  }
}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="List of Excersises" onclick="window.location.href='list_pop_exercise'">
					</c:if>



					<textarea name="answerCode" style="display: none;">import java.util.*;

/*
* Implement the methods marked with a * in the comments below.
*
* You can test your implementations by calling them from
* the main method,
*
* e.g. double[] newArray = m.convertIntArray(exampleArray);
* m.printArray(newArray);
*/

class Main {

public static void main(String[] args) {

Main m = new Main();

// demo for convertIntArray
int[] integerArray = { 1, 2, 3, 4, 5 };
double[] doubleArray = m.convertIntArray(integerArray);
m.printArray(doubleArray);

// demo for convertIntArrayToArrayList
ArrayList<Integer> ArrayList = m.convertIntArrayToArrayList(integerArray);
m.printArrayList(ArrayList);
}

// * - method to convert an array of ints to an array of doubles
public double[] convertIntArray(int[] array) {

// inputs an array of integers.

// initialising output double array with a length equal to that of the input
// array length.
double[] output = new double[array.length];
for (int i = 0; i <= array.length - 1; i++) {
// add each integer value from array input in to the output double array.
output[i] = array[i];
}

// returning an array of doubles
return output;
}

// * - method to convert an array of ints to an ArrayList
public ArrayList<Integer> convertIntArrayToArrayList(int[] array) {

// inputs an array of intergers.

// Initialising an interger ArrayList
ArrayList<Integer> outputArrayList = new ArrayList<>();

for (int i = 0; i <= array.length - 1; i++) {
// NOTE integer x = new Integer(1); example in week8 is incorrect.
// Error Message: the constructor Integer(int) is deprecated since version 9
// java.
Integer x = array[i];
outputArrayList.add(x);
}
// returning an ArrayList of Intergers.
return outputArrayList;
}

// ---------------------------------------------------
// helpful methods to print arrays of different types
// ---------------------------------------------------
public void printArray(int[] array) {
System.out.print("[");
for (int i = 0; i < array.length; i++) {
System.out.print(array[i] + " ");
}
System.out.println("]");
}

public void printArray(double[] array) {
System.out.print("[");
for (int i = 0; i < array.length; i++) {
System.out.print(array[i] + " ");
}
System.out.println("]");
}

public void printArrayList(ArrayList array) {
System.out.print("[");
for (int i = 0; i < array.size(); i++) {
System.out.print(array.get(i) + " ");
}
System.out.println("]");
}
}
</textarea>
					<input type="hidden" name="exerciseId" value="${exerciseId}">

					<c:if test="${status==null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="List of Excersises" onclick="window.location.href='list_pop_exercise'">
					</c:if>
				</form>

		</div>
		<div class="card one" style="width:20%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">
			<h3>Output and Results</h3>
			<p>&nbsp;</p>

			<c:if test="${output!=null}">
					<pre style="text-align: left; width: 100%; color: #c8ff05; overflow-x: auto; overflow-y: hidden;">Output for your code is: <br>${output}<br></br><p>&nbsp;</p></pre>
			</c:if>

			<p>&nbsp;</p>

			<c:if test="${message!=null}">
					<c:if test="${message=='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: #05ffd0">${message}</pre>
					</c:if>
					<c:if test="${message!='Successfully passed the test case'}">
						<pre style="text-align: left; width: 100%; color: red; overflow-x: auto; overflow-y: hidden;">${message}<br></br><p>&nbsp;</p></pre>
					</c:if>
			</c:if>
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