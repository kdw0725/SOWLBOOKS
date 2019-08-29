<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<title>SOWLBOOKS</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/navigation.jsp"%>
	<%@ include file="/WEB-INF/views/include/section1.jsp"%>
	로그인
	<%@ include file="/WEB-INF/views/include/section2.jsp"%>
	<div class="container" style="width : 30%; margin-top: 50px;">
		<form action="/SOWLBOOKS/login" method="post">
			<input required="required" type="text" name="member_id" class="form-control" placeholder="아이디"><br>
			<input required="required" type="password" name="member_pw" class="form-control" placeholder="비밀번호"><br>
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
	
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
			    <font color="red">
			         ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
			        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
			    </font>
			</c:if>
			<div class="logInArea">
				<div class="loginSaveBtn">
		  	  		<input type="checkbox" name="_spring_security_remember_me" value="1" class="pull-left"/>　
		 			<label>로그인 저장</label>
		 		</div>
		 		<div class="logInBtn">
					<input type="submit" value="logIn" class="btn btn-default pull-right"><br>
				</div>
			</div>
			<br>
			<hr>
			<p class="message" style="text-align : center;">계정이 없으신가요?&nbsp;&nbsp;<a href="/SOWLBOOKS/member/signIn">회원가입</a></p>		
		</form>
	</div>
</body>
</html>