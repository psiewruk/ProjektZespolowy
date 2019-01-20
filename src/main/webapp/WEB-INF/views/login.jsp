<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="navPage.jsp"></jsp:include>

    <title>Zaloguj się do swojego konta!</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>


<div class="container">
    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-signin-heading">Zaloguj sie</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" class="form-control" placeholder="Nazwa"/>
            <input name="password" type="password" class="form-control" placeholder="Hasło"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Zaloguj!</button><br>
            <h4 class="text-center"><a href="${contextPath}/registration">Stworz konto</a></h4>
        </div>

    </form>

</div>
<jsp:include page="contact.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
