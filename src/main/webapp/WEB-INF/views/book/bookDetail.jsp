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
	도서 정보
	<%@ include file="/WEB-INF/views/include/section2.jsp"%>
	
	<div class="container">
		<table class="table" style="text-align: center; vertical-align: middle;">
			<tbody class="detail_body">
				<tr>
					<th style="text-align: center; width: 40%;" rowspan="5">
						<img class="book_image" alt="등록된 이미지가 없습니다." src="/SKHUBooks/resources/bootstrap/images/upload/${list.FILE_NAME }">
					</th>
					<th style="vertical-align : middle;">도서명</th>
					<td style="vertical-align : middle;">${list.BOOK_NAME }</td>
				</tr>
				<tr>
					<th style="vertical-align : middle;">저자</th>
					<td style="vertical-align : middle;">${list.BOOK_AUTHOR }</td>
				</tr>
				<tr>
					<th style="vertical-align : middle;">출판사</th>
					<td style="vertical-align : middle;">${list.BOOK_PUBLISHER }</td>
				</tr>
				<tr>
					<th style="vertical-align : middle;">상태</th>
					<td style="vertical-align : middle;">
						<c:if test="${list.MEMBER_NO == null && list.BOOK_RESERVE == null}">
							<blue style="margin-left: 16%;">대출 가능</blue>
							<button class="btn btn-default pull-right" onclick="book_reserve(${list.BOOK_NO})">예약하기</button>
							<sec:authentication property='principal.username' var="logInID"/>
							<input type="hidden" value="${logInID }" id="logInID">
						</c:if>
						<c:if test="${list.BOOK_RESERVE !=null }">
							<p>예약중</p>
						</c:if>
						<c:if test="${list.MEMBER_NO != null}">
							<red>대출 불가</red>
						</c:if>
					</td>
				</tr>
				<tr>
					<th style="vertical-align : middle;">등록일</th>
					<td style="vertical-align : middle;">${list.BOOK_INSERTDATE }</td>
				</tr>
				<tr>
					<th colspan="3">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<input type="button" class="btn btn-default pull-left" value="수정" onclick="bookUpdate(${list.BOOK_NO })">
<%-- 							<input type="button" class="btn btn-default pull-left" value="삭제" onclick="bookDelete('${list.BOOK_NO }','${list.FILE_NAME }')"> --%>
						</sec:authorize>
						<input type="button" value="글 목록" class="btn btn-default pull-right" onclick="gotoHome()">
					</th>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>