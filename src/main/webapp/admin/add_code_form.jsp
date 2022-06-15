<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add CodingQuestion to Order</title>
</head>
<body>
	<div align="center">
		<h2>Add CodingQuestion to Order ID: ${order.orderId}</h2>
		<form action="add_codingQuestion_to_order" method="post">
			<table>
				<tr>
					<td>Select a codingQuestion: </td>
					<td> 
						<select name="codingQuestionId">
							<c:forEach items="${listCodingQuestion}" var="codingQuestion" varStatus="status">
								<option value="${codingQuestion.codingQuestionId}">${codingQuestion.title} </option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>&nbsp;</tr>
				<tr>
					<td>Number of copies: </td>
					<td>
						<select name="quantity">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
				</tr>	
				<tr>&nbsp;</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="Add">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="Cancel" onclick="javascript: self.close()">
					</td>
				</tr>
						
			</table>		
		</form>
	</div>
</body>
</html>