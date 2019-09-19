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
		<form action="notice" class="searching-form">
			<div class="searchtag">
			    <i class="fa fa-search"></i>
				<input type="text" placeholder="검색 내용" class="form-control" style=" height : 50px; padding-left: 50px" name="keyword">
				<input type="submit" value="검색" class="btn btn-success">
			</div>
		</form>
		<div class="text-center">
			<ul class="paging">
				<c:if test="${pageMaker.prev }">
					<li class="pagingLeftBtn">
						<a href='<c:url value="/notice/notice?keyword=${keyword }&page=${pageMaker.startPage-1 }"/>'></a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<c:choose>
						<c:when test="${idx==pageMaker.cri.page }">
							<li class="active">
								<a href='<c:url value="/notice/notice?keyword=${keyword }&page=${idx }"/>'>${idx }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href='<c:url value="/notice/notice?keyword=${keyword }&page=${idx }"/>'>${idx }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="pagingRightBtn">
	        			<a href='<c:url value="/notice/notice?keyword=${keyword }&page=${pageMaker.endPage+1 }"/>'></a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
<script type="text/javascript">
function noticeDetail(notice_no){
	location.href="/SOWLBOOKS/notice/noticeDetail?notice_no="+notice_no;
}
</script>
</html>