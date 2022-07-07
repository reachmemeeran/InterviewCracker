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
		<h3 class="title" style="margin-left:25%;margin-top:20px;">20. Week 10: Object Oriented Classes and Inheritance - Lesson 2: Build a Database of Bicycle Parts</h3>
		<div class="card one" style="width:22%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">

			<p style="font-weight: bold;color:green;">Exercise:</p>
			<p>&nbsp;</p>

			Using the Database of Multimedia as inspiration <br>
implement a Database of Bicycle Parts which can be combined together so build a custom bike <br>
Demonstrate your code in the main method <br>

			<p>&nbsp;</p>
			<p style="font-weight: bold;color:green;">Expected Output:</p>
			<br>  Catalogue List:<br>
<p>&nbsp;</p>
Red Frame<br>
The part's colour is: red<br>
The part's age is: 3<br>
Owned?: false<br>
<p>&nbsp;</p>
Black Handlebars<br>
The part's colour is: black<br>
The part's age is: 1<br>
Owned?: false<br>
<p>&nbsp;</p>
Black Wheels<br>
The part's colour is: black<br>
The part's age is: 2<br>
Owned?: false<br>
<p>&nbsp;</p>
Thank you for purchasing Red Frame<br>
Thank you for purchasing Black Handlebars<br>
Thank you for purchasing Black Wheels<br>
Catalogue List:<br>
<p>&nbsp;</p>
Red Frame<br>
The part's colour is: red<br>
The part's age is: 3<br>
Owned?: true<br>
<p>&nbsp;</p>
Black Handlebars<br>
The part's colour is: black<br>
The part's age is: 1<br>
Owned?: true<br>
<p>&nbsp;</p>
Black Wheels<br>
The part's colour is: black<br>
The part's age is: 2<br>
Owned?: true<br>
<p>&nbsp;</p>
You made a new bike!<br>
<p>&nbsp;</p>
This bike has these parts:<br>
Red Frame<br>
Black Handlebars<br>
Black Wheels<br>
			<br>
		</div>
		<div class="card one" style="width:50%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">

				<form action="submit_javacode" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="23" cols="80" style="background-color:rgba(0, 231, 255, 0.45) ; color:#fff">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="23" cols="80" style="background-color:rgba(0, 231, 255, 0.45) ; color:#fff" required="true">/*
 * Using the Database of Multimedia as inspiration...
 * 
 * ... implement a Database of Bicycle Parts which can be combined
 * together so build a custom bike
 *
 * Demonstrate your code in the main method below
 */

import java.util.ArrayList;

class Main {
  public static void main(String[] args) {
    Catalogue catalogue = new Catalogue();
	Frame frame1 = new Frame("red", 3, false, "Red Frame", 20);
	Handlebars handle1 = new Handlebars("black", 1, false, "Black Handlebars", 10);
	Wheels wheels1 = new Wheels("black", 2, false, "Black Wheels", 20);
	catalogue.addItem(frame1);
	catalogue.addItem(handle1);
	catalogue.addItem(wheels1);
	catalogue.displayContents();
	catalogue.purchasePart(frame1);
	catalogue.purchasePart(handle1);
	catalogue.purchasePart(wheels1);
	catalogue.displayContents();
	catalogue.constructBike(frame1, wheels1, handle1);
  }
}

public class Bike{
}


class Catalogue {
}

public void addItem(Part part){
}

public void displayContents(){
}

public void purchasePart(Part part){
}

public void constructBike(Frame frame, Wheels wheels, Handlebars handlebars){
}


public class Frame extends Part{
}


public class Handlebars extends Part{
}


public class Part{
private String colour;
private int age;
private boolean owned;
private String title;


}


public class Wheels extends Part{

}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="List of Excersises" onclick="window.location.href='list_pop_exercise'">
					</c:if>



					<textarea name="answerCode" style="display: none;">import java.util.ArrayList;
					class Main{
public static void main(String[] args) {
Catalogue catalogue = new Catalogue();
Frame frame1 = new Frame("red", 3, false, "Red Frame", 20);
Handlebars handle1 = new Handlebars("black", 1, false, "Black Handlebars", 10);
Wheels wheels1 = new Wheels("black", 2, false, "Black Wheels", 20);
catalogue.addItem(frame1);
catalogue.addItem(handle1);
catalogue.addItem(wheels1);
catalogue.displayContents();
catalogue.purchasePart(frame1);
catalogue.purchasePart(handle1);
catalogue.purchasePart(wheels1);
catalogue.displayContents();
catalogue.constructBike(frame1, wheels1, handle1);
}

}


public class Bike{
private Frame frame;
private Wheels wheels;
private Handlebars handlebars;
public Bike(Frame frame, Wheels wheels, Handlebars handlebars){
this.frame = frame;
this.wheels = wheels;
this.handlebars = handlebars;
}

public void listParts(){
System.out.println("This bike has these parts:");
System.out.println(frame.getTitle());
System.out.println(handlebars.getTitle());
System.out.println(wheels.getTitle());
}
}



/*
* Using the Database of Multimedia as inspiration...
*
* ... implement a Database of Bicycle Parts which can be combined
* together so build a custom bike
*
* Demonstrate your code in the main method below
*/

class Catalogue {
private ArrayList<Part> parts;

public Catalogue(){
parts = new ArrayList<>();
}

public void addItem(Part part){
parts.add(part);
}

public void displayContents(){
System.out.println("Catalogue List:");
System.out.println();
for (Part i : parts){
i.partInformation();
System.out.println("Owned?: " + i.isOwned());
System.out.println();
}
}

public void purchasePart(Part part){
part.purchase();
System.out.println("Thank you for purchasing " + part.getTitle());
}

public void constructBike(Frame frame, Wheels wheels, Handlebars handlebars){
System.out.println("You made a new bike!");
System.out.println();
Bike currentBike = new Bike(frame, wheels, handlebars);
currentBike.listParts();
}
}


public class Frame extends Part{
private int size;

public Frame(String colour, int age, boolean owned, String title, int size){
super(colour, age, owned, title);

this.size = size;
}

public void getDimensions(){
System.out.println("The frame's size is: " + size);
}
}


public class Handlebars extends Part{
private int length;

public Handlebars(String colour, int age, boolean owned, String title, int length){
super(colour, age, owned, title);

this.length = length;
}

public void getDimensions(){
System.out.println("The handlebars length are: " + length);
}
}


public class Part{
private String colour;
private int age;
private boolean owned;
private String title;

public Part(String colour, int age, boolean owned, String title){
this.colour = colour;
this.age = age;
this.owned = owned;
this.title = title;
}

public boolean isOwned(){
return owned;
}

public void purchase(){
owned = true;
}

public String getTitle(){
return title;
}

public void partInformation(){
System.out.println(title);
System.out.println("The part's colour is: " + colour);
System.out.println("The part's age is: " + age);
}
}


public class Wheels extends Part{
private int diameter;

public Wheels(String colour, int age, boolean owned, String title, int diameter){
super(colour, age, owned, title);

this.diameter = diameter;
}

public void getDimensions(){
System.out.println("The wheels' diameter are: " + diameter);
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
		<div class="card one" style="width:20%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;background:#000;">
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