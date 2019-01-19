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
            <h2 class="text-white mb-4">Na co masz ochotę?</h2>
            <p class="text-white-50">Po wybraniu interesującego Cię dania poprostu kliknij je! ;)</p>
          </div>
        </div>
      </div>
    </section>
    
<c:if test="${!empty listCategories}">
	<c:set var="listSize" value="${fn:length(listCategories)}"/>
	<c:forEach items="${listCategories}" var="category" varStatus="stat">
	  <c:choose>
		<c:when test="${ stat.count == 1 }">
		  <section id="contact" class="contact-section bg-black">
		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <div class="card-body text-center">
					<a href="/restaurants/${category.name}"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/${category.name}.jpg" alt="" /></a>
				  </div>
				</div>
			  </div>
		</c:when>

	    <c:when test="${ stat.count == listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
			<div class="card py-4 h-100">
			  <div class="card-body text-center">
				<a href="/restaurants/${category.name}"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/${category.name}.jpg" alt="" /></a>
			  </div>
			</div>
		  </div>
		</div>
	  </section>           
       	</c:when>	

		<c:when test="${stat.count % 3 == 0 && stat.count < listSize }">
          <div class="col-md-4 mb-3 mb-md-0">
			<div class="card py-4 h-100">
			  <div class="card-body text-center">
				<a href="/restaurants/${category.name}"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/${category.name}.jpg" alt="" /></a>
			  </div>
			</div>
		  </div>
        </div>
        </section>
        <section id="contact" class="contact-section bg-black">
		<div class="container">
        <div class="row">
        </c:when>
                
		<c:otherwise>
          <div class="col-md-4 mb-3 mb-md-0">
			<div class="card py-4 h-100">
			  <div class="card-body text-center">
				<a href="/restaurants/${category.name}"><img class="img-fluid" src="${contextPath}/resources/img/kategorie/${category.name}.jpg" alt="" /></a>
			  </div>
			</div>
		  </div>
        </c:otherwise>
      </c:choose>
    </c:forEach>
</c:if>

<jsp:include page="footer.jsp"></jsp:include>
