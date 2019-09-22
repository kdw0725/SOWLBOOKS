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
	도서 검색
	<%@ include file="/WEB-INF/views/include/section2.jsp"%>
	<div class="container" style="width : 70%; margin-top: 50px;">
		<table class="table table-striped" style="text-align: center">
			<caption><b>"${keyword }"</b>에 대한 검색 결과입니다.</caption>
			<tr>
				<th>NO</th>
				<th style="text-align: center; width : 20%;">사진</th>
				<th style="text-align: center; width : 40%;">제목</th>
				<th style="text-align: center">저자</th>
				<th style="text-align: center">출판사</th>
				<th style="text-align: center">대출 가능</th>
			</tr>
			<c:forEach var="list" varStatus="i" items="${list}">
		 	<tr onclick="noticeDetail(${list.book_no})" style="vertical-align: middle;">
			 	<th scope="row" style="vertical-align : middle;">${list.no }</th>
			 		<td style="height : 100px; width : 20%;' vertical-align: middle; text-align: center;">
						<img class="file_img" alt="등록된 이미지가 없습니다.">
					</td>
					<td style="vertical-align : middle;"><a>${list.book_name }</a></td>
					<td style="vertical-align : middle;">${list.book_author }</td>
					<td style="vertical-align : middle;">${list.book_publisher }</td>
					<td style="vertical-align : middle;">대출 가능한가요</td>
				</tr>
			</c:forEach>
		</table>
		<div class="text-center">
			<ul class="paging">
				<c:if test="${pageMaker.prev }">
					<li class="pagingLeftBtn">
						<a href='<c:url value="/book/bookList?keyword=${keyword }&page=${pageMaker.startPage-1 }"/>'></a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<c:choose>
						<c:when test="${idx==pageMaker.cri.page }">
							<li class="active">
								<a href='<c:url value="/book/bookList?keyword=${keyword }&page=${idx }"/>'>${idx }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href='<c:url value="/book/bookList?keyword=${keyword }&page=${idx }"/>'>${idx }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="pagingRightBtn">
	        			<a href='<c:url value="/book/bookList?keyword=${keyword }&page=${pageMaker.endPage+1 }"/>'></a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>