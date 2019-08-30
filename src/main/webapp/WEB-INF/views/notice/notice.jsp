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
	공지사항
	<%@ include file="/WEB-INF/views/include/section2.jsp"%>
	<div class="container" style="width : 70%; margin-top: 50px;">
		<table class="table table-striped" style="text-align: center">
			<tr>
				<th>NO</th>
				<th style="text-align: center; width : 40%;">제목</th>
				<th style="text-align: center">작성자</th>
				<th style="text-align: center">작성일</th>
			</tr>
			<c:forEach var="list" varStatus="i" items="${list}">
		 	<tr onclick="noticeDetail(${list.notice_no})">
			 	<th scope="row">${list.no }</th>
					<td><a>${list.notice_title }</a></td>
					<td>${list.notice_writer }</td>
					<td>${list.notice_insertdate }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
<script type="text/javascript">
function noticeDetail(notice_no){
	location.href="/SOWLBOOKS/notice/noticeDetail?notice_no="+notice_no;
}
</script>
</html>