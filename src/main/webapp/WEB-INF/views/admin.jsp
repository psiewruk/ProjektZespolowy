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
            <h2 class="text-white mb-4">Panel admina</h2>
            <p class="text-white-50"><button onclick='hideForm("addCategory")'>Dodaj kategorię</button>
            <form id="addCategory" method="POST" action="admin/addCategory" style="display:none;">
            	<input type="text" name="categoryName">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="submit" value="Dodaj">
			</form>
            </p>
            <p class="text-white-50"><button onclick='hideForm("addRestaurant")'>Dodaj restaurację</button>
            <form id="addRestaurant" method="POST" action="admin/addRestaurant" style="display:none;">
                <input type="text" name="restaurantName" placeholder="Nazwa">
                <input type="text" name="desc" placeholder="Opis">
                <br>Adres: </br>
                <input type="text" name="street" placeholder="Ulica">
                <input type="text" name="number" placeholder="Numer">
                <input type="text" name="code" placeholder="Kod pocztowy">
                <input type="text" name="city" placeholder="Miasto">
                <br>Restaurator: </br>
                <input type="text" name="username" placeholder="Restaurator">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            	<input type="submit" value="Dodaj">
            </form>
          </div>
        </div>
      </div>
    </section>

<c:if test="${!empty listCategories}">
    <h2 class="text-black mb-4">Kategorie</h2>
    <c:set var="listSize" value="${fn:length(listCategories)}"/>
    <c:forEach items="${listCategories}" var="category" varStatus="stat">
    <section id="contact" class="contact-section bg-black">
    	<h1>Kategoria: ${category.name}
    	<button onclick='hideForm("${category}edit")'>Edytuj</button>
    	<button onclick='hideForm("${category}delete")'>Usuń</button>
    	<form id="${category}edit" method="POST" action="admin/editCategory" style="display:none">
        	<input type="text" name="newName" placeholder="Nowa nazwa"/>
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	<input type="submit">
        </form>
        <form id="${category}delete" method="POST" action="admin/deleteCategory" style="display:none">
        	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        	<input type="hidden"  name="categoryId" value="${category.id}"/>
        	Jesteś pewny? <input type="submit" value="Usuń">
        </form>
    </c:forEach>

    <h2 class="text-white mb-4">Restauracje</h2>

    <c:set var="listSize" value="${fn:length(listRestaurants)}"/>
    <c:forEach items="${listRestaurants}" var="restaurant" varStatus="stat">
    <section id="contact" class="contact-section bg-black">
        	<h1>Restauracja: ${restaurant.name}
        	<button onclick='hideForm("${restaurant}edit")'>Edytuj</button>
        	<button onclick='hideForm("${restaurant}delete")'>Usuń</button>
        	<form id="${restaurant}edit" method="POST" action="admin/editRestaurant" style="display:none">
            	<input type="text" name="newName" placeholder="Nowa nazwa"/>
                <input type="text" name="newDesc" placeholder="Opis">
                <br>Adres: </br>
                <input type="text" name="newStreet" placeholder="Ulica">
                <input type="text" name="newNumber" placeholder="Numer">
                <input type="text" name="newCode" placeholder="Kod pocztowy">
                <input type="text" name="newCity" placeholder="Miasto">
            	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            	<input type="hidden"  name="restaurantId" value="${restaurant.id}"/>
            	<input type="submit">
            </form>
            <form id="${restaurant}delete" method="POST" action="admin/deleteRestaurant" style="display:none">
                <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                <input type="hidden"  name="restaurantId" value="${restaurant.id}"/>
                Jesteś pewny? <input type="submit" value="Usuń">
            </form>
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
