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
	회원가입
	<%@ include file="/WEB-INF/views/include/section2.jsp"%>
	
	<div class="container" style="width : 40%; padding-top: 50px;" >
		<form action="signInDo" method="POST" id="signInForm">
			<div class="form-group" style="position: relative;">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input required="required" type="number" class="form-control" placeholder="학번" name="member_no" id="member_no">
				<button type="button" class="btn btn-default pull-right" id="noCheck">중복 확인</button>
			</div>
			<div class="form-group">
				<input required="required" type="text" class="form-control" placeholder="이름" name="member_name">
			</div>
			<div class="form-group" style="position: relative;">
				<input required="required" type="text" class="form-control" placeholder="아이디" name="member_id" id="member_id">
				<button type="button" class="btn btn-default pull-right" id="idCheck">중복 확인</button>
			</div>
			<div class="form-group">
				<input required="required" type="password" class="form-control" placeholder="비밀번호" name="member_pw" id="member_pw" style="width:47%; float:left; margin-right: 3%; margin-bottom: 15px;">
				<input required="required" type="password" class="form-control" placeholder="비밀번호 확인" id="member_pwck" style="width:47%; float:right; margin-left: 3%">
				<div id="pwcheck" class="form-group text-left">
				</div>
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" placeholder="이메일" name="member_email" required="required">
			</div>
			<hr>
			<div class="form-group">
				<input type="checkbox" id="terms">
				<a href="#">이용약관</a>을 확인하였으며 이에 동의합니다.
			</div>
			<hr>
			<div class="form-group text-center">
		        <button type="button" id="join-submit" class="btn btn-primary">회원가입<i class="fa fa-check spaceLeft"></i></button>
		        <button type="button" class="btn btn-warning" onclick="gotohome()">가입취소<i class="fa fa-times spaceLeft"></i></button>
		    </div>
			
			
		</form>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	var noChecked = 0;
	var idChecked = 0;
	var passChecked = 0;
	var termChecked = 0;
	
	$("#noCheck").unbind("click").click(function(e){
		e.preventDefault();
		var member_no = $("#member_no").val();
		var memberData = {"member_no" : member_no};
		if(member_no.length < 1){
			alert("학번을 입력해주세요.");
		}
		else if(member_no.length == 9){
			$.ajax({
				type : "POST",
				url : "/SOWLBOOKS/member/checkNo",
				data : memberData,
				dataType : "json",
				beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result == 0){
						alert("사용 가능한 학번 입니다.");
						noChecked = 1;
					}
					else if(result == 1){
						alert("이미 가입된 학번 입니다.");
						noChecked = 0;
					}
					else{
						alert("오류가 발생하였습니다.\n관리자에게 문의하여주세요.");
						noChecked = 0;
					}
				},
				error : function(error){
					alert("서버가 응답하지 않습니다.\n다시 시도해 주시기 바랍니다.");
				}
			})
		}
		else{
			alert("학번은 9자리로 입력해주시기 바랍니다.");
		}
		
	});
	
	$("#idCheck").unbind("click").click(function(e){
		e.preventDefault();
		var member_id = $("#member_id").val();
		var memberData = {"#member_id" : member_id};
		if(member_id.length < 1){
			alert("아이디를 입력해 주세요.");
		}
		else if(member_id.length > 3 && member_id.length < 14){
			$.ajax({
				type : "POST",
				url : "/SOWLBOOKS/member/checkId",
				data : memberData,
				dataType : "json",
				beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result == 0){
						alert("사용 가능한 아이디 입니다.");
						idChecked = 1;
					}
					else if(result == 1){
						alert("이미 사용중인 아이디 입니다.\n다른 아이디를 사용하여 주세요.");
						idChecked = 0;
					}
					else{
						alert("오류가 발생하였습니다.\n관리자에게 문의하여주세요.");
						idChecked = 0;
					}
				},
				error : function(error){
					alert("서버가 응답하지 않습니다.\n다시 시도해 주시기 바랍니다.");
				}
			})
		}
		else{
			alert("아이디는 4~13자리로 입력해주시기 바랍니다.");
		}
		
	});
	
	$("#member_pw").keyup(function(event){
		e.preventDefault();
		var pw = $("#member_pw").val();
		var pwCk = $("#member_pwck").val();
		
		if(pw == pwCk){
			$("#pwcheck").html("<blue>비밀번호가 일치합니다.</blue>");
			passChecked = 1;
		}
		else{
			$("#pwcheck").html("<red>비밀번호가 일치하지 않습니다.</red>");
			passChecked = 0;
		}
	});
	
	$("#member_pwck").keyup(function(event){
		var pw = $("#member_pw").val();
		var pwCk = $("#member_pwck").val();
		
		if(pw == pwCk){
			$("#pwcheck").html("<blue>비밀번호가 일치합니다.</blue>")
			passChecked = 1;
		}
		else{
			$("#pwcheck").html("<red>비밀번호가 일치하지 않습니다.</red>")
			passChecked = 0;
		}
	});
	
	$("#terms").on("click", function(event){
		if($("input:checkbox[id='terms']").is(":checked")==true){
			termChecked = 1;
		}else{
			termChecked = 0;
		}
	});

	
	$("#join-submit").unbind("click").click(function(e){
		if(noChecked == 1 && idChecked == 1 && passChecked == 1 && termChecked == 1){
			$("#signInForm").submit();
		}
		else if(noChecked == 0){
			alert("학번 중복확인을 해주세요.");
		}
		else if(idChecked == 0){
			alert("id 중복확인을 해주세요.");
		}
		else if(passChecked == 0){
			alert("비밀번호를 확인하여주세요");
		}
		else if(termChecked == 0){
			alert("약관에 동의하여주세요.");
		}
	});
})


function gotohome(){
	if(confirm("취소하시겠습니까?")){
		location.href = "/SOWLBOOKS"
	}
}
</script>

</html>