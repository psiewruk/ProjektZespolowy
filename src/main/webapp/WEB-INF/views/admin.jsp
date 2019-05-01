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
        <a class="navbar-brand js-scroll-trigger" href="${contextPath}/welcome">FoodTalk</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
            	<form id="logoutForm" method="POST" action="${contextPath}/logout">
         		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    			</form>
    		<c:if test="${!empty isUser}">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${contextPath}/user">Twoje konto</a>
            </li>
            </c:if>
            <c:if test="${!empty isAdmin}">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${contextPath}/admin">Panel administratora</a>
            </li>
            </c:if>
            <c:if test="${!empty isManager}">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${contextPath}/manage">Zarządzanie restauracją</a>
            </li>
            </c:if>
            <li>
              <a class="nav-link js-scroll-trigger" onclick="document.forms['logoutForm'].submit()" style="cursor:pointer;"> Wyloguj</a>
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
    
    <section id="admin" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2 class="text-white mb-4">Panel administracyjny</h2>
			  
			  <button class="btn btn-secondary" onclick='hideForm("catManage")'>KATEGORIE</button>
			  <button class="btn btn-secondary" onclick='hideForm("resManage")'>RESTAURACJE</button>
			  <button class="btn btn-secondary" onclick='hideForm("userManage")'>UŻYTKOWNICY</button>
			  <button class="btn btn-secondary" onclick='hideForm("appManage")'>WNIOSKI</button>
			   
			<br/><br/>       
          </div>
        </div>
      </div>
    </section>
    
    <section>
    <div id="modalAddCategory" class="modal fade" role="dialog">
				  <div class="modal-dialog">
    			  <!-- Modal content-->
    				  <div class="modal-content">
      					  <div class="modal-header">
        					  <a class="modal-title font-weight-bold">Dodaj kategorię</a>
        					  <button type="button" class="close" data-dismiss="modal">&times;</button>
      					  </div>
      					  <div class="modal-body">
							<form id="categoryAdd" method="POST" action="admin/addCategory">
							 <div class="row">
							  <div class="col-3">
								<p class="mt-2">Nazwa:</p>
							  </div>
							  <div class="col">
							    <input type="text" class="mb-2 form-control" name="categoryName" required/>
  							  </div>
								<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
								<input type="submit" class="btn btn-primary mr-3" value="Dodaj">
							 </div>
	 						</form>
    			  		  </div>
    				  </div>
  				  </div>
			  </div>  
			  
			  <div id="modalAddRestaurant" class="modal fade" role="dialog">
				  <div class="modal-dialog">
    			  <!-- Modal content-->
    				  <div class="modal-content">
      					  <div class="modal-header">
        					  <a class="modal-title font-weight-bold">Dodaj restaurację</a>
        					  <button type="button" class="close" data-dismiss="modal">&times;</button>
      					  </div>
      					  <div class="modal-body">
							<form id="restaurantAdd" method="POST" action="admin/addRestaurant">
							 <div class="row">
							  <div class="col-3">
								<p class="mt-2">Nazwa:</p>
								<p class="mt-3">Opis:</p>
								<p class="mt-4">Ulica:</p>
								<p class="mt-4">Numer:</p>
								<p class="mt-4">Kod pocztowy:</p>
								<p class="mt-4">Miasto:</p>
								<p class="mt-4">Restaurator:</p>
							  </div>
							  <div class="col">
							    <input type="text" class="mb-2 form-control" name="restaurantName" required/>
							    <input type="text" class="mb-2 form-control" name="desc" required/>
							    <input type="text" class="mb-2 form-control" name="street" required/>
							    <input type="text" class="mb-2 form-control" name="number" required/>
							    <br/>
							    <input type="text" class="mb-2 form-control" name="code" required/>
							    <input type="text" class="mb-2 form-control" name="city" required/>
							    <input type="text" class="mb-2 form-control" name="username" required/>
								<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
							 </div>
							 <div class="col">
							 <input type="submit" class="btn btn-primary mr-3" value="Dodaj">
							 </div>
	 						</form>
    			  		  </div>
    				  </div>
  				  </div>
		</div>
</section>
<section id="catManage" style="display:none;">
<button class="btn btn-secondary" data-toggle="modal" data-target="#modalAddCategory">
				Dodaj kategorię
</button>
<c:if test="${!empty listCategories}">
	<c:set var="listSize" value="${fn:length(listCategories)}"/>
	<c:forEach items="${listCategories}" var="category" varStatus="stat">
	  <c:choose>
		<c:when test="${ stat.count == 1 }">
		  <section id="contact" class="contact-section">
		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${category.name}</h3>
					<button onclick='hideForm("${category.name}edit")'class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${category.name}delete")' class="btn btn-danger">Usuń</button>
    				<form id="${category.name}edit" method="POST" action="admin/editCategory" style="display:none">
        	<input type="text" name="newName" placeholder="Nowa nazwa"/>
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	<input type="submit" class="btn btn-primary" value="Wyślij">
        </form>
        <form id="${category.name}delete" method="POST" action="admin/deleteCategory" style="display:none">
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
        	
        </form>
				  </div>
				</div>
			  </div>
		</c:when>

	    <c:when test="${ stat.count == listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${category.name}</h3>
					<button onclick='hideForm("${category.name}edit")'class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${category.name}delete")' class="btn btn-danger">Usuń</button>
    				<form id="${category.name}edit" method="POST" action="admin/editCategory" style="display:none">
        	<input type="text" name="newName" placeholder="Nowa nazwa"/>
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	<input type="submit" class="btn btn-primary" value="Wyślij">
        </form>
        <form id="${category.name}delete" method="POST" action="admin/deleteCategory" style="display:none">
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
        	
        </form>
				  </div>
				</div>
			  </div>
		</div>
	  </section>           
       	</c:when>	

		<c:when test="${stat.count % 3 == 0 && stat.count < listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${category.name}</h3>
					<button onclick='hideForm("${category.name}edit")'class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${category.name}delete")' class="btn btn-danger">Usuń</button>
    				<form id="${category.name}edit" method="POST" action="admin/editCategory" style="display:none">
        	<input type="text" name="newName" placeholder="Nowa nazwa"/>
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	<input type="submit" class="btn btn-primary" value="Wyślij">
        </form>
        <form id="${category.name}delete" method="POST" action="admin/deleteCategory" style="display:none">
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
        	
        </form>
				  </div>
				</div>
			  </div>
        </div>
        </section>
        <section id="contact" class="contact-section">
		<div class="container">
        <div class="row">
        </c:when>
                
		<c:otherwise>
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${category.name}</h3>
					<button onclick='hideForm("${category.name}edit")'class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${category.name}delete")' class="btn btn-danger">Usuń</button>
    				<form id="${category.name}edit" method="POST" action="admin/editCategory" style="display:none">
        	<input type="text" name="newName" placeholder="Nowa nazwa"/>
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	<input type="submit" class="btn btn-primary" value="Wyślij">
        </form>
        <form id="${category.name}delete" method="POST" action="admin/deleteCategory" style="display:none">
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
        	
        </form>
				  </div>
				</div>
			  </div>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </c:if>
</section>


<section id="resManage" style="display:none">
<button class="btn btn-secondary" data-toggle="modal" data-target="#modalAddRestaurant">
				Dodaj restaurację
</button>

<c:if test="${!empty listRestaurants}">
	<c:set var="listSize" value="${fn:length(listRestaurants)}"/>
	<c:forEach items="${listRestaurants}" var="restaurant" varStatus="stat">
	  <c:choose>
		<c:when test="${ stat.count == 1 }">
		  <section id="contact" class="contact-section">
		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${restaurant.name}</h3>
					<p> ${restaurant.description} <p>
					<p> ul. <c:out value=" "/> ${restaurant.address.street } <c:out value=" "/> ${restaurant.address.number }<br/>
						${restaurant.address.post_code} <c:out value=" "/> ${restaurant.address.city} </p>
					<button onclick='hideForm("${restaurant.name}edit")' class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${restaurant.name}delete")' class="btn btn-danger">Usuń</button>
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
            			<input type="submit" value="Wyślij" class="btn btn-primary">
            		</form>
            		<form id="${restaurant.name}delete" method="POST" action="admin/deleteRestaurant" style="display:none">
               		    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
               		    <input type="hidden"  name="restaurantId" value="${restaurant.id}"/>
               			Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
            		</form>
				  </div>
				</div>
			  </div>
		</c:when>

	    <c:when test="${ stat.count == listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${restaurant.name}</h3>
					<p> ${restaurant.description} <p>
					<p> ul. <c:out value=" "/> ${restaurant.address.street } <c:out value=" "/> ${restaurant.address.number }<br/>
						${restaurant.address.post_code} <c:out value=" "/> ${restaurant.address.city} </p>
					<button onclick='hideForm("${restaurant.name}edit")' class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${restaurant.name}delete")' class="btn btn-danger">Usuń</button>
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
            			<input type="submit" value="Wyślij" class="btn btn-primary">
            		</form>
            		<form id="${restaurant.name}delete" method="POST" action="admin/deleteRestaurant" style="display:none">
               		    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
               		    <input type="hidden"  name="restaurantId" value="${restaurant.id}"/>
               			Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
            		</form>
				  </div>
				</div>
			  </div>
		</div>
	  </section>           
       	</c:when>	

		<c:when test="${stat.count % 3 == 0 && stat.count < listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${restaurant.name}</h3>
					<p> ${restaurant.description} <p>
					<p> ul. <c:out value=" "/> ${restaurant.address.street } <c:out value=" "/> ${restaurant.address.number }<br/>
						${restaurant.address.post_code} <c:out value=" "/> ${restaurant.address.city} </p>
					<button onclick='hideForm("${restaurant.name}edit")' class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${restaurant.name}delete")' class="btn btn-danger">Usuń</button>
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
            			<input type="submit" value="Wyślij" class="btn btn-primary">
            		</form>
            		<form id="${restaurant.name}delete" method="POST" action="admin/deleteRestaurant" style="display:none">
               		    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
               		    <input type="hidden"  name="restaurantId" value="${restaurant.id}"/>
               			Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
            		</form>
				  </div>
				</div>
			  </div>
        </div>
        </section>
        <section id="contact" class="contact-section">
		<div class="container">
        <div class="row">
        </c:when>
                
		<c:otherwise>
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${restaurant.name}</h3>
					<p> ${restaurant.description} <p>
					<p> ul. <c:out value=" "/> ${restaurant.address.street } <c:out value=" "/> ${restaurant.address.number }<br/>
						${restaurant.address.post_code} <c:out value=" "/> ${restaurant.address.city} </p>
					<button onclick='hideForm("${restaurant.name}edit")' class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${restaurant.name}delete")' class="btn btn-danger">Usuń</button>
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
            			<input type="submit" value="Wyślij" class="btn btn-primary">
            		</form>
            		<form id="${restaurant.name}delete" method="POST" action="admin/deleteRestaurant" style="display:none">
               		    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
               		    <input type="hidden"  name="restaurantId" value="${restaurant.id}"/>
               			Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
            		</form>
				  </div>
				</div>
			  </div>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </c:if>
</section>

<section id="userManage" style="display:none">
<c:if test="${!empty listUsers}">
	<c:set var="listSize" value="${fn:length(listUsers)}"/>
	<c:forEach items="${listUsers}" var="user" varStatus="stat">
	  <c:choose>
		<c:when test="${ stat.count == 1 }">
		  <section id="contact" class="contact-section">
		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${user.username}</h3>
					<button onclick='hideForm("${user.username}edit")' class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${user.username}delete")' class="btn btn-danger">Usuń</button>
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
            		<input type="submit" value="Wyślij" class="btn btn-primary">
            		</form>
            		<form id="${user.username}delete" method="POST" action="admin/deleteUser" style="display:none">
             		   <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            		    <input type="hidden"  name="userId" value="${user.id}"/>
           		       Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
          		 	</form>
				  </div>
				</div>
			  </div>
		</c:when>

	    <c:when test="${ stat.count == listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${user.username}</h3>
					<button onclick='hideForm("${user.username}edit")' class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${user.username}delete")' class="btn btn-danger">Usuń</button>
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
            		<input type="submit" value="Wyślij" class="btn btn-primary">
            		</form>
            		<form id="${user.username}delete" method="POST" action="admin/deleteUser" style="display:none">
             		   <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            		    <input type="hidden"  name="userId" value="${user.id}"/>
           		       Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
          		 	</form>
				  </div>
				</div>
			  </div>
		</div>
	  </section>           
       	</c:when>	

		<c:when test="${stat.count % 3 == 0 && stat.count < listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${user.username}</h3>
					<button onclick='hideForm("${user.username}edit")' class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${user.username}delete")' class="btn btn-danger">Usuń</button>
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
            		<input type="submit" value="Wyślij" class="btn btn-primary">
            		</form>
            		<form id="${user.username}delete" method="POST" action="admin/deleteUser" style="display:none">
             		   <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            		    <input type="hidden"  name="userId" value="${user.id}"/>
           		       Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
          		 	</form>
				  </div>
				</div>
			  </div>
        </div>
        </section>
        <section id="contact" class="contact-section">
		<div class="container">
        <div class="row">
    </c:when>
                
		<c:otherwise>
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> ${user.username}</h3>
					<button onclick='hideForm("${user.username}edit")' class="btn btn-primary">Edytuj</button>
    				<button onclick='hideForm("${user.username}delete")' class="btn btn-danger">Usuń</button>
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
            		<input type="submit" value="Wyślij" class="btn btn-primary">
            		</form>
            		<form id="${user.username}delete" method="POST" action="admin/deleteUser" style="display:none">
             		   <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            		    <input type="hidden"  name="userId" value="${user.id}"/>
           		       Jesteś pewny? <input type="submit" value="Usuń" class="btn btn-danger">
          		 	</form>
				  </div>
				</div>
			  </div>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </c:if>
</section>

<section id="appManage" style="display:none">
<c:if test="${!empty listApplications}">
	<c:set var="listSize" value="${fn:length(listUsers)}"/>
	<c:forEach items="${listApplications}" var="application" varStatus="stat">
	  <c:choose>
		<c:when test="${ stat.count == 1 }">
		  <section id="contact" class="contact-section">
		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> Wniosek nr ${application.id}</h3>
					<p>Użytkownik: ${application.user.username}</p>
       				<p>Restauracja: ${application.name}</p>
        			<p>Opis: ${application.description}</p>
					<p>Adres: ul. <c:out value=" "></c:out> ${application.street} <c:out value=" "></c:out> ${application.number}<br/>
       				 ${application.post_code}<c:out value=" "></c:out>${application.city}</p>
    				<form id="${application.id}approve" method="POST" action="admin/approveApp">
           				 <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
           				 <input type="hidden"  name="applicationId" value="${application.id}"/>
           				 <input type="submit" value = "Zatwierdz" class="btn btn-primary">
           			</form>
            		<form id="${application.id}delete" method="POST" action="admin/discardApp">
              		     <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
               			 <input type="hidden"  name="applicationId" value="${application.id}"/>
               			 <input type="submit" value="Odrzuć" class="btn btn-danger">
           			</form>
				  </div>
				</div>
			  </div>
		</c:when>

	    <c:when test="${ stat.count == listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> Wniosek nr ${application.id}</h3>
					<p>Adres: ul. <c:out value=" "></c:out> ${application.street} <c:out value=" "></c:out> ${application.number}<br/>
       				 ${application.post_code}<c:out value=" "></c:out>${application.city}</p>
    				<form id="${application.id}approve" method="POST" action="admin/approveApp">
           				 <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
           				 <input type="hidden"  name="applicationId" value="${application.id}"/>
           				 <input type="submit" value = "Zatwierdz" class="btn btn-primary">
           			</form>
            		<form id="${application.id}delete" method="POST" action="admin/discardApp">
              		     <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
               			 <input type="hidden"  name="applicationId" value="${application.id}"/>
               			 <input type="submit" value="Odrzuć" class="btn btn-danger">
           			</form>
				  </div>
				</div>
			  </div>
		</div>
	  </section>           
       	</c:when>	

		<c:when test="${stat.count % 3 == 0 && stat.count < listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> Wniosek nr ${application.id}</h3>
					<p>Adres: ul. <c:out value=" "></c:out> ${application.street} <c:out value=" "></c:out> ${application.number}<br/>
       				 ${application.post_code}<c:out value=" "></c:out>${application.city}</p>
    				<form id="${application.id}approve" method="POST" action="admin/approveApp">
           				 <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
           				 <input type="hidden"  name="applicationId" value="${application.id}"/>
           				 <input type="submit" value = "Zatwierdz" class="btn btn-primary">
           			</form>
            		<form id="${application.id}delete" method="POST" action="admin/discardApp">
              		     <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
               			 <input type="hidden"  name="applicationId" value="${application.id}"/>
               			 <input type="submit" value="Odrzuć" class="btn btn-danger">
           			</form>
				  </div>
				</div>
			  </div>
        </div>
        </section>
        <section id="contact" class="contact-section">
		<div class="container">
        <div class="row">
    </c:when>
                
		<c:otherwise>
          <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<h3> Wniosek nr ${application.id}</h3>
					<p>Adres: ul. <c:out value=" "></c:out> ${application.street} <c:out value=" "></c:out> ${application.number}<br/>
       				 ${application.post_code}<c:out value=" "></c:out>${application.city}</p>
    				<form id="${application.id}approve" method="POST" action="admin/approveApp">
           				 <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
           				 <input type="hidden"  name="applicationId" value="${application.id}"/>
           				 <input type="submit" value = "Zatwierdz" class="btn btn-primary">
           			</form>
            		<form id="${application.id}delete" method="POST" action="admin/discardApp">
              		     <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
               			 <input type="hidden"  name="applicationId" value="${application.id}"/>
               			 <input type="submit" value="Odrzuć" class="btn btn-danger">
           			</form>
				  </div>
				</div>
			  </div>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </c:if>
</section>

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


<jsp:include page="contact.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>