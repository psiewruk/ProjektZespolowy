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
    
<c:if test="${!empty listVisits}">
	<c:forEach items="${listVisits}" var="visit" varStatus="stat">
	<section id="contact" class="contact-section bg-black">
	<h1>Twoje wizyty:</h1>

		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <img class="img-fluid" src="${contextPath}/resources/img/dania/dishPlaceholder.jpg" alt="" />
				  <div class="card-body text-center">
					<h3>Restauracja: ${visit.restaurant.name}</h3>
					<p>Rozpoczęcie: ${visit.start_date }</p>
					<p>Opis: ${visit.description}</p>
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
