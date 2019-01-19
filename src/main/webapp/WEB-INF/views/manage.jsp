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
            <h2 class="text-white mb-4">Panel zarządzania restauracją ${restaurant.name}</h2>
            <p class="text-white-50"></p>
          </div>
        </div>
      </div>
    </section>
    
    
    
<c:if test="${!empty menuMap}">
	<c:forEach items="${menuMap}" var="map" varStatus="stat">
	<section id="contact" class="contact-section bg-black">
	<h1>Menu: ${map.key.name} - <button onclick='hideForm("${map.key.name}")'>Edit</button></h1>
	<form id="${map.key.name}" method="POST" action="manage/editMenu" style="display:none">
		<input type="text" name="newName" placeholder="Nowa nazwa"/>
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
					<button onclick='hideForm("${dish.name}")'>Edit</button>
				  </div>
				  <form id="${dish.name}" method="POST" action="manage/editDish" style="display:none">
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
