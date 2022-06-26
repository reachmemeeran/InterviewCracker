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

			
Implement different shapes by extending the Shape class. For example, implement a Triangle, Square and Circle. <br>
For each implementation, override the toString method to provide a more specific description of the Shape. <br>
For example, if you implement a Circle you might return the String <br>
This Circle has a radius of 5 and a circumference of 31.42 <br>


			<p>&nbsp;</p>
			Output should be:<br>  This Shape has the edges, 3, 4, 5, <br>
This Circle has a radius of 5 and a circumference of 31.415901<br>
This Triangle has a base of 3 and a height of 4<br>
This Square has a side length of 2 and an area of 4.0 <br>
 <br>
			<br>
		</div>
		<div class="popmiddlebar">
			<div align="center">

				<h3 class="pageheading">21. Week 10: Object Oriented Classes and Inheritance - Lesson 3: Implement Different Shapes </h3>
			</div>


			<div align="center">
				<form action="submit_javacode" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="25" cols="70" style="background-color:#002b56 ; color:#fff">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="25" cols="70" style="background-color:#002b56 ; color:#fff" required="true">
import java.util.ArrayList;

class Main {
	public static void main(String[] args) {
		ArrayList<Integer> edges = new ArrayList<>();
		edges.add(3);
		edges.add(4);
		edges.add(5);
		Shape s = new Shape(edges);
		Circle c = new Circle(edges, 5);
		Triangle t = new Triangle(edges, 3,4);
		Square sq = new Square(edges, 2);
		System.out.println(s);
		System.out.println(c);
		System.out.println(t);
		System.out.println(sq);
	}
}


public class Circle extends Shape{
}


public class Shape{

}


public class Square extends Shape{
}

public class Triangle extends Shape{
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
import java.util.ArrayList;

class Main {
public static void main(String[] args) {
ArrayList<Integer> edges = new ArrayList<>();
edges.add(3);
edges.add(4);
edges.add(5);
Shape s = new Shape(edges);
Circle c = new Circle(edges, 5);
Triangle t = new Triangle(edges, 3,4);
Square sq = new Square(edges, 2);
System.out.println(s);
System.out.println(c);
System.out.println(t);
System.out.println(sq);
}
}


public class Circle extends Shape{
private int radius;
private final float PI = 3.14159f;

public Circle(ArrayList<Integer> edges, int radius){
super(edges);
this.radius = radius;
}

@Override
public String toString(){
return ("This Circle has a radius of " + radius + " and a circumference of " + 2 * PI * radius);
}
}


public class Shape{

ArrayList<Integer> edges;

public Shape(ArrayList<Integer> edges){
this.edges = edges;
}

public String toString(){
String toReturn = "This Shape has the edges, ";
for(Integer i : edges){
toReturn += i + ", ";
}
return toReturn;
}

}


public class Square extends Shape{
private int sideLength;

public Square(ArrayList<Integer> edges, int sideLength){
super(edges);
this.sideLength = sideLength;
}

@Override
public String toString(){
return ("This Square has a side length of " + sideLength + " and an area of " + Math.pow(sideLength,2));
}
}

public class Triangle extends Shape{
private int base;
private int height;

public Triangle(ArrayList<Integer> edges, int base, int height){
super(edges);
this.base = base;
this.height = height;
}

@Override
public String toString(){
return ("This Triangle has a base of " + base + " and a height of " + height);
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