<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/SOWLBOOKS/login" method="post">
		<input required="required" type="text" name="member_id"><br>
		<input required="required" type="password" name="member_pw"><br>
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">

		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
		    <font color="red">
		         ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
		    </font>
		</c:if>
		
		<button type="submit">로그인</button>
	</form>
</body>
</html>