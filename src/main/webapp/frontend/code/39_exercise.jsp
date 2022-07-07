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
		<h3 class="title" style="margin-left:40%;margin-top:20px;">Advanced-2: Graphs</h3>
		

		<div class="card one" style="width:53%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;">
		
		<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;background:#000;">

				<pre>
<p style="font-weight: bold;color:green;">Question:</p>For the graph created in Main class, print the following,
1. Print the Graph in Deapth First Traversal
2. Print the Graph in Breadth First Traversal

Correct/complete the class to make it work.

Graph:
0-->1 -->3 -->5
|
2-->4
&nbsp;
<p style="font-weight: bold;color:green;">Expected Output:</p>Print the Graph in Deapth First Traversal : 0 2 4 1 3 5 
Print the Graph in Breadth First Traversal : 0 1 2 3 4 5 
</pre>
			</div>

<pre>

<p style="font-weight: bold;color:cyan;">Graph:</p>A tree is actually a type of graph, but not all graphs are trees. 
A tree is a connected graph without cycles.
A graph is simply a collection of nodes with edges between (some of) them.

1. Graphs can be either directed (like the following graph) or undirected. 
While directed edges are like a one-way street, undirected edges are like a two-way street.
2. The graph might consist of multiple isolated subgraphs. 
If there is a path between every pair of vertices,it is called a "connected graph"
3. The graph can also have cycles (or not). An "acyclic graph" is one without cycles.

<p style="font-weight: bold;color:cyan;">Depth-First Search (DFS):</p>In DFS, visit a node a and then iterate through each of a's neighbors. 
When visiting a node b that is a neighbor of a, we visit all of b's neighbors 
before going on to a's other neighbors. 
That is, a exhaustively searches b's branch before any of its other neighbors.

Note that pre-order and other forms of tree traversal are a form of DFS. The key difference is that when
implementing this algorithm for a graph, we must check if the node has been visited. If we don't, we risk
getting stuck in an infinite loop.

The pseudocode below implements DFS.

	void search(Node root) {
		if (root== null) return;
			visit(root);
			root.visited= true;
			for each (Node n in root.adjacent) {
				if (n.visited == false) {
					search(n);
			}
		}
	}
 
<p style="font-weight: bold;color:cyan;">Breadth-First Search (BFS)</p>In BFS, node a visits each of a's neighbors before visiting any of their neighbors. 
You can think of this as searching level by level out from a. 
An iterative solution involving a queue usually works best.

	void search(Node root) {
		Queue queue = new Queue();
		root.marked= true;
		queue.enqueue(root); // Add to the end of queue

		while (!queue.isEmpty()) {
			Node r = queue.dequeue(); // Remove from the front of the queue
			visit(r);
			foreach (Node n in r.adjacent) {
				if (n.marked == false) {
					n. marked = true;
					queue.enqueue(n);
				}
			}
		}
	}

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
import java.util.List;
import java.util.ArrayList;
import java.util.Stack;
import java.util.Queue;
import java.util.LinkedList;

/*
 
 0-->1 -->3 -->5
 |
 2-->4
 */

public class Main{
	public static void main(String args[]) {
		Graph graph = new Graph(6);
		
		graph.addedges(0, 1);
		graph.addedges(1, 3);
		graph.addedges(0, 2);
		graph.addedges(2, 4);
		graph.addedges(3, 5);
		
		PrintGraph printGraph = new PrintGraph();
		
		System.out.print("Print the Graph in Deapth First Traversal : ");
		printGraph.printGraphDFT(graph, 0);
		System.out.print("\nPrint the Graph in Breadth First Traversal : ");
		printGraph.printGraphBFT(graph, 0);
		
	}
}



class Graph{
	List<List<Integer>> graphArr;
	int node;
	
	Graph(int node){
		this.node=node;
		graphArr = new ArrayList<>();
		for(int i=0; i<node; i++)graphArr.add(new ArrayList<Integer>());
	}
	
	void addedges(int a, int b) {
		//Complete this section
	}
}

class PrintGraph{
	void printGraphDFT(Graph graph, int start){
		Stack<Integer> stack = new Stack<Integer>();
		stack.push(start+1);
		
		while(!stack.isEmpty()) {
			int current = stack.peek();
			stack.pop();
			System.out.println(current+" ");
			for(int x: graph.graphArr.get(current))stack.push(x);
		}
	}
	
	void printGraphBFT(Graph graph, int start) {
		Queue<Integer> queue = new LinkedList<Integer>();
		
		queue.add(start-1);
		
		while(!queue.isEmpty()) {
			int current = queue.peek();
			queue.remove();
			System.out.println(current+" ");
			for(int x: graph.graphArr.get(current))queue.add(x);
		}
	}
}
        </textarea>
					</c:if>

					<c:if test="${status!=null}">
						<button class="button-3" style="float:right;margin-right:80px;margin-top:20px;"  type="submit">Re-Run</button>&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input class="button-1" style="margin-top:20px;" type="BUTTON" value="Back" onclick="window.location.href='list_code_advanced'">
					</c:if>



					<textarea name="answerCode" style="display: none;">
import java.util.List;
import java.util.ArrayList;
import java.util.Stack;
import java.util.Queue;
import java.util.LinkedList;

/*
 
 0-->1 -->3 -->5
 |
 2-->4
 */

public class Main{
	public static void main(String args[]) {
		Graph graph = new Graph(6);
		
		graph.addedges(0, 1);
		graph.addedges(1, 3);
		graph.addedges(0, 2);
		graph.addedges(2, 4);
		graph.addedges(3, 5);
		
		PrintGraph printGraph = new PrintGraph();
		
		System.out.print("Print the Graph in Deapth First Traversal : ");
		printGraph.printGraphDFT(graph, 0);
		System.out.print("\nPrint the Graph in Breadth First Traversal : ");
		printGraph.printGraphBFT(graph, 0);
		
	}
}



class Graph{
	List<List<Integer>> graphArr;
	int node;
	
	Graph(int node){
		this.node=node;
		graphArr = new ArrayList<>();
		for(int i=0; i<node; i++)graphArr.add(new ArrayList<Integer>());
	}
	
	void addedges(int a, int b) {
		graphArr.get(a).add(b);
	}
}

class PrintGraph{
	void printGraphDFT(Graph graph, int start){
		Stack<Integer> stack = new Stack<Integer>();
		stack.push(start);
		
		while(!stack.isEmpty()) {
			int current = stack.peek();
			stack.pop();
			System.out.print(current+" ");
			for(int x: graph.graphArr.get(current))stack.push(x);
		}
	}
	
	void printGraphBFT(Graph graph, int start) {
		Queue<Integer> queue = new LinkedList<Integer>();
		
		queue.add(start);
		
		while(!queue.isEmpty()) {
			int current = queue.peek();
			queue.remove();
			System.out.print(current+" ");
			for(int x: graph.graphArr.get(current))queue.add(x);
		}
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