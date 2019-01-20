<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

    <jsp:include page="navPage.jsp"></jsp:include>

    <!-- Header -->
    <header class="masthead">
      <div class="container d-flex h-100 align-items-center" >
        <div class="mx-auto text-center">
        
          <h1 class="mx-auto my-0 text-uppercase">Czas coś zjeść?</h1>
          <h2 class="text-white-50 mx-auto mt-2 mb-5">Kliknij przycisk poniżej aby zacząć swą przygodę!</h2>
          <a href="${contextPath}/category" class="btn btn-primary js-scroll-trigger">Zaczynajmy</a>
        </div>
      </div>
    </header>

    <!-- About Section -->
    <section id="about" class="about-section text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2 class="text-white mb-4">O co chodzi?</h2>
            <p class="text-white-50">Szukaj restauracji pod kątem kategorii jedzenia. Lubisz pizze? Znajduj restauracje, które oferują takie menu!</p>
          </div>
        </div>
      </div>
    </section>


    <!-- Projects Section -->
    <section id="projects" class="projects-section bg-light">
      <div class="container">

        <!-- Project One Row -->
        <div class="row justify-content-center no-gutters mb-5 mb-lg-0">
          <div class="col-lg-6">
            <img class="img-fluid" src="${contextPath}/resources/img/IphoneAppStore.png" alt="">
          </div>
          <div class="col-lg-6">
            <div class="bg-black text-center h-100 project">
              <div class="d-flex h-100">
                <div class="project-text w-100 my-auto text-center text-lg-left">
                  <h4 class="text-white">Aplikacja FoodTalk</h4>
                  <p class="mb-0 text-white-50">Już niedługo również na telefonach i pozostałych urządzeniach mobilnych!</p>
                  <hr class="d-none d-lg-block mb-0 ml-0">
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Project Two Row -->
        <div class="row justify-content-center no-gutters">
          <div class="col-lg-6">
            <img class="img-fluid" src="${contextPath}/resources/img/promocja.png" alt="">
          </div>
          <div class="col-lg-6 order-lg-first">
            <div class="bg-black text-center h-100 project">
              <div class="d-flex h-100">
                <div class="project-text w-100 my-auto text-center text-lg-right">
                  <h4 class="text-white">Promocje</h4>
                  <p class="mb-0 text-white-50">U nas zawsze znajdziesz najlepsze promocje na jedzenie, które Ciebie interesuje! Nie czekaj i zacznij szukać już teraz!</p>
                  <hr class="d-none d-lg-block mb-0 mr-0">
                </div>
              </div>
            </div>
          </div>
        </div>

		<!-- Project Three Row -->
        <div class="row justify-content-center no-gutters mb-5 mb-lg-0">
          <div class="col-lg-6">
            <img class="img-fluid" src="${contextPath}/resources/img/polecamy.png" alt="">
          </div>
          <div class="col-lg-6">
            <div class="bg-black text-center h-100 project">
              <div class="d-flex h-100">
                <div class="project-text w-100 my-auto text-center text-lg-left">
                  <h4 class="text-white">Nasza opinia!</h4>
                  <p class="mb-0 text-white-50">Gorąco polecamy jedzenia na mieście! Znajdź potrawę, która Ciebie interesuje i umów się na tajemnicze spotkanie z nieznajomym! Sami testowaliśmy! FoodTalk > Tinder!</p>
                  <hr class="d-none d-lg-block mb-0 ml-0">
                </div>
              </div>
            </div>
          </div>
        </div>
		
      </div>
    </section>

<jsp:include page="contact.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
