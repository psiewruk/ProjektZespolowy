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

	<script src="https://unpkg.com/scrollreveal"></script>
    <!-- Bootstrap core CSS -->
    <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${contextPath}/resources/css/grayscale.min.css" rel="stylesheet">
  </head>

  <body id="page-top-login">
  <div class="bg-seamless">
  
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="${contextPath}/welcome">FoodTalk</a>
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

    <!-- Header -->
    <header class="masthead">
      <div class="container d-flex h-100 align-items-center" >
        <div class="mx-auto text-center">
        
          <h1 class="start mx-auto my-0 text-uppercase text-white">Czas coś zjeść?</h1>
          <a href="${contextPath}/category" class="btn btn-primarya js-scroll-trigger">Zaczynajmy!</a>
        </div>
      </div>
    </header>

    <!-- About Section -->
    <section id="about" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="explain col-lg-8 mx-auto">
            <h2 class="text-white mb-4">O co chodzi?</h2>
            <p class="text-white-50">Szukaj restauracji pod kątem kategorii jedzenia. Lubisz pizze? Znajduj restauracje, które oferują takie menu!</p>
          </div>
        </div>
      </div>
    </section>


    <!-- Projects Section -->
    <section id="projects" class="projects-section">


        <!-- Project One Row -->
      <div class="row">
       <div class="slide-right float-left ml-5">
       <div class="container">
      <div class="border border-dark mb-5">
        <div class="row justify-content-center no-gutters">
          <div class="col-lg-6">
            <img class="img-fluid" src="${contextPath}/resources/img/welcome/Aplikacja.png" alt="">
          </div>
          <div class="col-lg-6">
            <div class="bg-black text-center h-100 project">
              <div class="d-flex h-100">
                <div class="project-text w-100 my-auto text-center text-lg-left">
                  <h4 class="text-white">Aplikacja FoodTalk</h4>
                  <p class="mb-0 text-white-50">Już niedługo również na telefonach i pozostałych urządzeniach mobilnych!</p>
                  <hr class="d-none d-lg-block mb-0 ml-0">
                </div>
              </div>
            </div>
          </div>
          </div>
        </div>
      </div>
        </div>
      </div>
      
        <!-- Project Two Row -->
		<div class="row justify-content-end">
       <div class="slide-left float-right mr-5">
       <div class="container">
      <div class="border border-dark mb-5">
        <div class="row justify-content-center no-gutters">

          <div class="col-lg-6">
            <img class="img-fluid" src="${contextPath}/resources/img/welcome/Promocje.jpg" alt="">
          </div>
          <div class="col-lg-6 order-lg-first">
            <div class="bg-black text-center h-100 project">
              <div class="d-flex h-100">
                <div class="project-text w-100 my-auto text-center text-lg-right">
                  <h4 class="text-white">Promocje</h4>
                  <p class="mb-0 text-white-50">U nas zawsze znajdziesz najlepsze promocje na jedzenie, które Ciebie interesuje! Nie czekaj i zacznij szukać już teraz!</p>
                  <hr class="d-none d-lg-block mb-0 mr-0">
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
        </div>
        </div>
        </div>

		<!-- Project Three Row -->
		<div class="row">
       <div class="slide-right float-left ml-5">
       <div class="container">
      <div class="border border-dark">
        <div class="row justify-content-center no-gutters">
          <div class="col-lg-6">
            <img class="img-fluid" src="${contextPath}/resources/img/welcome/Nasza opinia.jpg" alt="">
          </div>
          <div class="col-lg-6">
            <div class="bg-black text-center h-100 project">
              <div class="d-flex h-100">
                <div class="project-text w-100 my-auto text-center text-lg-left">
                  <h4 class="text-white">Nasza opinia!</h4>
                  <p class="mb-0 text-white-50">Gorąco polecamy jedzenia na mieście! Znajdź potrawę, która Ciebie interesuje i umów się na tajemnicze spotkanie z nieznajomym! Sami testowaliśmy!</p>
                  <hr class="d-none d-lg-block mb-0 ml-0">
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
        </div>
        </div>
        </div>

    </section>
  </div>
	
	<script>
		window.sr = ScrollReveal();
		sr.reveal('.start', {
			duration :2000,
			origin:'bottom',
			distance:'70px'
		})	
		
		window.sr = ScrollReveal();
		sr.reveal('.explain', {
			duration :1000,
			origin:'bottom',
			distance:'30px'
		})	
		
		window.sr = ScrollReveal();
		sr.reveal('.navbar', {
			duration :1500,
			origin:'top',
			distance:'30px'
		})	
		
		window.sr = ScrollReveal();
		sr.reveal('.slide-left', {
			duration :1500,
			origin:'left',
			distance:'300px'
		})	
		
		window.sr = ScrollReveal();
		sr.reveal('.slide-right', {
			duration :1500,
			origin:'right',
			distance:'300px'
		})	
	</script>
	 	
<jsp:include page="contact.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>