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
		<h3 class="title" style="margin-left:40%;margin-top:20px;">Advanced-4: Searching</h3>
		

		<div class="card one" style="width:53%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;">
		
		<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;background:#000;">

				<pre>
<p style="font-weight: bold;color:green;">Question:</p>Given a sorted array of strings that is interspersed with empty strings, Correct the
compilation errors to find the location of a given string.

Input String Array = { "ann", null, null, null, "bento", null, null, 
"david", null, null, "egg" };
&nbsp;
<p style="font-weight: bold;color:green;">Expected Output:</p>ann is at position: 0
bento is at position: 4
david is at position: 7
egg is at position: 10

</pre>
			</div>

<pre>

<p style="font-weight: bold;color:cyan;">Searching:</p>Searching is one of the most common actions performed in regular business applications. 
This involves fetching some data stored in data structures like Arrays , List , Map , etc. 
More often than not, this search operation determines the responsiveness of the 
application for the end-user.

In binary search, we look for an element x in a sorted array by first comparing x to the 
midpoint of the array. 
If x is less than the midpoint, then we search the left half of the array. 
If x is greater than the midpoint, then we search the right half of the array. 

We then repeat this process, treating the left and right halves as subarrays.
Again, we compare x to the midpoint of this subarray and then search either its left or 
right side. 
We repeat this process until we either find x or the subarray has size 0.

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
public class Main{
  public static void main( String[] args ){
    String[] a = { "ann", null, null, null, "bento", null, null, "david", null, null, "egg" };
    Search t = Search();
    System.out.println("ann is at position: "+t.find( a, "ann", 0, 10 ));
    System.out.println("bento is at position: "+t.find( a, "bento", 0, 10 ));
    System.out.println("david is at position: "+t.find( a, "david", 0, 10 ));
    System.out.println("egg is at position: "+t.find( a, "egg", 0, 10 ));
  }
}

class Search{
  public int find( String[s], String key, int start, int end ){
    if( start >= end ){
      if( s[start] != null ){
        if( key.compareTo( s[start] ) = 0 )
          return start;
        else
          return -1;
      }
      else
        return -1;
    }else{
      int mid = start + ( end - start )/2;
      if( s[mid] ! null ){
        if( s[mid].compareTo( key ) == 0 )
          return mid;
        else if( s[mid].compareTo( key ) <> 0 )
          return find( s, key, start, mid - 1 );
        else
          return find( s, key, mid + 1, end );
      }else if( s[mid] = null ){
        int point_front = mid, point_back = mid;
        do{
          --point_front;
          ++point_back;
          if( s[point_front] != null ){
            if( s[point_front].compareTo( key ) = 0 )
              return point_front;
            else if( s[point_front].compareTo( key ) > 0 )
              return find( s, key, start, point_front - 1 )
            else
              point_front++;
          }
          if( s[point_back] != null ){
            if( s[point_back].compareTo( key ) = 0 )
              return point_back
            else if( s[point_back].compareTo( key ) < 0 )
              return find( s, key, point_back + 1, end )
            else
              point_back--;
          }
        }while( s[point_front] == null || s[point_back] == null );
          
      }
    }
    return -1  
  }
}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="Back" onclick="window.location.href='list_code_advanced'">
					</c:if>



					<textarea name="answerCode" style="display: none;">
public class Main{
  public static void main( String[] args ){
    String[] a = { "ann", null, null, null, "bento", null, null, "david", null, null, "egg" };
    Search t = new Search();
    System.out.println("ann is at position: "+t.find( a, "ann", 0, 10 ));
    System.out.println("bento is at position: "+t.find( a, "bento", 0, 10 ));
    System.out.println("david is at position: "+t.find( a, "david", 0, 10 ));
    System.out.println("egg is at position: "+t.find( a, "egg", 0, 10 ));
  }
}

class Search{
  public int find( String[] s, String key, int start, int end ){
    if( start >= end ){
      if( s[start] != null ){
        if( key.compareTo( s[start] ) == 0 )
          return start;
        else
          return -1;
      }
      else
        return -1;
    }else{
      int mid = start + ( end - start )/2;
      if( s[mid] != null ){
        if( s[mid].compareTo( key ) == 0 )
          return mid;
        else if( s[mid].compareTo( key ) < 0 )
          return find( s, key, start, mid - 1 );
        else
          return find( s, key, mid + 1, end );
      }else if( s[mid] == null ){
        int point_front = mid, point_back = mid;
        do{
          --point_front;
          ++point_back;
          if( s[point_front] != null ){
            if( s[point_front].compareTo( key ) == 0 )
              return point_front;
            else if( s[point_front].compareTo( key ) > 0 )
              return find( s, key, start, point_front - 1 );
            else
              point_front++;
          }
          if( s[point_back] != null ){
            if( s[point_back].compareTo( key ) == 0 )
              return point_back;
            else if( s[point_back].compareTo( key ) < 0 )
              return find( s, key, point_back + 1, end );
            else
              point_back--;
          }
        }while( s[point_front] == null || s[point_back] == null );
          
      }
    }
    return -1;  
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