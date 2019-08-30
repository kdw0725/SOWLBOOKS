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
		<form action="noticeUpdateDo" encType="multiplart/form-data">
		<input type="hidden" value="${list.notice_no }" name="notice_no">
			<table class=" table table-bordered">
				<tbody>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">제목</th>
						<td>
							<input type="text" value="${list.notice_title }" class="form-control" name="notice_title" placeholder="제목을 입력하세요." required="required">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">작성자</th>
						<td class="form-control">
							<sec:authentication property="principal.username"/>
							<input class="form-control" type="hidden" name="notice_writer" readonly="readonly" value="<sec:authentication property="principal.username"/>">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">내용</th>
						<td>
							<textarea class="form-control" name="notice_content" id="editor" style="height: 205px;" required="required">${list.notice_content }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn btn-default pull-rigth" value="수정 완료">
							<input type="button" class="btn btn-default pull-rigth" value="수정 취소" onclick="cancelUpdate(${list.notice_no})">
							<input type="button" value="글 목록" class="btn btn-default pull-right" onclick="gotoHome()">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>
<script type="text/javascript">
function gotoHome(){
	if(confirm("수정을 취소하고 글 목록으로 돌아가시겠습니가?")){
		location.href="/SOWLBOOKS/notice/notice";
	}
}
function cancelUpdate(notice_no){
	location.href="/SOWLBOOKS/notice/noticeDetail?notice_no="+notice_no;
}
</script>
</html>