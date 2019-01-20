<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

   <jsp:include page="navPage.jsp"></jsp:include>

    
     <!-- About Section -->
    <section id="about" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2 class="text-white mb-4">Na co masz ochotę?</h2>
            <p class="text-white-50">Po wybraniu interesującego Ciebie dania poprostu kliknij je! ;)</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Category menu one -->
    <section id="contact" class="contact-section bg-black">
      <div class="container">

        <div class="row">
          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
           <a href="${contextPath}/restaurantBurger"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/burgery.jpg" alt=""></a>
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantPizza"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/pizze.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantKebab"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/kebaby.jpg" alt="">
              </div>
            </div>
          </div>
      </div>
    </section>

	<!-- Category menu two -->
    <section id="contact" class="contact-section bg-black">
      <div class="container">

        <div class="row">
          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantTortilla"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/Tortilla.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantLasagne"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/lasagne.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantMakaron"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/makaron.jpg" alt="">
              </div>
            </div>
          </div>
      </div>
    </section>

    <!-- Category menu three -->
    <section id="contact" class="contact-section bg-black">
      <div class="container">

        <div class="row">
          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantSalatki"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/salatki.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantKanapki"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/kanapki.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantSushi"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/sushi.jpg" alt="">
              </div>
            </div>
          </div>
      </div>
    </section>
    
        <!-- Category menu four -->
    <section id="contact" class="contact-section bg-black">
      <div class="container">

        <div class="row">
          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantPierogi"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/pierogi.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantNalesniki"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/nalesniki.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="col-md-4 mb-3 mb-md-0">
            <div class="card py-4 h-100">
              <div class="card-body text-center">
            <a href="${contextPath}/restaurantZupy"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/zupy.jpg" alt="">
              </div>
            </div>
          </div>
      </div>
    </section>

<jsp:include page="contact.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
