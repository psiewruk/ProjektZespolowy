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
            <h2 class="text-white mb-4">Wybierz interesującą Cię restaurację!</h2>
            <p class="text-white-50">Śmiało, nie krępuj się :)</p>
          </div>
        </div>
      </div>
    </section>
    
<c:if test="${!empty listRestaurants}">
  	<section id="projects" class="projects-section bg-light">
  	<div class="container">
	<c:forEach items="${listRestaurants}" var="restaurant">
	  <div class="row align-items-center no-gutters mb-4 mb-lg-5">
        <div class="col-xl-8 col-lg-7">
          <a href="/restaurant/${restaurant.name}"><img class="img-fluid mb-3 mb-lg-0" src="${contextPath}/resources/img/${restaurant.name}.jpg" alt=""></a>
          </div>
        <div class="col-xl-4 col-lg-5">
           <a href="/restaurant/${restaurant.name}"> <div class="featured-text text-center text-lg-left">
              <h4>${restaurant.name}</h4>
              <p class="text-black-50 mb-0">${restaurant.description}</p>
            </div></a>
          </div>
        </div>
    </c:forEach>
    </div>
    </section>
</c:if>

<jsp:include page="contact.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
