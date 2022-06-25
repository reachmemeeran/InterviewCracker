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

			
Implement the DequeueInterface. <br>
You should demonstrate the use of this data structure<br>


			<p>&nbsp;</p>
			Output should be:<br>  5 <br>
7 <br>
10 <br>
6 <br>
3 <br>
9 <br>
1 <br>
2 <br>
 <br>
 <br>
			<br>
		</div>
		<div class="popmiddlebar">
			<div align="center">

				<h3 class="pageheading">22. Week 11: Abstract Classes, Interfaces, Coupling and Cohesion - Lesson 1 Exercise: Dequeue Interface</h3>
			</div>


			<div align="center">
				<form action="submit_javacode" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="25" cols="70">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="25" cols="70" required="true">
import java.util.ArrayList;

class Main {
	public static void main(String[] args) {
		Dequeue a = new Dequeue();
		a.addFront(2);
		a.addFront(5);
		a.addRear(3);
		a.addRear(6);
		a.addRear(10);
		System.out.println(a.removeFront()); //should print 5
		a.addFront(1);
		a.addFront(9);
		a.addRear(7);
		System.out.println(a.removeRear()); //should print 7
		System.out.println(a.removeRear()); //should print 10
		System.out.println(a.removeRear()); //should print 6
		System.out.println(a.removeRear()); //should print 3
		System.out.println(a.removeFront()); //should print 9
		System.out.println(a.removeFront()); //should print 1
		System.out.println(a.removeRear()); //should print 2
	}
}




public class Dequeue implements DequeueInterface{


}


/*
* A deque (double-ended queue) is like a queue, except that
* it allows access at both ends.
*
*/

public interface DequeueInterface{

//adds item o to the front of the deque
public void addFront(Object o);

//adds item o to the rear of the deque
public void addRear(Object o);

// removes the item at the front and returns it
public Object removeFront ();

// removes the item at the rear and returns it
public Object removeRear();

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
Dequeue a = new Dequeue();
a.addFront(2);
a.addFront(5);
a.addRear(3);
a.addRear(6);
a.addRear(10);
System.out.println(a.removeFront()); //should print 5
a.addFront(1);
a.addFront(9);
a.addRear(7);
System.out.println(a.removeRear()); //should print 7
System.out.println(a.removeRear()); //should print 10
System.out.println(a.removeRear()); //should print 6
System.out.println(a.removeRear()); //should print 3
System.out.println(a.removeFront()); //should print 9
System.out.println(a.removeFront()); //should print 1
System.out.println(a.removeRear()); //should print 2
}
}




public class Dequeue implements DequeueInterface{

ArrayList<Object> dequeue = new ArrayList<Object>();

//adds item o to the front of the deque
@Override
public void addFront(Object o){
ArrayList<Object> tempdequeue = new ArrayList<Object>();
tempdequeue.add(o);
for (Object i : dequeue){
tempdequeue.add(i);
}
dequeue = tempdequeue;
}

//adds item o to the rear of the deque
@Override
public void addRear(Object o){
dequeue.add(o);
}

// removes the item at the front and returns it
@Override
public Object removeFront(){
Object toReturn = dequeue.get(0);
ArrayList<Object> tempdequeue = new ArrayList<Object>();
for (int i = 1; i < dequeue.size(); i++){
tempdequeue.add(dequeue.get(i));
}
dequeue = tempdequeue;
return toReturn;
}

// removes the item at the rear and returns it
@Override
public Object removeRear(){
Object toReturn = dequeue.get(dequeue.size() - 1);
dequeue.remove(dequeue.size() - 1);
return toReturn;
}

}


/*
* A deque (double-ended queue) is like a queue, except that
* it allows access at both ends.
*
*/

public interface DequeueInterface{

//adds item o to the front of the deque
public void addFront(Object o);

//adds item o to the rear of the deque
public void addRear(Object o);

// removes the item at the front and returns it
public Object removeFront ();

// removes the item at the rear and returns it
public Object removeRear();

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