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
		<h3 class="title" style="margin-left:25%;margin-top:20px;">14. Week 7: Java and Object Oriented Programming - Lesson 2 Exercise: Java Syntax</h3>
		<div class="card one" style="width:22%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">

			<p style="font-weight: bold;color:green;">Exercise:</p>
			<p>&nbsp;</p>

			Modify the code below so that <br>
			 1. So that numbers less than 10 are padded when printed  i.e. 01 : 59 : 59 rather than 1 : 59 : 59 <br>
			 2. So that the time includes miliseconds e.g. 01 : 59 : 59 : 999<br>

			<p>&nbsp;</p>
			<p style="font-weight: bold;color:green;">Expected Output:</p>
			<br>  01 : 59 : 59 : 00<br>
01 : 59 : 59 : 01<br>
01 : 59 : 59 : 02<br>
01 : 59 : 59 : 03<br>
01 : 59 : 59 : 04<br>
01 : 59 : 59 : 05<br>
01 : 59 : 59 : 06<br>
01 : 59 : 59 : 07<br>
01 : 59 : 59 : 08<br>
01 : 59 : 59 : 09<br>
01 : 59 : 59 : 10<br>
01 : 59 : 59 : 11<br>
01 : 59 : 59 : 12<br>
01 : 59 : 59 : 13<br>
01 : 59 : 59 : 14<br>
01 : 59 : 59 : 15<br>
01 : 59 : 59 : 16<br>
01 : 59 : 59 : 17<br>
01 : 59 : 59 : 18<br>
01 : 59 : 59 : 19<br>
01 : 59 : 59 : 20<br>
01 : 59 : 59 : 21<br>
01 : 59 : 59 : 22<br>
01 : 59 : 59 : 23<br>
01 : 59 : 59 : 24<br>
01 : 59 : 59 : 25<br>
01 : 59 : 59 : 26<br>
01 : 59 : 59 : 27<br>
01 : 59 : 59 : 28<br>
01 : 59 : 59 : 29 <br>
			<br>
		</div>
		<div class="card one" style="width:50%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;">

				<form action="submit_javacode" method="post" id="submitJavaCodeForm">

					<p>&nbsp;</p>
					<c:if test="${attemptedCode!=null}">
						<textarea name="ccode" rows="23" cols="80" style="background-color:rgba(0, 231, 255, 0.45) ; color:#fff">${attemptedCode}</textarea>

					</c:if>
					<c:if test="${attemptedCode==null}">
						<textarea name="ccode" rows="23" cols="80" style="background-color:rgba(0, 231, 255, 0.45) ; color:#fff" required="true">public class Main {

  public static void main(String[] args) {
		Counter hours = new Counter(24, 1);
		Counter mins = new Counter(60, 59);
		Counter sec = new Counter(60, 58);

		int i = 0;
		while(i < 10){
      System.out.println(hours.getCount() + " : " + 
                          mins.getCount() + " : " + 
                          sec.getCount());
			
      sec.tick();
			if(sec.getCount() == 0){
				mins.tick();
        if(mins.getCount() == 0){
				  hours.tick();
			  }
			}

			i++;
		}
  }
}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="List of Excersises" onclick="window.location.href='list_pop_exercise'">
					</c:if>



					<textarea name="answerCode" style="display: none;">public class Main {

public static void main(String[] args) {
        
// initialising counters
Counter hours = new Counter(24, 1);
        Counter mins = new Counter(60, 59);
        Counter sec = new Counter(60, 59);
Counter milisec = new Counter(1000);

// printing out time
        int i = 0;
        while(i < 30){
System.out.println(hours.getFormat() + " : " +
mins.getFormat() + " : " +
sec.getFormat() + " : " +
milisec.getFormat());

// changing the time   
milisec.tick();
            if (milisec.getCount() == 0) {
sec.tick();
if (sec.getCount() == 0) {
                 mins.tick();
if (mins.getCount() == 0) {
                 hours.tick();
}
             }
            }
        i++;
        }
}
}

// Counter.java

public class Counter {
    
// fields -> initialising limit and count.
// access modifier = private -> other classes can't access data directly.
private int limit;
    private int count;
    
// constructor -> Counter
    public Counter(int limit){
        // NOTE. this refers to the current object
this.limit = limit;
        count = 0;
    }
    
// constructor -> Counter
    public Counter(int limit, int count){
// NOTE. this refers to the current object
        this.limit = limit;
        this.count = count;
    }
    
// accessor -> getCount
    public int getCount(){
        return count;
    }
    
// mutator -> tick
// modifies count
    public void tick(){
        if(count == (limit-1)){
            count = 0;
        }
        else{
            count ++;
        }
    }

// accessor -> getFormat
public String getFormat(){
String countformat = String.format("%02d", count);
return countformat;
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