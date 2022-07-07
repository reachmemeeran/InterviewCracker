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
		<h3 class="title" style="margin-left:40%;margin-top:20px;">Advanced-1: Trees</h3>
		

		<div class="card one" style="width:53%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;">
		
		<div class="card one" style="width:100%;margin-top:-1px;margin-right:-1px;margin-bottom:-1px;margin-left:15px;border-radius:0px;min-height:30px;background:#000;">

				<pre>
<p style="font-weight: bold;color:green;">Question:</p>For the tree created in main class, print the following,
1. In-Order Traversal (LnR)
2. Pre-Order Traversal (nLR)
3. Post-Order Traversal (LRn)
4. Left side of the Tree
5. Right side of the Tree
6. Outline of the Tree
7. Depth of the Tree (This is solved already!)
8. Print/ Draw Tree in console (This is solved already!)

For Qn, 1 to 6 - Correct/complete the class to make it work.
&nbsp;
<p style="font-weight: bold;color:green;">Expected Output:</p>Pre-Order Traversal is : 1 2 3 5 6 4 7 8 9 10 12 13 11 14 15 
In-Order Traversal is : 5 3 6 2 7 4 8 1 12 10 13 9 14 11 15 
Pre-Order Traversal is : 1 2 3 5 6 4 7 8 9 10 12 13 11 14 15 
Post-Order Traversal is : 5 6 3 7 8 4 2 12 13 10 14 15 11 9 1 
Left side of the Tree is : 1 2 3 5 
Right side of the Tree is : 1 9 11 15 
Outline of the Tree is : 5 3 2 1 9 11 15 
Depth of the Tree is : 4
Tree is : 
               (1)            
          (2)        (9)        
     (3)    (4)    (10)    (11)    
(5) (6) (7) (8) (12) (13) (14) (15) 
</pre>
			</div>

<pre>

<p style="font-weight: bold;color:cyan;">Tree:</p>A tree is a data structure composed of nodes.
1. Each tree has a root node.
2. The root node has zero or more child nodes.
3. Each child node has zero or more child nodes, and so on.



<p style="font-weight: bold;color:cyan;">Trees vs. Binary Trees:</p>A binary tree is a tree in which each node has up to two children. 
Not all trees are binary trees. 
For example, this tree is not a binary tree. You could call it a ternary tree.

					8
				4	6	10
			  2	  1		  20
 
<p style="font-weight: bold;color:cyan;">Binary Tree Traversal:</p>There are three types of Binary Tree Traversal, they are
1. In-Order Traversal
2. Pre-Order Traversal
3. Post-Order Traversal

<p style="font-weight: bold;color:cyan;">In-Order Traversal:</p>In-order traversal means to "visit" (often, print) the left branch, 
then the current node, and finally, the right branch.

	void inOrderTraversal(TreeNode node) {
		if (node!= null) {
			inOrderTraversal(node.left);
			visit(node);
			inOrderTraversal(node.right);
		}
	}
	
When performed on a binary search tree, it visits the nodes in ascending order 
(hence the name "in-order").

<p style="font-weight: bold;color:cyan;">Pre-Order Traversal:</p>Pre-order traversal visits the current node before its child nodes 
(hence the name "pre-order").
	
	void preOrderTraversal(TreeNode node) {
		if (node!= null) {
			visit(node);
			preOrderTraversal(node.left);
			preOrderTraversal(node.right);
		}
	}
	
In a pre-order traversal, the root is always the first node visited.

<p style="font-weight: bold;color:cyan;">Post-Order Traversal:</p>Post-order traversal visits the current node after its child nodes 
(hence the name "post-order").
	
	void postOrderTraversal(TreeNode node) {
		if (node!= null) {
			postOrderTraversal(node.left);
			postOrderTraversal(node.right);
			visit(node);
		}
	}

In a post-order traversal, the root is always the last node visited.

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
import java.util.Queue;
import java.util.LinkedList;


/*
                  1
                /   \
              2       9
            / \      /    \
          3    4    10      11
        / \   / \   / \      / \
      5   6  7   8  12  13  14  15


*/


class Main{
  public static void main(String args[]){
    // root
    Node node = new Node(1);

    // Left side of the tree
    node.left = new Node(2);
    node.left.left = new Node(3);
    node.left.right = new Node(4);

    node.left.left.left = new Node(5);
    node.left.left.right = new Node(6);

    node.left.right.left = new Node(7);
    node.left.right.right = new Node(8);

    // Right side of the tree
    node.right = new Node(9);
    node.right.left = new Node(10);
    node.right.right = new Node(11);

    node.right.left.left = new Node(12);
    node.right.left.right = new Node(13);

    node.right.right.left = new Node(14);
    node.right.right.right = new Node(15); 

    PrintTreeNodeData tree = new PrintTreeNodeData();
    System.out.print("\nIn-Order Traversal is : ");
    tree.inOrder(node);

    System.out.print("\nPre-Order Traversal is : ");
    tree.preOrder(node);

    System.out.print("\nPost-Order Traversal is : ");
    tree.postOrder(node);

    System.out.print("\nLeft side of the Tree is : "+node.data+" ");
    tree.leftSide(node.left);

    System.out.print("\nRight side of the Tree is : "+node.data+" ");
    tree.rightSide(node.right);

    System.out.print("\nOutline of the Tree is : ");
    tree.leftSideOutline(node.left);
    System.out.print(node.data+" ");
    tree.rightSide(node.right);

    int depth = tree.depthOfTree(node,1);
    System.out.print("\nDepth of the Tree is : "+depth);

    System.out.println("\nTree is : ");
    tree.printTree(node,depth);

  }
}

class Node{
  int data;
  Node left, right;
  public Node(int data){
    this.data=data;
    this.left=this.right=null;
  }
}


class PrintTreeNodeData{
  //nLR
  public void preOrder(Node node){
    if(node==null){
      return;
    }
    System.out.print(node.data+" ");
    preOrder(node.left);
  }

  //LnR
  public void inOrder(Node node){
    if(node==null){
      return;
    }
    inOrder(node.left);
    System.out.print(node.data+" ");
  }

   //LRn
  public void postOrder(Node node){
    if(node==null){
      return;
    }
    postOrder(node.left);
    System.out.print(node.data+" ");
  }
  //L
  public void leftSide(Node node){
    if(node==null){
      return;
    }
    System.out.print(node.data+" ");
  }
  //R
  public void rightSide(Node node){
    if(node==null){
      return;
    }
    System.out.print(node.data+" ");
  }
  //L (reverse)
  public void leftSideOutline(Node node){
    if(node==null){
      return;
    }
    System.out.print(node.data+" ");
  }

  public int depthOfTree(Node node, int depth){
    if(node==null){
      return depth;
    }
   int left = depth;
   int right = depth;
   if(node.left!=null){
     left = depthOfTree(node.left,depth+1);
   }
   if(node.right!=null){
     right = depthOfTree(node.right,depth+1);
   }
   return Math.max(left,right);
  }

  public void printTree(Node node, int depth){

    if(node==null){
      return;
    }
    Queue<Node> queue = new LinkedList<Node>();

    queue.add(node);

    while(true){
      int nodeCount = queue.size();
      if(nodeCount==0){
        break;
      }
      for(int i=0; i<depth-1;i++){
        System.out.print("     ");
      }
      while(nodeCount>0){
        Node queueNode = queue.peek();
        System.out.print("("+queueNode.data+")");

        for(int j=depth; j>0; j--){
          if(j==1){
            System.out.print(" ");
          }else if(j==2){
            System.out.print("   ");
          }else{
            System.out.print("    ");
          }
        }
        
        queue.remove();
        
        if(queueNode.left!=null){
          queue.add(queueNode.left);
        }
        if(queueNode.right!=null){
          queue.add(queueNode.right);
        }
        nodeCount--;
      }
      depth--;
      System.out.println();
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
import java.util.*;


/*
                  1
                /   \
              2       9
            / \      /    \
          3    4    10      11
        / \   / \   / \      / \
      5   6  7   8  12  13  14  15


*/


class Main{
  public static void main(String args[]){
    // root
    Node node = new Node(1);

    // Left side of the tree
    node.left = new Node(2);
    node.left.left = new Node(3);
    node.left.right = new Node(4);

    node.left.left.left = new Node(5);
    node.left.left.right = new Node(6);

    node.left.right.left = new Node(7);
    node.left.right.right = new Node(8);

    // Right side of the tree
    node.right = new Node(9);
    node.right.left = new Node(10);
    node.right.right = new Node(11);

    node.right.left.left = new Node(12);
    node.right.left.right = new Node(13);

    node.right.right.left = new Node(14);
    node.right.right.right = new Node(15); 

    PrintTreeNodeData tree = new PrintTreeNodeData();
    System.out.print("\nIn-Order Traversal is : ");
    tree.inOrder(node);

    System.out.print("\nPre-Order Traversal is : ");
    tree.preOrder(node);

    System.out.print("\nPost-Order Traversal is : ");
    tree.postOrder(node);

    System.out.print("\nLeft side of the Tree is : "+node.data+" ");
    tree.leftSide(node.left);

    System.out.print("\nRight side of the Tree is : "+node.data+" ");
    tree.rightSide(node.right);

    System.out.print("\nOutline of the Tree is : ");
    tree.leftSideOutline(node.left);
    System.out.print(node.data+" ");
    tree.rightSide(node.right);

    int depth = tree.depthOfTree(node,1);
    System.out.print("\nDepth of the Tree is : "+depth);

    System.out.println("\nTree is : ");
    tree.printTree(node,depth);

  }
}

class Node{
  int data;
  Node left, right;
  public Node(int data){
    this.data=data;
    this.left=this.right=null;
  }
}


class PrintTreeNodeData{
  //nLR
  public void preOrder(Node node){
    if(node==null){
      return;
    }
    System.out.print(node.data+" ");
    preOrder(node.left);
    preOrder(node.right);
  }

  //LnR
  public void inOrder(Node node){
    if(node==null){
      return;
    }
    inOrder(node.left);
    System.out.print(node.data+" ");
    inOrder(node.right);
  }

   //LRn
  public void postOrder(Node node){
    if(node==null){
      return;
    }
    postOrder(node.left);
    postOrder(node.right);
    System.out.print(node.data+" ");
  }
  //L
  public void leftSide(Node node){
    if(node==null){
      return;
    }
    System.out.print(node.data+" ");
    leftSide(node.left);
  }
  //R
  public void rightSide(Node node){
    if(node==null){
      return;
    }
    System.out.print(node.data+" ");
    rightSide(node.right);
  }
  //L (reverse)
  public void leftSideOutline(Node node){
    if(node==null){
      return;
    }
    leftSideOutline(node.left);
    System.out.print(node.data+" ");
  }

  public int depthOfTree(Node node, int depth){
    if(node==null){
      return depth;
    }
   int left = depth;
   int right = depth;
   if(node.left!=null){
     left = depthOfTree(node.left,depth+1);
   }
   if(node.right!=null){
     right = depthOfTree(node.right,depth+1);
   }
   return Math.max(left,right);
  }

  public void printTree(Node node, int depth){

    if(node==null){
      return;
    }
    Queue<Node> queue = new LinkedList<Node>();

    queue.add(node);

    while(true){
      int nodeCount = queue.size();
      if(nodeCount==0){
        break;
      }
      for(int i=0; i<depth-1;i++){
        System.out.print("     ");
      }
      while(nodeCount>0){
        Node queueNode = queue.peek();
        System.out.print("("+queueNode.data+")");

        for(int j=depth; j>0; j--){
          if(j==1){
            System.out.print(" ");
          }else if(j==2){
            System.out.print("   ");
          }else{
            System.out.print("    ");
          }
        }
        
        queue.remove();
        
        if(queueNode.left!=null){
          queue.add(queueNode.left);
        }
        if(queueNode.right!=null){
          queue.add(queueNode.right);
        }
        nodeCount--;
      }
      depth--;
      System.out.println();
    }
  }

  public void printTr(Node node,int depth){
    if(node==null){
      return;
    }
    Queue<Node> queue = new LinkedList<Node>();
    queue.add(node);

    while(true){
      int nodeCount = queue.size();
      if(nodeCount==0){
        break;
      }
      for(int i=0; i<depth-1; i++){
        System.out.print("    ");
      }
      while(nodeCount>0){
        Node queueNode = queue.peek();
        System.out.print("["+queueNode.data+"]");
        for(int j=depth; j>0; j--){
          if(j==1){
            System.out.print(" ");
          }else if(j==2){
            System.out.print("   ");
          }else{
            System.out.print("    ");
          }
        }
        queue.remove();

        if(queueNode.left!=null){
          queue.add(queueNode.left);
        }
        if(queueNode.right!=null){
          queue.add(queueNode.right);
        }
        if(nodeCount>1){
          System.out.print(", ");
        }
        nodeCount--;
      }
      depth--;
      System.out.println();
    }
  }

  public void printLastLeft(Node node, int depth){
    if(node==null){
      return;
    }
    Queue<Node> queue = new LinkedList<Node>();
    queue.add(node);
    int count=1;
    while(true){
      int nodeCount = queue.size();
      if(nodeCount==0){
        break;
      }

      while(nodeCount>0){
        Node queueNode = queue.peek();
        

        if(queueNode.left!=null){
          queue.add(queueNode.left);
        }
        if(count==depth-1){
          System.out.print(queueNode.data+" ");
        }
        if(queueNode.right!=null){
          queue.add(queueNode.right);
        }
        queue.remove();
        nodeCount--;
        
      }
      System.out.println();
      count++;
    }
  }
  public void printLastRight(Node node, int depth){
    if(node==null){
      return;
    }
    Queue<Node> queue = new LinkedList<Node>();
    queue.add(node);
    int count=1;
    while(true){
      int nodeCount = queue.size();
      if(nodeCount==0){
        break;
      }

      while(nodeCount>0){
        Node queueNode = queue.peek();

        if(queueNode.left!=null){
          queue.add(queueNode.left);
        }
        if(count==depth-1){
          System.out.print(queueNode.data+" ");
        }
        
        if(queueNode.right!=null){
          queue.add(queueNode.right);
        }
        queue.remove();
        nodeCount--;
        
      }
      System.out.println();
      count++;
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