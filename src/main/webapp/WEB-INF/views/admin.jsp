<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FoodTalk</title>

    <!-- Bootstrap core CSS -->
    <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${contextPath}/resources/css/grayscale.min.css" rel="stylesheet">
  </head>

  <body id="page-top">
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">FoodTalk</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">O co chodzi?</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#projects">Nowości</a>
            </li>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
            	<form id="logoutForm" method="POST" action="${contextPath}/logout">
         		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    			</form>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${contextPath}/user">Twoje konto</a>
            </li>
            <li>
              <a class="nav-link js-scroll-trigger" onclick="document.forms['logoutForm'].submit()" style="cursor:pointer;"> Logout</a>
            </li>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name == null}">
              <li class="nav-item">
                <a class="nav-link" href="${contextPath}/login">Logowanie</a>
              </li>
            </c:if>
          </ul>
        </div>
      </div>
    </nav>

     <!-- About Section -->
    <section id="about" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2 class="text-white mb-4">Panel admina</h2>
            <p class="text-white-50"><button onclick='hideForm("addCategory")'>Dodaj kategorię</button>
            <form id="addCategory" method="POST" action="admin/addCategory" style="display:none;">
            	<input type="text" name="categoryName">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="submit" value="Dodaj">
			</form>
            </p>
            <p class="text-white-50"><button onclick='hideForm("addRestaurant")'>Dodaj restaurację</button>
            <form id="addRestaurant" method="POST" action="admin/addRestaurant" style="display:none;">
                <input type="text" name="restaurantName" placeholder="Nazwa">
                <input type="text" name="desc" placeholder="Opis">
                <br>Adres: </br>
                <input type="text" name="street" placeholder="Ulica">
                <input type="text" name="number" placeholder="Numer">
                <input type="text" name="code" placeholder="Kod pocztowy">
                <input type="text" name="city" placeholder="Miasto">
                <br>Restaurator: </br>
                <input type="text" name="username" placeholder="Restaurator">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            	<input type="submit" value="Dodaj">
            </form>
          </div>
        </div>
      </div>
    </section>

<c:if test="${!empty listCategories}">
    <h2 class="text-black mb-4">Kategorie</h2>
    <c:set var="listSize" value="${fn:length(listCategories)}"/>
    <c:forEach items="${listCategories}" var="category" varStatus="stat">
    <section id="contact" class="contact-section bg-black">
    	<h1>Kategoria: ${category.name}
    	<button onclick='hideForm("${category.name}edit")'>Edytuj</button>
    	<button onclick='hideForm("${category.name}delete")'>Usuń</button>
    	<form id="${category.name}edit" method="POST" action="admin/editCategory" style="display:none">
        	<input type="text" name="newName" placeholder="Nowa nazwa"/>
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	<input type="submit">
        </form>
        <form id="${category.name}delete" method="POST" action="admin/deleteCategory" style="display:none">
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	Jesteś pewny? <input type="submit" value="Usuń">
        </form>
    </c:forEach>
</c:if>
<c:if test="${!empty listRestaurants}">
    <h2 class="text-white mb-4">Restauracje</h2>

    <c:set var="listSize" value="${fn:length(listRestaurants)}"/>
    <c:forEach items="${listRestaurants}" var="restaurant" varStatus="stat">
    <section id="contact" class="contact-section bg-black">
        	<h1>Restauracja: ${restaurant.name}
        	<button onclick='hideForm("${restaurant.name}edit")'>Edytuj</button>
        	<button onclick='hideForm("${restaurant.name}delete")'>Usuń</button>
        	<form id="${restaurant.name}edit" method="POST" action="admin/editRestaurant" style="display:none">
            	<input type="text" name="newName" placeholder="Nowa nazwa"/>
                <input type="text" name="newDesc" placeholder="Opis">
                <br>Adres: </br>
                <input type="text" name="newStreet" placeholder="Ulica">
                <input type="text" name="newNumber" placeholder="Numer">
                <input type="text" name="newCode" placeholder="Kod pocztowy">
                <input type="text" name="newCity" placeholder="Miasto">
            	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            	<input type="hidden"  name="restaurantId" value="${restaurant.id}"/>
            	<input type="submit">
            </form>
            <form id="${restaurant.name}delete" method="POST" action="admin/deleteRestaurant" style="display:none">
                <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                <input type="hidden"  name="restaurantId" value="${restaurant.id}"/>
                Jesteś pewny? <input type="submit" value="Usuń">
            </form>
    </c:forEach>
</c:if>

<c:if test="${!empty listUsers}">
    <h2 class="text-white mb-4">Użytkownicy</h2>

    <c:set var="listSize" value="${fn:length(listUsers)}"/>
    <c:forEach items="${listUsers}" var="user" varStatus="stat">
    <section id="contact" class="contact-section bg-black">
        <h1>Użytkonik: ${user.username}</h1>
        	<button onclick='hideForm("${user.username}edit")'>Edytuj</button>
        	<button onclick='hideForm("${user.username}delete")'>Usuń</button>
        <form id="${user.username}edit" method="POST" action="admin/editUser" style="display:none">
            <input type="text" name="newUsername" placeholder="Nowa nazwa użytkownika"/>
            <select name="newRole">
                <c:if test="${!empty listRoles}">
					<c:forEach items="${listRoles}" var="role">
   						 <option value="${role.id}">${role.name}</option>
    				</c:forEach>
   				 </c:if>
   			</select>
            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            <input type="hidden"  name="userId" value="${user.id}"/>
            <input type="submit">
            </form>
            <form id="${user.username}delete" method="POST" action="admin/deleteUser" style="display:none">
                <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                <input type="hidden"  name="userId" value="${user.id}"/>
                Jesteś pewny? <input type="submit" value="Usuń">
            </form>
           </section>
    </c:forEach>
</c:if>



<script>
function hideForm(id) {
  var x = document.getElementById(id);
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
</script>


<jsp:include page="footer.jsp"></jsp:include>
