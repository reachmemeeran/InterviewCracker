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
		<h3>Medium-2: Implement Queue with Stack</h3>
		</div>

		<div class="codelefttopbar">

<pre>
Stack and Queue are fundamental data structures in Java Collections Framework. 
They are used to store the same type of data and retrive the data in specific order. 
Stack and Queue both are Linear Data Structures.

Stack follows the LIFO principle i.e. Last In First Out. 
The operations are denoted as push and pop for insertion and deletion respectively.

Queue follows the FIFO principle i.e. First In First Out. 
Insertion operation is known as enqueue and deletion operation is known as dequeue.

<p style="font-weight: bold;">Stack:</p>Basic Syntax
Stack< Object> stack = new Stack<>();
Stack< Integer> stack = new Stack<>();  //Example stack of Integer datatype.
stack.push(varible_name); // To add Element to the top of the stack
stack.pop(); // Removes and returns the top element from the stack
stack.peek(); // Returns the top element of the stack
stack.size(); // Returns the no. of elements of the stack
stack.empty(); // Returns a Boolean indicating whether the stack is empty

<p style="font-weight: bold;">Queue:</p>Basic Syntax
Queue< Object> queue = new LinkedListQueue<Obj>();
Queue< String> animal1 = new LinkedList<>();// LinkedList implementation of Queue
Queue< String> animal2 = new ArrayDeque<>();// Array implementation of Queue
Queue< String> animal 3 = new PriorityQueue<>();// Priority Queue implementation of Queue

add() - Inserts the specified element into the queue. 
	If the task is successful, add() returns true, if not it throws an exception.
offer() - Inserts the specified element into the queue. If the task is successful, 
	offer() returns true, if not it returns false.
element() - Returns the head of the queue. Throws an exception if the queue is empty.
peek() - Returns the head of the queue. Returns null if the queue is empty.
remove() - Returns and removes the head of the queue. Throws an exception if the queue is 
	empty.
poll() - Returns and removes the head of the queue. Returns null if the queue is empty.

</pre>

 <br>
 <br>
			<br>
		</div>
		<div class="codemiddlebar">
			
			<div align="left">

				<pre>
<p style="font-weight: bold;">Question:</p>Implement Queue with Stack operations
Functionalities to implement: Stack.push to Queue.add, pop to remove, 
peek to peek, isEmpty to isEmpty
<p style="font-weight: bold;">Expected Output:</p>Is Queue is empty: true
Top of the Queue is: 5
Top of the Queue is: 5
Top of the Queue is: 10
Is Queue is empty: false
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
    QueueImplementationUsingStack queue = new QueueImplementationUsingStack();
    System.out.println("Is Queue is empty: "+queue.isEmpty());
    queue.add(5);
    System.out.println("Top of the Queue is: "+queue.peek());
    queue.add(10);
    System.out.println("Top of the Queue is: "+queue.peek());
    queue.remove();
    System.out.println("Top of the Queue is: "+queue.peek());
    System.out.println("Is Queue is empty: "+queue.isEmpty());
  }
}

class QueueImplementationUsingStack{
  java.util.Stack<Integer> stack = new java.util.Stack<Integer>();
  java.util.Stack<Integer> outputStack = new java.util.Stack<Integer>();
  public void add(int data){
  }
  public int peek(){
    return outputStack.peek();
  }
  public void remove(){
  }
  public Boolean isEmpty(){
    return outputStack.isEmpty() && stack.isEmpty();
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
									onclick="window.location.href='list_code_medium'"></td>
							</tr>
						</table>

					</c:if>



					<textarea name="answerCode" style="display: none;">
import java.util.*;

class Main{
  public static void main(String args[]){
    QueueImplementationUsingStack queue = new QueueImplementationUsingStack();
    System.out.println("Is Queue is empty: "+queue.isEmpty());
    queue.add(5);
    System.out.println("Top of the Queue is: "+queue.peek());
    queue.add(10);
    System.out.println("Top of the Queue is: "+queue.peek());
    queue.remove();
    System.out.println("Top of the Queue is: "+queue.peek());
    System.out.println("Is Queue is empty: "+queue.isEmpty());
  }
}

class QueueImplementationUsingStack{
  java.util.Stack<Integer> stack = new java.util.Stack<Integer>();
  java.util.Stack<Integer> outputStack = new java.util.Stack<Integer>();
  public void add(int data){
    stack.push(data);
  }
  public int peek(){
    if(outputStack.isEmpty()){
      while(!stack.isEmpty()){
        outputStack.push(stack.pop());
      }
    }
    return outputStack.peek();
  }
  public void remove(){
    peek();
    outputStack.pop();
  }
  public Boolean isEmpty(){
    return outputStack.isEmpty() && stack.isEmpty();
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