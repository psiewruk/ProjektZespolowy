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
            <h2 class="text-white mb-4">Zaloguj się aby umówić się na spotkanie!</h2>
            <p class="text-white-50">To proste! Zaloguj się do swojego konta aby zorganizować spotkanie :)</p>
          </div>
        </div>
      </div>
    </section>
      <c:if test="${pageContext.request.userPrincipal.name != null}">
    <form:form method="POST" modelAttribute="visitForm" class="form-signin">
        <h2 class="form-signin-heading">Stwórz wizytę</h2>
        <spring:bind path="start_dateString">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="datetime-local" path="start_dateString" class="form-control" placeholder="Start"
                            autofocus="true"></form:input>
                <form:errors path="start_dateString"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="end_dateString">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="datetime-local" path="end_dateString" class="form-control" placeholder="End"></form:input>
                <form:errors path="end_dateString"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="description">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="description" class="form-control" placeholder="Opis"></form:input>
                <form:errors path="description"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Stwórz</button>
    </form:form>
  </c:if>
    
<c:if test="${!empty menuMap}">
	<c:set var="listSize" value="${fn:length(listCategories)}"/>
	<c:forEach items="${menuMap}" var="map" varStatus="stat">
	<section id="contact" class="contact-section bg-black">
	<h1>Menu: ${map.key.name}</h1>
		<c:forEach items="${map.value}" var="dish" varStatus="stat">
		  <div class="container">
			<div class="row">
			  <div class="col-md-4 mb-3 mb-md-0">
				<div class="card py-4 h-100">
				  <img class="img-fluid" src="${contextPath}/resources/img/dania/dishPlaceholder.jpg" alt="" />
				  <div class="card-body text-center">
					<h3>${dish.name}</h3>
					<p>${dish.description}</p>
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</c:forEach>
		</section>
    </c:forEach>
</c:if>

  
<jsp:include page="contact.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>

