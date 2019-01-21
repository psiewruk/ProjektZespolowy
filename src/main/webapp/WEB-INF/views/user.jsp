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
            <h2 class="text-white mb-4">Twoje wizyty:</h2>
          </div>
        </div>
      </div>
    </section>
    
<c:if test="${!empty listVisits}">
	<c:forEach items="${listVisits}" var="visit" varStatus="stat">
	<section id="contact" class="contact-section bg-black">

		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center">
					<h3>Restauracja: ${visit.restaurant.name}</h3>
					<p>Rozpoczęcie: ${visit.start_date }</p>
					<p>Opis: ${visit.description}</p>
					<button onclick='hideForm("${visit.start_date}addOpinion")'>Dodaj opinię</button>
					<button onclick='hideForm("${visit.start_date}edit")'>Edytuj</button>
					<button onclick='hideForm("${visit.start_date}delete")'>Usuń</button>
					<br></br>
					<form id="${visit.start_date}addOpinion" method="POST" action="user/addOpinion" style="display:none">
					    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
					    <input type="hidden" name="opinionId" value="${opinion.id}"/>
					    <input type="hidden" name="userId" value="${user.id}"/>
					    <input type="hidden" name="restaurantId" value="${visit.restaurant.id}"/>
					    <input type="number" name="star" min="0" max="10" placeholder="Ocena"/>
					    <input type="text" name="name" placeholder="Tytuł"/>
					    <input type="text" name="desc" placeholder="Opis"/>
					    <input type="submit" value="Dodaj opinię">
					</form>
					<form id="${visit.start_date}edit" method="POST" action="user/editVisit" style="display:none">
					    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                        <input type="hidden"  name="visitId" value="${visit.id}"/>
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <input type="datetime-local" name="start_dateString" class="form-control" placeholder="Start" autofocus="true"></input>
                            <errors path="start_dateString"><errors>
                        </div>
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <input type="datetime-local" name="end_dateString" class="form-control" placeholder="End"></input>
                            <errors path="end_dateString"></errors>
                        </div>
                        <input type="text" name="newDesc" placeholder="Nowy opis">
                        <input type="submit" value="Edytuj">
					</form>
					<form id="${visit.start_date}delete" method="POST" action="user/deleteVisit" style="display:none">
                        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                        <input type="hidden"  name="visitId" value="${visit.id}"/>
                        Jesteś pewny? <input type="submit" value="Usuń">
                    </form>
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</section>
    </c:forEach>
</c:if>

<c:if test="${!empty listOpinions}">
	<c:forEach items="${listOpinions}" var="opinion" varStatus="stat">
	<section id="contact" class="contact-section bg-black">
	<h1>Twoje opinie:</h1>
	<div class="container">
        <div class="row">
    	    <div class="col-md-4 mb-3 mb-md-0">
    		    <div class="card py-4 h-100">
    			    <div class="card-body text-center">
    					<h3>Restauracja: ${opinion.restaurant.name}</h3>
    					<p>Ocena: ${opinion.star }</p>
    					<p>Tytuł: ${opinion.name }</p>
    					<p>Opis: ${opinion.description}</p>
    					<button onclick='hideForm("${opinion.name}edit")'>Edytuj</button>
                        <button onclick='hideForm("${opinion.name}delete")'>Usuń</button>
                        <form id="${opinion.name}edit" method="POST" action="user/editOpinion" style="display:none">
                            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                            <input type="hidden"  name="opinionId" value="${opinion.id}"/>
                            <input type="number" name="newStar" min="0" max="10" placeholder="Nowa ocena"/>
                            <input type="text" name="newName" placeholder="Nowy tytuł">
                            <input type="text" name="newDesc" placeholder="Nowy opis">
                            <input type="submit" value="Edytuj">
                        </form>
                        <form id="${opinion.name}delete" method="POST" action="user/deleteOpinion" style="display:none">
                            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                            <input type="hidden"  name="opinionId" value="${opinion.id}"/>
                            Jesteś pewny? <input type="submit" value="Usuń">
                        </form>
				    </div>
		        </div>
	        </div>
        </div>
    </div>
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
