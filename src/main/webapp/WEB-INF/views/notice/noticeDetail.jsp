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
		<table border = 1px class="table table-bordered">
			<tbody>
				<tr>
					<th style=" width: 100px; text-align: center;vertical-align: middle;">제&nbsp;&nbsp;목</th>
					<td class="form-control">
						${list.notice_title }
						<input type="hidden" value="${list.notice_no }">
					</td>
				</tr>
				<tr >
					<th style=" width: 100px; text-align: center;vertical-align: middle;">작성자</th>
					<td class="form-control" colspan = "2">${list.notice_writer } </td>
				</tr>
				<tr >
					<th style=" width: 100px; text-align: center;vertical-align: middle;">작성일</th>
					<td class="form-control" colspan = "2">${list.notice_insertdate } </td>
				</tr>
				<tr>
					<th style=" width: 100px; text-align: center;vertical-align: middle;">내&nbsp;&nbsp;용</th>
					<td class="form-control" style="height: 205px;">${list.notice_content }</td>
				</tr>
				<tr>
					<td colspan = "2">						
<%-- 						<sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
							<input type="button" class="btn btn-default pull-rigth" onclick="noticeUpdate(${list.notice_no })" value="수정">
							<input type="button" class="btn btn-default pull-rigth" onclick="noticeDelete(${list.notice_no })" value="삭제">
<%-- 						</sec:authorize> --%>
						<input type="button" value="글 목록" class="btn btn-default pull-right" onclick="gotoHome()">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
function noticeUpdate(notice_no){
	location.href="/SOWLBOOKS/notice/noticeUpdate?notice_no="+notice_no;
}

function noticeDelete(notice_no){
	if(confirm("공지를 삭제하시겠습니까?")){
		location.href="/SOWLBOOKS/notice/noticeDelete?notice_no="+notice_no;
	}
}

function gotoHome(){
	location.href="/SOWLBOOKS/notice/notice";
}
</script>
</html>