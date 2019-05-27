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
    <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="${contextPath}/resources/css/grayscale.min.css" rel="stylesheet">
  </head>
  <body id="page-top">
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
      <section id="about" class="about-section text-center">
          <div class="container">
              <div class="row">
                  <div class="col-lg-8 mx-auto">
                      <h2 class="text-white mb-4">Złóż wniosek o dodanie Twojej restauracji</h2>
                      <p class="text-white-50">Po zweryfikowaniu danych natychmiast odpowiemy :)</p>
                  </div>
              </div>
          </div>
      </section>
  	<section id="contact" class="contact-section bg-seamless">
  	<div class="container">
	  <div class="row">
        <div class="col  mb-5">
          <div class="card py-4 h-100">
          <form action="/restauratorForm" method="POST" id="appForm">
          <div class="row">
          	<div class="col">
          		<input type="text" class="form-control ml-1" name="name" placeholder="Nazwa restauracji"/>
          		<textarea class="form-control ml-1" rows="9" cols="9" name="description"  placeholder="Kilka zdań o restauracji"></textarea>
          	</div>
          	<div class="col ml-0">
          	<div class="text-center">
            	<input type="text" class="form-control mb-1"name="street" placeholder="Ulica"/>
            	<input type="text" class="form-control mb-1"name="number" placeholder="Numer budynku/lokalu"/>
            	<input type="text" class="form-control mb-1"name="postcode" placeholder="Kod pocztowy"/>
            	<input type="text" class="form-control mb-1"name="city" placeholder="Miasto"/>
            </div>
            <div class="col">
            	<input type="hidden" class="form-control" name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            	<div class="text-center mt-4"><input type="submit" class="btn btn-primarya js-scroll-trigger" value="Wyślij wniosek"/></div>
            </div>
            </div>
          </div>
          </form>
          </div>
          </div>
        </div>
     </div>
    </section>
  </div>
      <jsp:include page="contact.jsp"></jsp:include>
      <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>