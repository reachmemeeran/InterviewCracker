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
		<h3>Easy-8: Linked Lists</h3>
		</div>

		<div class="codelefttopbar">

<pre>
linked list is a data structure that represents a sequence of nodes. 
In a singly linked list, each node points to the next node in the linked list. 
A doubly linked list gives each node pointers to both the next node and 
the previous node.

The following flow depicts a doubly linked list:
1 <-> 5 <-> 2

Unlike an array, a linked list does not provide constant time access to a 
particular "index" within the list.
This means that if you'd like to find the Kth element in the list, you will 
need to iterate through K elements.
The benefit of a linked list is that you can add and remove items from the 
beginning of the list in constant time. 

<p style="font-weight: bold;">Creating a Linked List:</p>
The code below implements a very basic singly linked list.

class Node {
	Node next= null;
	int data;

	public Node(int d) {
		data= d;
	}

	void appendToTail(int d) {
		Node end= new Node(d);
		Node n = this;
		while (n.next != null) {
			n = n.next;
		}
		n.next = end;
	}
}
In this implementation, we don't have a Linked List data structure. 
We access the linked list through a reference to the head Node of the linked list. 
When you implement the linked list this way, you need to be a bit careful. 
What if multiple objects need a reference to the linked list, and then the head of 
the linked list changes? Some objects might still be pointing to the old head.
</pre>

 <br>
 <br>
			<br>
		</div>
		<div class="codemiddlebar">
			
			<div align="left">

				<pre>
<p style="font-weight: bold;">Question:</p>Analyse the implementation to check if a linked list is a palindrome.
Hint: Comment the line ### nodes[length - 2].data = 0 ### in Main method
to pass the test case
<p style="font-weight: bold;">Expected Output:</p>0->1->2->3->4->3->2->1->0
true
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

    int length = 9;
		LinkedListNode[] nodes = new LinkedListNode[length];
		for (int i = 0; i < length; i++) {
			nodes[i] = new LinkedListNode(i >= length / 2 ? length - i - 1 : i, null, null);
		}
		
		for (int i = 0; i < length; i++) {
			if (i < length - 1) {
				nodes[i].setNext(nodes[i + 1]);
			}
			if (i > 0) {
				nodes[i].setPrevious(nodes[i - 1]);
			}
		}
		
		nodes[length - 2].data = 0; // Comment this line to pass the test case
		
		LinkedListNode head = nodes[0];
		System.out.println(head.printForward());
    Palindrome palindrome = new Palindrome();
		System.out.println(palindrome.isPalindrome(head));
  }
}

class LinkedListNode {
  public LinkedListNode next, prev, last;
  public int data;
  
  public LinkedListNode(int d, LinkedListNode n, LinkedListNode p){
    data = d;
    setNext(n);
    setPrevious(p);
  }
  
  public LinkedListNode(int d) {
    data = d;
  }

  public LinkedListNode() {}
  
  public void setNext(LinkedListNode n) {
    next = n;
    if (this == last) {
      last = n;
    }
    if (n != null && n.prev != this) {
      n.setPrevious(this);
    }
  }

    public void setPrevious(LinkedListNode p) {
      prev = p;
      if (p != null && p.next != this) {
        p.setNext(this);
      }
    }

    public String printForward() {
  		if (next != null) {
  			return data + "->" + next.printForward();
  		} else {
  			return ((Integer) data).toString();
  		}
  	}
  
  public LinkedListNode clone() {
    LinkedListNode next2 = null;
    if (next != null) {
      next2 = next.clone();
    }
    LinkedListNode head2 = new LinkedListNode(data, next2, null);
    return head2;
  }
}

class Result {
		public LinkedListNode node;
		public boolean result;
		public Result(LinkedListNode n, boolean res) {
			node = n;
			result = res;
		}
}

class Palindrome{
  public boolean isPalindrome(LinkedListNode head) {
    int length= lengthOfList(head);
    Result p = isPalindromeRecurse(head, length);
    return p.result;
  }

  public Result isPalindromeRecurse(LinkedListNode head, int length) {
    if (head== null || length<= 0) { //Even number of nodes
      return new Result(head, true);
    } else if (length== 1) { // Odd number of nodes
      return new Result(head.next, true);
    }
  
    /* Recurse on sublist. */
    Result res = isPalindromeRecurse(head.next, length - 2);

    /* If child calls are not a palindrome, pass back up a failure. */
    if (! res.result || res.node== null) {
      return res;
    }
    
    /* Check if matches corresponding node on other side. */
    res.result= (head.data== res.node.data);

    /* Return corresponding node. */
    res.node= res.node.next;

    return res;
  }

  public int lengthOfList(LinkedListNode n) {
    int size= 0;
    while (n != null) {
      size++;
      n = n.next;
    }
    return size;
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

    int length = 9;
		LinkedListNode[] nodes = new LinkedListNode[length];
		for (int i = 0; i < length; i++) {
			nodes[i] = new LinkedListNode(i >= length / 2 ? length - i - 1 : i, null, null);
		}
		
		for (int i = 0; i < length; i++) {
			if (i < length - 1) {
				nodes[i].setNext(nodes[i + 1]);
			}
			if (i > 0) {
				nodes[i].setPrevious(nodes[i - 1]);
			}
		}
		
		//nodes[length - 2].data = 0; // Comment this line to pass the test case
		
		LinkedListNode head = nodes[0];
		System.out.println(head.printForward());
    Palindrome palindrome = new Palindrome();
		System.out.println(palindrome.isPalindrome(head));
  }
}

class LinkedListNode {
  public LinkedListNode next, prev, last;
  public int data;
  
  public LinkedListNode(int d, LinkedListNode n, LinkedListNode p){
    data = d;
    setNext(n);
    setPrevious(p);
  }
  
  public LinkedListNode(int d) {
    data = d;
  }

  public LinkedListNode() {}
  
  public void setNext(LinkedListNode n) {
    next = n;
    if (this == last) {
      last = n;
    }
    if (n != null && n.prev != this) {
      n.setPrevious(this);
    }
  }

    public void setPrevious(LinkedListNode p) {
      prev = p;
      if (p != null && p.next != this) {
        p.setNext(this);
      }
    }

    public String printForward() {
  		if (next != null) {
  			return data + "->" + next.printForward();
  		} else {
  			return ((Integer) data).toString();
  		}
  	}
  
  public LinkedListNode clone() {
    LinkedListNode next2 = null;
    if (next != null) {
      next2 = next.clone();
    }
    LinkedListNode head2 = new LinkedListNode(data, next2, null);
    return head2;
  }
}

class Result {
		public LinkedListNode node;
		public boolean result;
		public Result(LinkedListNode n, boolean res) {
			node = n;
			result = res;
		}
}

class Palindrome{
  public boolean isPalindrome(LinkedListNode head) {
    int length= lengthOfList(head);
    Result p = isPalindromeRecurse(head, length);
    return p.result;
  }

  public Result isPalindromeRecurse(LinkedListNode head, int length) {
    if (head== null || length<= 0) { //Even number of nodes
      return new Result(head, true);
    } else if (length== 1) { // Odd number of nodes
      return new Result(head.next, true);
    }
  
    /* Recurse on sublist. */
    Result res = isPalindromeRecurse(head.next, length - 2);

    /* If child calls are not a palindrome, pass back up a failure. */
    if (! res.result || res.node== null) {
      return res;
    }
    
    /* Check if matches corresponding node on other side. */
    res.result= (head.data== res.node.data);

    /* Return corresponding node. */
    res.node= res.node.next;

    return res;
  }

  public int lengthOfList(LinkedListNode n) {
    int size= 0;
    while (n != null) {
      size++;
      n = n.next;
    }
    return size;
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