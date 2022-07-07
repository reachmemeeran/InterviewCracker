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
		<h3 class="title" style="margin-left:40%;margin-top:20px;">Advanced-3: Sorting</h3>
		

		<div class="card one" style="width:53%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;">
		
		<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;background:#000;">

				<pre>
<p style="font-weight: bold;color:green;">Question:</p>Complete the code to sort an array of strings so that all the anagrams 
are next to each other.
&nbsp;
<p style="font-weight: bold;color:green;">Expected Output:</p>abc
cab
dog
god

</pre>
			</div>

<pre>

<p style="font-weight: bold;color:cyan;">Sorting:</p>Sorting means to put data in order; either numerically or alphabetically.
Below are the different types of sorting algorithms.

<p style="font-weight: bold;color:cyan;">Bubble Sort | Runtime: O(n2) average and worst case. Memory: O(1) .:</p>
In bubble sort, we start at the beginning of the array and swap the first two elements if 
the first is greater than the second. Then, we go to the next pair, and so on, 
continuously making sweeps of the array until it is sorted. In doing so, the smaller 
items slowly "bubble" up to the beginning of the list.

<p style="font-weight: bold;color:cyan;">Selection Sort | Runtime: O(n2) average and worst case. Memory: O(1) .:</p>
Selection sort is the child's algorithm: simple, but inefficient. Find the smallest 
element using a linear scan and move it to the front (swapping it with the front element). 
Then, find the second smallest and move it, again doing a linear scan. Continue doing 
this until all the elements are in place.

<p style="font-weight: bold;color:cyan;">Merge Sort | Runtime: O(n log(n)) average and worst case. Memory: Depends.:</p>
Merge sort divides the array in half, sorts each of those halves, and then merges 
them back together. Each of those halves has the same sorting algorithm applied to it. 
Eventually, you are merging just two single element arrays. 
It is the "merge" part that does all the heavy lifting.

<p style="font-weight: bold;color:cyan;">Quick Sort | Runtime: O(n log(n)) average, O(n2) worst case. Memory: O(log(n)).:</p>
In quick sort we pick a random element and partition the array, such that all numbers 
that are less than the partitioning element come before all elements that are greater 
than it. The partitioning can be performed efficiently through a series of swaps.

<p style="font-weight: bold;color:cyan;">Radix Sort I Runtime: O(kn):</p>
Radix sort is a sorting algorithm for integers (and some other data types) that takes 
advantage of the fact that integers have a finite number of bits. In radix sort, 
we iterate through each digit of the number, grouping numbers by each digit. 
For example, if we have an array of integers, we might first sort by the first digit, 
so that the Os are grouped together. Then, we sort each of these groupings by the next 
digit. We repeat this process sorting by each subsequent digit, until finally the whole 
array is sorted. Unlike comparison sorting algorithms, which cannot perform better 
than O(n log(n)) in the average case, radix sort has a runtime of 0(kn), 
where n is the number of elements and k is the number of passes of the sorting algorithm.

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
import java.util.Arrays;
import java.util.Comparator;

public class Main{
	public static void main(String args[]) {
		String arr[]= {"abc","god","cab","dog"};
    Arrays.sort(arr, new AnagramComparator());
    for(String s:arr)
    System.out.println(s);
	}
}

class AnagramComparator implements Comparator<String> {

    public String getSortedString(String s) {
        char[] content = s.toCharArray();
        //Arrays.sorted(content);
        return new String(content);
    }

   @Override
  public int compare(String arg0, String arg1) {
    return -1;
  }

}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="Back" onclick="window.location.href='list_code_advanced'">
					</c:if>



					<textarea name="answerCode" style="display: none;">
import java.util.Arrays;
import java.util.Comparator;

public class Main{
	public static void main(String args[]) {
		String arr[]= {"abc","god","cab","dog"};
    Arrays.sort(arr, new AnagramComparator());
    for(String s:arr)
    System.out.println(s);
	}
}

class AnagramComparator implements Comparator<String> {

    public String getSortedString(String s) {
        char[] content = s.toCharArray();
        Arrays.sort(content);
        return new String(content);
    }

   @Override
  public int compare(String arg0, String arg1) {
    return arg0.compareTo(arg1);
  }

}
</textarea>
					<input type="hidden" name="exerciseId" value="${exerciseId}">

					<c:if test="${status==null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="Back" onclick="window.location.href='list_code_advanced'">
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