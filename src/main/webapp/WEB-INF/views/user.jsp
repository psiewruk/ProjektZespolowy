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
    
     <!-- About Section -->
    <section id="about" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2 class="text-white mb-10">Przyszłe wizyty</h2>
          </div>
        </div>
      </div>
    </section>
    
<c:if test="${!empty futureVisits}">

	<c:forEach items="${futureVisits}" var="visit" varStatus="stat">
	<section id="contact" class="contact-section bg-black">
				  
		  <div class="container">
			<div class="row">
				<div class="col  mb-5">
				  <div class="card py-4 h-100">
					<h3 class="text-center font-weight-bold">Restauracja</h3> <h2 class="text-center font-weight-bold mb-5">${visit.restaurant.name}</h2>
					<a class="text-center font-weight-bold">Rozpoczęcie:</a><a class="text-center"> ${visit.start_date }</a>
				  </div>
				</div>
				 <div class="col  mb-5">
				  <div class="card py-4 h-100">
					<h2 class="text-center font-weight-bold">Opis</h2> <p class="text-center">${visit.description}</p>
				  </div>
				 </div>
				 <div class="col mb-5">
				  <div class="card py-4 h-100">
				  <div  class="text-center mt-4 mb-5">
					<button class="btn btn-secondary" data-toggle="modal" data-target="#modalEditVisit">
						Edytuj
					</button>	
				  </div>			
				  <div  class="text-center mt-5 mb-3">
					<button class="btn btn-danger" data-toggle="modal" data-target="#modalDeleteVisit">
						Odwołaj
					</button>
				  </div>
					<br></br>
				  </div>
				 </div>
			   <div id="modalEditVisit" class="modal fade" role="dialog">
				  <div class="modal-dialog">
    			  <!-- Modal content-->
    				  <div class="modal-content">
      					  <div class="modal-header">
      					      <a class="modal-title font-weight-bold">Edytuj wizytę</a>
        					  <button type="button" class="close" data-dismiss="modal">&times;</button>
      					  </div>

      					  
      					  <div class="modal-body">
							<form id="${visit.start_date}edit" method="POST" action="user/editVisit">
							  <div class="row">
							  <div class="col-2">
								<p class="mt-3">Od:</p>
								<p class="mt-4">Do:</p>
								<p class="mt-4">Opis:</p>
							  </div>
							  <div class="col-6  mt-2">
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
                        <input type="text" class="form-control"name="newDesc" placeholder="Nowy opis">
							  </div>
								<input type="submit" class="btn btn-primary mr-3" value="Edytuj">

							  </div>
							 </form>

    			  		  </div>
    				  </div>
  				  </div>
			    </div>
			    
			    <div id="modalDeleteVisit" class="modal fade" role="dialog">
				  <div class="modal-dialog">
    			  <!-- Modal content-->
    				  <div class="modal-content">
      					  <div class="modal-header">
        					  <button type="button" class="close" data-dismiss="modal">&times;</button>
      					  </div>
      					  <div class="modal-body">
					<form id="${visit.start_date}delete" method="POST" action="user/deleteVisit">
                        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                        <input type="hidden"  name="visitId" value="${visit.id}"/>
                        		<h3 class="font-weight-bold text-center">Czy na pewno chcesz odwołać wizytę?</h3>
                        <div class="text-center"><input class="btn btn-danger" type="submit" value="Odwołaj"></div>
                    </form>

    			  		  </div>
    				  </div>
  				  </div>
			    </div>
			               
				  </div>
				</div>
		</section>
    </c:forEach>
</c:if>

     <!-- About Section -->
    <section id="about" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2 class="text-white mb-4">Zakończone wizyty</h2>
          </div>
        </div>
      </div>
    </section>

<c:if test="${!empty previousVisits}">
	<c:forEach items="${previousVisits}" var="visit" varStatus="stat">
	<section id="contact" class="contact-section bg-black">

		  <div class="container">
			<div class="row">
				<div class="col  mb-5">
				  <div class="card py-4 h-100">
					<h3 class="text-center font-weight-bold">Restauracja</h3> <h2 class="text-center font-weight-bold mb-5">${visit.restaurant.name}</h2>
					<a class="text-center font-weight-bold">Rozpoczęcie:</a><a class="text-center"> ${visit.start_date }</a>
				  </div>
				</div> 
				<div class="col  mb-5">
				  <div class="card py-4 h-100">
					<h2 class="text-center font-weight-bold">Opis</h2> <p class="text-center">${visit.description}</p>			  
				  </div>
				</div> 
				
								<div class="col  mb-5">
				  <div class="card py-4 h-100">
				  	<div class="text-center mt-5">
						<p class="text-white-50 "><button class="btn btn-secondary" data-toggle="modal" data-target="#modalAddOpinion">
						Dodaj opinie</button>
          	  		</p>
          	  		<div>
				  </div>
				</div> 
				
				

					<br></br>				
			 <div id="modalAddOpinion" class="modal fade" role="dialog">
				  <div class="modal-dialog">
    			  <!-- Modal content-->
    				  <div class="modal-content">
      					  <div class="modal-header">
        					  <a class="modal-title font-weight-bold">Dodaj opinie</a>
        					  <button type="button" class="close" data-dismiss="modal">&times;</button>
      					  </div>
      					  <div class="modal-body">
							 <form id="${visit.start_date}addOpinion" method="POST" action="user/addOpinion">
							  <div class="row">
							  <div class="col-3">
								<p class="mt-3">Ocena:</p>
								<p class="mt-4">Tytuł:</p>
								<p class="mt-4">Opis:</p>
							  </div>
							  <div class="col-5  mt-2">
 					  			   <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
					 			   <input type="hidden" name="opinionId" value="${opinion.id}"/>
					  			   <input type="hidden" name="userId" value="${user.id}"/>
					  			   <input type="hidden" name="restaurantId" value="${visit.restaurant.id}"/>
					 			   <p><input type="number" class="form-control" name="star" min="0" max="10" placeholder="Od 0 do 10"/></p>
					 			   <p><input type="text" class="form-control" name="name" placeholder=""/></p>
					  			   <p><input type="text" class="form-control" name="desc" placeholder=""/></p>
							  </div>
								<input type="submit" class="btn btn-primary mr-3" value="Dodaj">

							  </div>
							  </form>
    			  		  </div>
    				  </div>
  				  </div>
			  </div> 
				  </div>
				</div>
			  </div>
			</div>
		</section>
    </c:forEach>
</c:if>

     <!-- About Section -->
    <section id="about" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2 class="text-white mb-4">Twoje opinie</h2>
          </div>
        </div>
      </div>
    </section>

<c:if test="${!empty listOpinions}">
	<c:forEach items="${listOpinions}" var="opinion" varStatus="stat">
	<section id="contact" class="contact-section bg-black">
	<div class="container">
        <div class="row">
        
        	<div class="col  mb-5">
				<div class="card py-4 h-100">
    				<h3 class="text-center font-weight-bold">Restauracja</h3> <h2 class="text-center font-weight-bold mb-5">${opinion.restaurant.name}</h2>
					<a class="text-center font-weight-bold">Ocena</a><a class="text-center"> ${opinion.star }</a>
				</div>
			</div> 
        
      		<div class="col  mb-5">
		   	     <div class="card py-4 h-100">
    					<h2 class="text-center font-weight-bold">Tytuł: ${opinion.name }</h2> 
    					<p class="text-center font-weight-bold">Opis</p> <p class="text-center">${opinion.description}</p>
				 </div>
			</div> 
        
        
        	<div class="col  mb-5">
				 <div class="card py-4 h-100">
				 	<div class="text-center mt-4 mb-4">
    					<p class="text-white-50 "><button class="btn btn-secondary" data-toggle="modal" data-target="#modalEditOpinion">
							Edytuj</button>
          	  			</p>
          	  		</div>
          	  		<div class="text-center mt-5 mb-3">
                     	<button class="btn btn-danger" data-toggle="modal" data-target="#modalDeleteOpinion">
							Usuń
						</button>
					</div>
				 </div>
			</div>
						              					
			 <div id="modalEditOpinion" class="modal fade" role="dialog">
				  <div class="modal-dialog">
    			  <!-- Modal content-->
    				  <div class="modal-content">
      					  <div class="modal-header">
        					  <a class="modal-title font-weight-bold">Edytuj opinie</a>
        					  <button type="button" class="close" data-dismiss="modal">&times;</button>
      					  </div>
      					  <div class="modal-body">
                      	    <form id="${opinion.name}edit" method="POST" action="user/editOpinion">
							  <div class="row">
							  <div class="col-3">
								<p class="mt-2">Ocena:</p>
								<p class="mt-4">Tytuł:</p>
								<p class="mt-4">Opis:</p>
							  </div>
							  <div class="col-5  mt-2">
 					  			   <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
					 			   <input type="hidden" name="opinionId" value="${opinion.id}"/>
					  			   <input type="hidden" name="userId" value="${user.id}"/>
					  			   <input type="hidden" name="restaurantId" value="${visit.restaurant.id}"/>
					 			   <p><input class="form-control" type="number" name="newStar" min="0" max="10" placeholder="Ocena"/></p>
					 			   <p><input class="form-control" type="text" name="newName" placeholder="Tytuł"></p>
					  			   <p><input class="form-control" type="text" name="newDesc" placeholder="Opis"></p>
							  </div>
								<input type="submit" class="btn btn-primary mr-3" value="Edytuj">
							  </div>
							  </form>
    			  		  </div>
    				  </div>
  				  </div>
			  </div> 
                        
                        
               <div id="modalDeleteOpinion" class="modal fade" role="dialog">
				  <div class="modal-dialog">
    			  <!-- Modal content-->
    				  <div class="modal-content">
      					  <div class="modal-header">
        					  <button type="button" class="close" data-dismiss="modal">&times;</button>
      					  </div>
      					  <div class="modal-body">
                        <form id="${opinion.name}delete" method="POST" action="user/deleteOpinion">
                            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                            <input type="hidden"  name="opinionId" value="${opinion.id}"/>
                            <h3 class="font-weight-bold text-center">Czy na pewno chcesz odwołać wizytę?</h3></br>
                            <div class="text-center"><input class="btn btn-danger"  type="submit" value="Usuń"></div>
                            
                        </form>
    			  		  </div>
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
