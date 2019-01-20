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
    
  	<section id="projects" class="projects-section bg-light">
  	<div class="container">
	  <div class="row align-items-center no-gutters mb-4 mb-lg-5">
        <div class="col-xl-8 col-lg-7">
          <form action="/restauratorForm" method="POST" id="appForm" class="form-signin">
          	<input type="text" name="name" placeholder="Nazwa restauracji"/>
          	<input type="text" name="description" placeholder="Kilka zdań o restauracji">
          	<br>
            <input type="text" name="street" placeholder="Ulica"/>
            <input type="text" name="number" placeholder="Numer budynku/lokalu"/>
            <input type="text" name="postcode" placeholder="Kod pocztowy"/>
            <input type="text" name="city" placeholder="Miasto"/>
            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            <input type="submit" value="Wyślij wniosek"/>
          </form>
          </div>
        <div class="col-xl-4 col-lg-5">
           
          </div>
        </div>
    </div>
    </section>

<jsp:include page="footer.jsp"></jsp:include>
