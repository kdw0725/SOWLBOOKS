<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<sec:authorize access="isAnonymous()">
	<h5><a href="/SOWLBOOKS/member/logIn">LOGIN</a>로그인</h5>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.username"/>님, 반갑습니다.
	<form action="/SOWLBOOKS/member/logOut" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">LOGOUT</button>
	</form>
</sec:authorize>

</body>
</html>
