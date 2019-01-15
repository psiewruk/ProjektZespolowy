<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${!empty rList}">
	<table class="tg">
	<tr>
		<th width="120">Restaurant Name</th>
	</tr>
	<c:forEach items="${rList}" var="restaurant">
		<tr>
			<td><a href="/restaurant/${restaurant.id}">${restaurant.name}</a></td>
			<!-- <td><a href="<c:url value='/edit/${person.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${person.id}' />" >Delete</a></td> -->
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>