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
          <c:if test="${!empty restaurant}">
            <h2 class="text-white mb-4">Panel zarządzania restauracją ${restaurant.name}</h2>
            <p class="text-white-50"><button onclick='hideForm("addMenu")'>Dodaj menu</button>
            <form id="addMenu" method="POST" action="manage/addMenu" style="display:none;">
            	<input type="text" name="menuName">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="submit" value="Dodaj">
			</form>
            </p>
            </c:if>
            <c:if test="${empty restaurant}">
            	<h2 class="text-white mb-4">Nie ma restauracji powiązanej z tym kontem. Skontaktuj się z administratorem.</h2>
            </c:if>
          </div>
        </div>
      </div>
    </section>
    
<c:if test="${!empty menuMap}">
	<c:forEach items="${menuMap}" var="map" varStatus="stat">
	<section id="contact" class="contact-section bg-black">
	<h1>Menu: ${map.key.name} - 
	<button onclick='hideForm("${map.key.name}edit")'>Zmien nazwe</button>
	<button onclick='hideForm("${map.key.name}add")'>Dodaj danie</button>
	<form id="${map.key.name}del" method="POST" action="manage/deleteMenu">
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<input type="hidden"  name="menuId" value="${map.key.id}"/>
		<input type="submit" value="Usuń">
	</form>
	</h1>
	<form id="${map.key.name}edit" method="POST" action="manage/editMenu" style="display:none">
		<input type="text" name="newName" placeholder="Nowa nazwa"/>
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<input type="hidden"  name="menuId" value="${map.key.id}"/>
		<input type="submit">
	</form>
	<form id="${map.key.name}add" method="POST" action="manage/addDish" style="display:none">
		<input type="text" name="newName" placeholder="Nazwa" required/>
		<input type="text" name="newDesc" placeholder="Opis" required/>
		<input type="text" name="newPrice" placeholder="Cena" required/>
		<select name="cat">
		<c:if test="${!empty listCategories}">
			<c:forEach items="${listCategories}" var="category">
   				 <option value="${category.id}">${category.name}</option>
    		</c:forEach>
   		 </c:if>
  		</select>
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<input type="hidden"  name="menuId" value="${map.key.id}"/>
		<input type="submit">
	 </form>
		<c:forEach items="${map.value}" var="dish" varStatus="stat">
		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <img class="img-fluid" src="${contextPath}/resources/img/dania/dishPlaceholder.jpg" alt="" />
				  <div class="card-body text-center">
					<h3>${dish.name}</h3>
					<p>${dish.description}</p>
					<p>${dish.price}</p>
					<button onclick='hideForm("${dish.name}edit")'>Edit</button>
					<form id="${map.key.name}del" method="POST" action="manage/deleteDish">
						<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
						<input type="hidden"  name="dishId" value="${dish.id}"/>
						<input type="submit" value="Usuń">
					</form>
				  </div>
				  <form id="${dish.name}edit" method="POST" action="manage/editDish" style="display:none">
					<input type="text" name="newName" placeholder="Nowa nazwa"/>
					<input type="text" name="newDesc" placeholder="Nowy opis"/>
					<input type="text" name="newPrice" placeholder="Nowa cena"/>
					<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
					<input type="hidden"  name="dishId" value="${dish.id}"/>
					<input type="submit">
				  </form>
				</div>
			  </div>
			</div>
		  </div>
		</c:forEach>
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
