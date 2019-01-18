<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/grayscale.min.css" rel="stylesheet">
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
            <p class="text-white-50">Po wybraniu interesującego Ciebie dania poprostu kliknij je! ;)</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Category menu one -->
    <section id="contact" class="contact-section bg-black">
      <div class="container">

        <div class="row">
          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
           <a href="${contextPath}/restaurantBurger"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/burgery.jpg" alt=""></a>
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantPizza"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/pizze.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantKebab"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/kebaby.jpg" alt="">
              </div>
            </div>
          </div>
      </div>
    </section>

	<!-- Category menu two -->
    <section id="contact" class="contact-section bg-black">
      <div class="container">

        <div class="row">
          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantTortilla"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/Tortilla.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantLasagne"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/lasagne.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantMakaron"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/makaron.jpg" alt="">
              </div>
            </div>
          </div>
      </div>
    </section>

    <!-- Category menu three -->
    <section id="contact" class="contact-section bg-black">
      <div class="container">

        <div class="row">
          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantSalatki"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/salatki.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantKanapki"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/kanapki.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantSushi"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/sushi.jpg" alt="">
              </div>
            </div>
          </div>
      </div>
    </section>
    
        <!-- Category menu four -->
    <section id="contact" class="contact-section bg-black">
      <div class="container">

        <div class="row">
          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantPierogi"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/pierogi.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantNalesniki"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/nalesniki.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantZupy"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/zupy.jpg" alt="">
              </div>
            </div>
          </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="bg-black small text-center text-white-50">
      <div class="container">
        &copy; 2019 FoodTalk
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/grayscale.min.js"></script>

  </body>
</html>
