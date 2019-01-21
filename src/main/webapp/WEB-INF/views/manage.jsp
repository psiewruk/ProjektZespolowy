<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="navPage.jsp"></jsp:include>
    
     <!-- About Section -->
    <section id="about" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
          	<c:if test="${!empty restaurant}">
          	  <h2 class="text-white mb-4">Panel zarządzania restauracją </h2>
          	  <h1 class="text-white mb-4">${restaurant.name}</h1>
          	  <p class="text-white-50"><button class="btn btn-primary js-scroll-trigger" data-toggle="modal" data-target="#modalAddMenu" onclick='hideForm("addMenu")'>
				Dodaj menu</button>
          	  </p>
          	  <!-- Modal -->
			  <div id="modalAddMenu" class="modal fade" role="dialog">
				  <div class="modal-dialog">
    			  <!-- Modal content-->
    				  <div class="modal-content">
      					  <div class="modal-header">
        					  <a class="modal-title">Podaj nazwe nowego menu</a>
        					  <button type="button" class="close" data-dismiss="modal">&times;</button>
      					  </div>
      					  <div class="modal-body">
							  <form id="addMenu" method="POST" action="manage/addMenu" style="display:none;">
            					  <input type="text" name="menuName">
								  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								  <input type="submit" class="btn btn-primary js-scroll-trigger"  value="Dodaj">
							  </form>
    			  		  </div>
    				  </div>
  				  </div>
			  </div> 
			</c:if>
    	    <c:if test="${empty restaurant}">
    	      <h2 class="text-white mb-4">Nie ma restauracji powiązanej z tym kontem. Skontaktuj się z administratorem.</h2>
    	    </c:if>
		  </div>
        </div>
  	  </div>
    </section>

	<c:if test="${!empty menuMap}">
	<section id="contact" class="contact-section bg-black">
	<h1 class="text-center" style=font-size:75px>Lista twoich menu</h1>
	  <c:forEach items="${menuMap}" var="map" varStatus="stat">

		  <div class="text-center"><h1>${map.key.name}</h1>
	 		<div class="row">
			 <div class="col-8">
			  <button onclick='hideForm("${map.key.name}edit")' class="btn btn-secondary " type="button" data-toggle="collapse" data-target="#collapseNewName" aria-expanded="false" aria-controls="collapseNewName">
    			Zmien nazwe
  			  </button>
			  <button onclick='hideForm("${map.key.name}add")' class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#collapseNewDish" aria-expanded="false" aria-controls="collapseNewDish">
    			Dodaj danie
  			  </button>
			 </div>
 			 <div class="col">
			   <form id="${map.key.name}del" method="POST" action="manage/deleteMenu">
				 <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
			  	 <input type="hidden"  name="menuId" value="${map.key.id}"/>
				 <input type="submit" class="btn btn-danger" value="Usuń menu">
			   </form>		
	 		 </div>
			</div>
		 </div>
	
	<div class="collapse text-center" id="collapseNewName">	
	  <div class="card card-head">Zmien nazwe</div>
	  <div class="card card-body">
  		<form id="${map.key.name}edit" method="POST" action="manage/editMenu" style="display:none">
		  <input type="text" name="newName" placeholder="Nowa nazwa"/>
		  <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		  <input type="hidden"  name="menuId" value="${map.key.id}"/>
		  <input type="submit">
		</form>
  	  </div>
	</div>
	
	<div class="collapse text-center" id="collapseNewDish">	
		<div class="card card-body">
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
  		</div>
	</div>
	
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
				  <div class="row">
					<div class="col">
						<h3 class="font-weight-bold">	${dish.name}</h3>
					  	<p><em>${dish.description}</em></p>
					</div>
				  </div>
				  <div class="row">
				  	<div class="col">
					  <button onclick='hideForm("${dish.name}edit")'>Edit</button>
					</div>
					<div class="col">
					  <form id="${map.key.name}del" method="POST" action="manage/deleteDish">
						<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
						<input type="hidden"  name="dishId" value="${dish.id}"/>
						<input type="submit" value="Usuń">
					  </form>
					</div>
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
			  <div class="col-2 mb-3 mb-md-0">
				<div class="card-body text-center">
				  <h5 class="font-weight-bold">Cena</h5>
				  <p>${dish.price}</p>
			  	</div>
			  </div>
			 </div>
		  	</div>			  
		  </div>			  
		</div>
  	   </div>
	</c:forEach>
    </c:forEach>
    </section>
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
