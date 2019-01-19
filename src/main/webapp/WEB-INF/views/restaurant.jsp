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
  
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="${contextPath}/index">FoodTalk</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">O co chodzi?</a>
            </li>
            <a class="nav-link js-scroll-trigger" href="${contextPath}/login">Logowanie</a>            
          </ul>
        </div>
      </div>
    </nav>
    
     <!-- About Section -->
    <section id="about" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2 class="text-white mb-4">Na co masz ochotę?</h2>
            <p class="text-white-50">Po wybraniu interesującego Cię dania poprostu kliknij je! ;)</p>
          </div>
        </div>
      </div>
    </section>
    
<c:if test="${!empty menuMap}">
	<c:set var="listSize" value="${fn:length(listCategories)}"/>
	<c:forEach items="${menuMap}" var="map" varStatus="stat">
	<section id="contact" class="contact-section bg-black">
	<h1>Menu: ${map.key.name}</h1>
		<c:forEach items="${map.value}" var="dish" varStatus="stat">
		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <img class="img-fluid" src="${contextPath}/resources/img/dania/dishPlaceholder.jpg" alt="" />
				  <div class="card-body text-center">
					<h3>${dish.name}</h3>
					<p>${dish.description}</p>
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</c:forEach>
		</section>
    </c:forEach>
</c:if>

<form method="POST" action="${contextPath}/visit" class="form-signin">
        <h2 class="form-signin-heading">Dodaj wizytę</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="description" type="text" class="form-control" placeholder="Opis"/>
            <input name="start_date" type="datetime-local" class="form-control" placeholder="Początek"/>
            <input name="start_date" type="datetime-local" class="form-control" placeholder="Koniec"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Dodaj</button>
        </div>

    </form>

    <!-- Footer -->
    <footer class="bg-black small text-center text-white-50">
      <div class="container">
        &copy; 2019 FoodTalk
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="${contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="${contextPath}/resources/js/grayscale.min.js"></script>

  </body>
</html>
