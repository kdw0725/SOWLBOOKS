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
	도서등록
	<%@ include file="/WEB-INF/views/include/section2.jsp"%>
	
	<div class="container" style="margin-top: 50px; width : 70%">
		<form action="bookInsertDo" encType="multipart/form-data" method="post">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">도서명</th>
						<td>
							<input class="form-control" type="text" required="required" placeholder="도서의 제목을 입력하세요." name="book_name">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">저자</th>
						<td>
							<input class="form-control" type="text" required="required" placeholder="저자를 입력하세요." name="book_author">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">출판사</th>
						<td>
							<input class="form-control" type="text" required="required" placeholder="출판사를 입려하세요" name="book_publisher">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">도서 이미지</th>	
						<td>
							<div class="filebox">
								<label for="ex_file" class="btn btn-default" style="width : 10%;">파일 선택</label>
								<input class="form-control" disabled="disabled" placeholder="선택된 파일 없음" style="width: 89%;">
								<input style="width:100%;" type="file" class="upload-hidden" id="ex_file" name="book_img" accept="image/*">
							</div>
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">도서 번호</th>
						<td>
							<input class="form-control" type="number" required="required" placeholder="도서 번호를 입력하세요" name="book_no">
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="submit" class="btn btn-default pull-left">
							<input type="reset" class="btn btn-default pull-left">
							<input type="button" class="btn btn-default pull-right" value="목록" onclick="gotoList()">
						</td>
					</tr>
					
								
				</tbody>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
function gotoList(){
	location.href="/SOWLBOOKS/book/bookList"
}
</script>
</html>