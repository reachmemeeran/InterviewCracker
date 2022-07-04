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
		<h3 class="title" style="margin-left:40%;margin-top:20px;">Medium-1: Implement Stack with Queue</h3>
		

		<div class="card one" style="width:53%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;">
		
		<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;background:#000;">

				<pre>
<p style="font-weight: bold;color:green;">Question:</p>Implement Stack with Queue operations
Functionalities to implement: Queue.add to Stack.push, remove to pop, 
peek to peek, isEmpty to isEmpty.
&nbsp;
<p style="font-weight: bold;color:green;">Expected Output:</p>Is Stack is empty: true
Top of the stack is: 5
Top of the stack is: 10
Top of the stack is: 5
Is Stack is empty: false
</pre>
			</div>

<pre>

<p style="font-weight: bold;color:cyan;">Stack and Queue:</p>Stack and Queue are fundamental data structures in Java Collections Framework. 
They are used to store the same type of data and retrive the data in specific order. 
Stack and Queue both are Linear Data Structures.

Stack follows the LIFO principle i.e. Last In First Out. 
The operations are denoted as push and pop for insertion and deletion respectively.

Queue follows the FIFO principle i.e. First In First Out. 
Insertion operation is known as enqueue and deletion operation is known as dequeue.

<p style="font-weight: bold;color:cyan;">Stack:</p>Basic Syntax
Stack< Object> stack = new Stack<>();
Stack< Integer> stack = new Stack<>();  //Example stack of Integer datatype.
stack.push(varible_name); // To add Element to the top of the stack
stack.pop(); // Removes and returns the top element from the stack
stack.peek(); // Returns the top element of the stack
stack.size(); // Returns the no. of elements of the stack
stack.empty(); // Returns a Boolean indicating whether the stack is empty

<p style="font-weight: bold;color:cyan;">Queue:</p>Basic Syntax
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
    StackImplementationUsingQueue stack = new StackImplementationUsingQueue();
    System.out.println("Is Stack is empty: "+stack.isEmpty());
    stack.push(5);
    System.out.println("Top of the stack is: "+stack.peek());
    stack.push(10);
    System.out.println("Top of the stack is: "+stack.peek());
    stack.pop();
    System.out.println("Top of the stack is: "+stack.peek());
    System.out.println("Is Stack is empty: "+stack.isEmpty());
  }
}

class StackImplementationUsingQueue{
  Queue<Integer> queue = new LinkedList<Integer>();
  Queue<Integer> outputQueue = new LinkedList<Integer>();
  private int top;

  public void push(int data){
  }
  public int peek(){
  	return top;
  }
  public void pop(){
  }
  public Boolean isEmpty(){
    return outputQueue.isEmpty() && queue.isEmpty();
  }
}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="Back" onclick="window.location.href='list_code_medium'">
					</c:if>



					<textarea name="answerCode" style="display: none;">
import java.util.*;

class Main{
  public static void main(String args[]){
    StackImplementationUsingQueue stack = new StackImplementationUsingQueue();
    System.out.println("Is Stack is empty: "+stack.isEmpty());
    stack.push(5);
    System.out.println("Top of the stack is: "+stack.peek());
    stack.push(10);
    System.out.println("Top of the stack is: "+stack.peek());
    stack.pop();
    System.out.println("Top of the stack is: "+stack.peek());
    System.out.println("Is Stack is empty: "+stack.isEmpty());
  }
}

class StackImplementationUsingQueue{
  Queue<Integer> queue = new LinkedList<Integer>();
  Queue<Integer> outputQueue = new LinkedList<Integer>();
  private int top;

  public void push(int data){
    queue.add(data);
    top=data;
  }
  public int peek(){
    return top;
  }
  public void pop(){
    while (queue.size() > 1) {
        top = queue.remove();
        outputQueue.add(top);
    }
    queue.remove();
    Queue<Integer> temp = queue;
    queue = outputQueue;
    outputQueue = temp;
  }
  public Boolean isEmpty(){
    return outputQueue.isEmpty() && queue.isEmpty();
  }
}
</textarea>
					<input type="hidden" name="exerciseId" value="${exerciseId}">

					<c:if test="${status==null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="Back" onclick="window.location.href='list_code_medium'">
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