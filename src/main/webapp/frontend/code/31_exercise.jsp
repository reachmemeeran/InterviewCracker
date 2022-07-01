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
		<h3>Easy-9: Set</h3>
		</div>

		<div class="codelefttopbar">

<pre>
Reference: https://docs.oracle.com/javase/8/docs/api/java/util/Set.html
public interface Set<E>
extends Collection<E>

Set is a collection that contains no duplicate elements. More formally, sets contain no 
pair of elements e1 and e2 such that e1.equals(e2), and at most one null element. 

As implied by its name, this interface models the mathematical set abstraction.
The Set interface places additional stipulations, beyond those inherited from the 
Collection interface, on the contracts of all constructors and on the contracts of the 
add, equals and hashCode methods. Declarations for other inherited methods are also 
included here for convenience. 
(The specifications accompanying these declarations have been tailored to the Set 
interface, but they do not contain any additional stipulations.)

The additional stipulation on constructors is, not surprisingly, that all constructors 
must create a set that contains no duplicate elements (as defined above).

Note: Great care must be exercised if mutable objects are used as set elements. 
The behavior of a set is not specified if the value of an object is changed in a manner 
that affects equals comparisons while the object is an element in the set. A special 
case of this prohibition is that it is not permissible for a set to contain itself as an 
element.

Some set implementations have restrictions on the elements that they may contain. 
For example, some implementations prohibit null elements, and some have restrictions on 
the types of their elements. Attempting to add an ineligible element throws an unchecked 
exception, typically NullPointerException or ClassCastException. 
Attempting to query the presence of an 
ineligible element may throw an exception, or it may simply return false; some 
implementations will exhibit the former behavior and some will exhibit the latter. 
More generally, attempting an operation on an ineligible element whose completion would 
not result in the insertion of an ineligible element into the set may throw an exception 
or it may succeed, at the option of the implementation. Such exceptions are marked as 
"optional" in the specification for this interface.

This interface is a member of the Java Collections Framework.

Example: {1,2,3,4,5} is a set but {1,2,3,4,4} is not a set
</pre>

 <br>
 <br>
			<br>
		</div>
		<div class="codemiddlebar">
			
			<div align="left">

				<pre>
<p style="font-weight: bold;">Question:</p>Convert the ArrayList to HashSet and witness the difference
<p style="font-weight: bold;">Expected Output:</p>Print ArrayList: [warren buffett, Jeff Bezos, Larry Ellison, Larry Page, , , 
Jeff Bezos]
ArrayList size is: 7
Print Hashset: [Larry Page, , warren buffett, Jeff Bezos, Larry Ellison]
Hashset size is: 5
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
    List<String> arrayList = new ArrayList<>();
    arrayList.add("warren buffett");
    arrayList.add("Jeff Bezos");
    arrayList.add("Larry Ellison");
    arrayList.add("Larry Page");
    arrayList.add(""); // ADDING FIRST NULL ELEMENT
    arrayList.add(""); // ADDING SECOND NULL ELEMENT
    arrayList.add("Jeff Bezos"); // ADDING DUPLICATE ELEMENT
    System.out.println("Print ArrayList: "+arrayList);
    System.out.println("ArrayList size is: "+arrayList.size());
    convertToSet(arrayList);
  }

  static void convertToSet(List<String> arrayList){
    //INITIALISE THE HASHSET
    for(String entry : arrayList){
      //ADD ELEMENTS TO HASHSET
    }
    System.out.println("Print Hashset: "+hashSet);
    System.out.println("Hashset size is: "+hashSet.size());
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
									onclick="window.location.href='list_code_easy'"></td>
							</tr>
						</table>

					</c:if>



					<textarea name="answerCode" style="display: none;">
import java.util.*;

class Main{
  public static void main(String args[]){
    List<String> arrayList = new ArrayList<>();
    arrayList.add("warren buffett");
    arrayList.add("Jeff Bezos");
    arrayList.add("Larry Ellison");
    arrayList.add("Larry Page");
    arrayList.add("");
    arrayList.add("");
    arrayList.add("Jeff Bezos");
    System.out.println("Print ArrayList: "+arrayList);
    System.out.println("ArrayList size is: "+arrayList.size());
    convertToSet(arrayList);
  }

  static void convertToSet(List<String> arrayList){
    Set<String> hashSet = new HashSet<>();
    for(String entry : arrayList){
      hashSet.add(entry);
    }
    System.out.println("Print Hashset: "+hashSet);
    System.out.println("Hashset size is: "+hashSet.size());
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
									onclick="window.location.href='list_code_easy'">
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