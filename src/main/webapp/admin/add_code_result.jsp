<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add CodingQuestion to Order</title>
</head>
<body>
	<div align="center">
		<h2>
			The codingQuestion <i>${codingQuestion.title}</i> has been added to the order ID <b>${order.orderId}</b>
		</h2>
		<input type="button" value="Close" onclick="javascript: self.close();" />
	</div>

	<script>
		window.onunload = function(){
			window.opener.location.reload();
		}
	</script>
</body>
</html>