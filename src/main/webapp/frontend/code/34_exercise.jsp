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
		<h3>Medium-3: Create a Thread by Extending the Thread class</h3>
		</div>

		<div class="codelefttopbar">

<pre>
<p style="font-weight: bold;">Single Thread:</p>A single thread in Java is basically a lightweight and 
the smallest unit of processing. Java uses threads by using a "Thread Class"".

<p style="font-weight: bold;">Multithreading:</p>Multithreading in Java is a process of executing two or 
more threads simultaneously to maximum utilization of CPU.
Multithreaded applications execute two or more threads run concurrently.
Hence, it is also known as Concurrency in Java. Each thread runs parallel to each other.
Mulitple threads don't allocate separate memory area, hence they save memory.
Also, context switching between threads takes less time.

<p style="font-weight: bold;">Thread methods:</p>
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
	
<p style="font-weight: bold;">Create Thread:</p>Threads can be created by using two mechanisms : 

Extending the Thread class 
Implementing the Runnable Interface

<p style="font-weight: bold;">Extending the Thread class:</p>Create a new class that extends Thread class using the two simple steps. 
This approach provides more flexibility in handling multiple threads created using 
available methods in Thread class.
Step-1: Override run( ) method
Step-2: Start the thread by calling start() method
</pre>

 <br>
 <br>
			<br>
		</div>
		<div class="codemiddlebar">
			
			<div align="left">

				<pre>
<p style="font-weight: bold;">Question:</p>Complete the program to extend the thread class and correct the 
compilation errors.
Carefully observe the Start, Create, run and Exit of the thread.
<p style="font-weight: bold;">Expected Output:</p>Creating Thread-1
Starting Thread-1
Running Thread-1
Thread: Thread-1, 2
Thread: Thread-1, 1
Thread Thread-1 exiting.
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
    MyThread T1 = new MyThread( "Thread-1");
    T1.start()
  }
}

class MyThread {
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
      } catch (Interruptedxception e) {
         System.out.println("Thread " +  threadName + " interrupted.");
      }
      System.out.println("Thread " +  threadName + " exiting.");
   }
   
   public void starting () {
      System.out.println("Starting " +  threadName );
      if (t == null) {
         t = new Thread (this, threadName);
         t.start ()
      }
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
    MyThread T1 = new MyThread( "Thread-1");
    T1.start();
  }
}

class MyThread extends Thread {
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