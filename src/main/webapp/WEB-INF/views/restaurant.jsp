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
    <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${contextPath}/resources/css/grayscale.min.css" rel="stylesheet">
  </head>

  <body id="page-top-login">   
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
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${contextPath}/user">Twoje konto</a>
            </li>
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
    
   
     <!-- About Section -->
    <section id="about" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2 class="text-white mb-4">Zaloguj się aby umówić się na spotkanie!</h2>
            <p class="text-white-50">To proste! Zaloguj się do swojego konta aby zorganizować spotkanie :)</p>
          </div>
        </div>
      </div>
    </section>
      <c:if test="${pageContext.request.userPrincipal.name != null}">
    <form:form method="POST" modelAttribute="visitForm" class="form-signin">
        <h2 class="form-signin-heading ">Stwórz wizytę</h2>
        <spring:bind path="start_dateString">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="datetime-local" path="start_dateString" class="form-control" placeholder="Start"
                            autofocus="true"></form:input>
                <form:errors path="start_dateString"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="end_dateString">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="datetime-local" path="end_dateString" class="form-control" placeholder="End"></form:input>
                <form:errors path="end_dateString"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="description">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="description" class="form-control" placeholder="Opis"></form:input>
                <form:errors path="description"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Stwórz</button>
    </form:form>
  </c:if>
    
	<c:if test="${!empty menuMap}">
		<c:set var="listSize" value="${fn:length(listCategories)}"/>
		<section id="contact" class="contact-section bg-black">
		<h1 class="text-center font-weight-bold">Nasze menu</h1>
		<c:forEach items="${menuMap}" var="map" varStatus="stat">
		<c:if test="${!empty map.value}">
		<h1 class="text-center mt-5">${map.key.name}</h1>
			<c:forEach items="${map.value}" var="dish" varStatus="stat">
			  <div class="container">
				<div class="row">
				  <div class="col mb-md-2">
					<img class="img-fluid rounded-circle" src="${contextPath}/resources/img/dania/dishPlaceholder.jpg" alt="" />
				  </div>
				  <div class="col-md-8 mb-md-2">
				    <div class="card h-100">	
				     <div class="row">		  
					  <div class="col mb-3 mb-md-0">
					    <div class="card-body text-center">					    	
						  <h3 class="font-weight-bold">	${dish.name}</h3>
					  	  <p><em>${dish.description}</em></p>
					    </div>				  
					  </div>				
					  <div class="col-3 mb-3 mb-md-0">
					    <div class="card-body text-center">
						  <h5 class="font-weight-bold">Cena</h5>
						  <p>${dish.price} zł</p>
					  	</div>
					  </div>
					 </div>
				  	</div>			  
				  </div>			  
				</div>
		  	   </div>
		</c:forEach>
		</c:if>
    </c:forEach>
    </section>
</c:if>

<c:if test="${!empty futureVisits}">

    <section id="about" class="about-section text-center">
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <h2 class="text-white mb-4">Oni już tam będą!</h2>
              </div>
            </div>
          </div>
    </section>

	<c:set var="listSize" value="${fn:length(futureVisits)}"/>
	<c:forEach items="${futureVisits}" var="visit" varStatus="stat">
	  <c:choose>
		<c:when test="${ stat.count == 1 }">
		  <section id="contact" class="contact-section bg-black">
		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center ">
					<p>Użytkownik: ${visit.user.username }</p>
                    <p>Rozpoczęcie: ${visit.start_date }</p>
                    <p>Opis: ${visit.description}</p>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Dołącz!</button>
				  </div>
				</div>
			  </div>
		</c:when>

	    <c:when test="${ stat.count == listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
			<div class="card py-4 h-100">
			  <div class="card-body text-center">
				<p>Użytkownik: ${visit.user.username }</p>
                <p>Rozpoczęcie: ${visit.start_date }</p>
                <p>Opis: ${visit.description}</p>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Dołącz!</button>
			  </div>
			</div>
		  </div>
		</div>
	  </section>
       	</c:when>

		<c:when test="${stat.count % 3 == 0 && stat.count < listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
			<div class="card py-4 h-100">
			  <div class="card-body text-center">
                <p>Użytkownik: ${visit.user.username }</p>
                <p>Rozpoczęcie: ${visit.start_date }</p>
                <p>Opis: ${visit.description}</p>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Dołącz!</button>
			  </div>
			</div>
		  </div>
        </div>
        </section>
        <section id="contact" class="contact-section bg-black">
		<div class="container">
        <div class="row">
        </c:when>

		<c:otherwise>
          <div class="col-md-4 mb-3 mb-md-0">
			<div class="card py-4 h-100">
			  <div class="card-body text-center">
                <p>Użytkownik: ${visit.user.username }</p>
                <p>Rozpoczęcie: ${visit.start_date }</p>
                <p>Opis: ${visit.description}</p>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Dołącz!</button>
			  </div>
			</div>
		  </div>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </c:if>


  
<jsp:include page="contact.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>


