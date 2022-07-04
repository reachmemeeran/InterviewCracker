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
		<h3 class="title" style="margin-left:40%;margin-top:20px;">Medium-4: Create a Thread by Implementing the Runnable Interface</h3>
		

		<div class="card one" style="width:53%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;">
		
		<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;background:#000;">

				<pre>
<p style="font-weight: bold;color:green;">Question:</p>Complete the program to implement the runnable interface and correct the 
compilation errors.
Carefully observe the Start, Create, run and Exit of the thread.
&nbsp;
<p style="font-weight: bold;color:green;">Expected Output:</p>Creating Thread-1
Starting Thread-1
Running Thread-1
Thread: Thread-1, 2
Thread: Thread-1, 1
Thread Thread-1 exiting.
</pre>
			</div>

<pre>

<p style="font-weight: bold;color:cyan;">Single Thread:</p>A single thread in Java is basically a lightweight and 
the smallest unit of processing. Java uses threads by using a "Thread Class".

<p style="font-weight: bold;color:cyan;">Multithreading:</p>Multithreading in Java is a process of executing two or 
more threads simultaneously to maximum utilization of CPU.
Multithreaded applications execute two or more threads run concurrently.
Hence, it is also known as Concurrency in Java. Each thread runs parallel to each other.
Mulitple threads don't allocate separate memory area, hence they save memory.
Also, context switching between threads takes less time.

<p style="font-weight: bold;color:cyan;">Thread methods:</p>
1. public void start() - Starts the thread in a separate path of execution, 
	then invokes the run() method on this Thread object.
2. public void run() - If this Thread object was instantiated using a separate Runnable 
	target, the run() method is invoked on that Runnable object.
3. public final void setName(String name) - Changes the name of the Thread object. 
	There is also a getName() method for retrieving the name.
4. public final void setPriority(int priority) - Sets the priority of this Thread object. 
	The possible values are between 1 and 10.
5. public final void setDaemon(boolean on) - A parameter of true denotes this Thread 
	as a daemon thread.
6. public final void join(long millisec) - The current thread invokes this method on a 
	second thread, causing the current thread to block until the second thread 
	terminates or the specified number of milliseconds passes.
7. public void interrupt() - Interrupts this thread, causing it to continue execution 
	if it was blocked for any reason.
8. public final boolean isAlive() - Returns true if the thread is alive, which is any 
	time after the thread has been started but before it runs to completion.
	
<p style="font-weight: bold;color:cyan;">Create Thread:</p>Threads can be created by using two mechanisms : 

Extending the Thread class 
Implementing the Runnable Interface

<p style="font-weight: bold;color:cyan;">Implementing the Runnable Interface:</p>Create a new class that implements runnable interface using the three steps. 
Step-1: Implement a run() - public void run()
Step-2: Instantiate a Thread object - Thread(Runnable threadObj, String threadName);
Step-3: Start the thread by calling start() method

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
    MyThread R1 = new MyThread( Thread-1);
    R1.start();
  }
}

class MyThread implements Run {
  private Thread t;
  private String threadName;
  
  MyThread( String name) {
    threadName = name;
    System.out.println("Creating " +  threadName );
  }
  
  public void runnable() {
    System.out.println("Running " +  threadName );
    try {
       for(int i = 2; i > 0; i--) {
          System.out.println("Thread: " + threadName + ", " + i);
          // Let the thread sleep for a while.
          Thread.sleep(50);
       }
    } catch (InterruptedException e) {
       System.out.println("Thread " +  threadName + " interrupted.");
    }
    System.out.println("Thread " +  threadName + " exiting.");
  }
  
  public void startMethod () {
    System.out.println("Starting  +  threadName );
    if (t == null) {
       t = new Thread (this, threadName)
       t.start ();
    }
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
    MyThread R1 = new MyThread( "Thread-1");
    R1.start();
  }
}

class MyThread implements Runnable {
  private Thread t;
  private String threadName;
  
  MyThread( String name) {
    threadName = name;
    System.out.println("Creating " +  threadName );
  }
  
  public void run() {
    System.out.println("Running " +  threadName );
    try {
       for(int i = 2; i > 0; i--) {
          System.out.println("Thread: " + threadName + ", " + i);
          // Let the thread sleep for a while.
          Thread.sleep(50);
       }
    } catch (InterruptedException e) {
       System.out.println("Thread " +  threadName + " interrupted.");
    }
    System.out.println("Thread " +  threadName + " exiting.");
  }
  
  public void start () {
    System.out.println("Starting " +  threadName );
    if (t == null) {
       t = new Thread (this, threadName);
       t.start ();
    }
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