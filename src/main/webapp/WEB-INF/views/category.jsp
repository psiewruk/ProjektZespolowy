<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name == null}"> 
    	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
   			<div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
      			<ul class="navbar-nav mr-auto">
            	<li class="nav-item active">
             	   <a class="nav-link-dark" href="#">Home</a>
            	</li>
        	</ul>
   	 		</div>
    		<div class="mx-auto order-0">
        		<a class="navbar-brand mx-auto" href="#">FoodTalk</a>
        			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
            			<span class="navbar-toggler-icon"></span>
        			</button>
    		</div>
    		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
      			<ul class="navbar-nav ml-auto">
           	 		<li class="nav-item">
                		<a class="nav-ling" href="/login">Zaloguj sie</a>
            		</li>
        		</ul>
    		</div>
		</nav>
    </c:if>
    
   <c:if test="${pageContext.request.userPrincipal.name != null}"> 
  		<form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
   			<div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
      			<ul class="navbar-nav mr-auto">
            	<li class="nav-item active">
             	   <a class="nav-link-dark" href="#">Home</a>
            	</li>
        	</ul>
   	 		</div>
    		<div class="mx-auto order-0">
        		<a class="navbar-brand mx-auto" href="#">FoodTalk</a>
        			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
            			<span class="navbar-toggler-icon"></span>
        			</button>
    		</div>
    		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
      			<ul class="navbar-nav ml-auto">
           	 		<li class="nav-item">
                		<p class="nav-text-dark" style="color: yellow;">${pageContext.request.userPrincipal.name}</p>
            		</li>
            		<li class="nav-item">
                		<a class="nav-link-dark" onclick="document.forms['logoutForm'].submit()" style="cursor:pointer; color:yellow;"> (Logout)</a>
            		</li>
        		</ul>
    		</div>
		</nav>
    </c:if>
    
<h3>Wybierz restauracje: </h3>
<c:if test="${!empty listRestaurants}">
	<table class="tg">
	<tr>
		<th width="120">Category Name</th>
	</tr>
	<c:forEach items="${listRestaurants}" var="restaurant">
		<tr>
			<td><a href="/category/${restaurant.name}">${restaurant.name}</a></td>
			<!-- <td><a href="<c:url value='/edit/${person.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${person.id}' />" >Delete</a></td> -->
		</tr>
	</c:forEach>
	</table>
</c:if>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
