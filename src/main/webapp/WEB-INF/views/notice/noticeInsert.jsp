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
		<form action="noticeInsertDo" encType="multiplart/form-data">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">제&nbsp;&nbsp;목</th>
						<td>
							<input type="text" name="notice_title" class="form-control" placeholder="제목을 입력하세요." required="required">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">작성자</th>
						<td class="form-control">
							<sec:authentication property="principal.username"/>
							<input class="form-control" type="hidden" name="notice_writer" readonly="readonly" value="&nbsp;<sec:authentication property="principal.username"/>">
						</td>
						
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">내&nbsp;&nbsp;용</th>
						<td><textarea class="form-control" name="notice_content" id="editor" style="height: 205px;" required="required"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn btn-default pull-rigth">
							<input type="reset" class="btn btn-default pull-rigth">	
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
	if(confirm("작성을 종료하고 목록으로 돌아가시겠습니까?")){
		location.href="/SOWLBOOKS/notice/notice";
	}
}
</script>
</html>