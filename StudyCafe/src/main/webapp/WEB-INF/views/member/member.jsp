<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/resources/css/member.css" rel="stylesheet" />
<!DOCTYPE html>
<html lang="UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<body class="register-page sidebar-collapse">
		<%@ include file="/WEB-INF/views/include/top.jsp" %>
		<div class="page-header" style="background-image: url('/resources/img/bg-masthead.jpg');">
			
			<div class="container">
				<div style="display:flex;width:100%;">
				    <form name="member_proc" onsubmit="return signup();" action="member_proc" method="post">
				    	<div style="width:100%;">
				            <input name="MId" id="MId" placeholder="아이디" >
				        </div>
				        <div style="width:100%;">
				            <input type ="password" name="MPwd" id="MPwd" placeholder="비밀번호">
				        </div>
				        <div style="width:100%;">
				            <input name="MName" id="MName" placeholder="이름" >
				        </div>
				        <div style="width:100%;">
				            <input name="MEmail" id="MEmail" placeholder="이메일">
				        </div>
				        <div style="width:100%;">
				            <input name="MNick" id="MNick" placeholder="닉네임">
				        </div>
				
				        <p class="term">
				            <i class="fa fa-check-square-o" aria-hidden="true"></i><span>개인정보취급방침 동의</span>
				        </p>
				        <input type="submit" class="btn btn-danger btn-block btn-round" value="회원가입">
				    </form> 
				</div>
				</div>
			</div>	      
		
	</body>
</html>
<script>
	function signup(){
		var MId = $("#MId").val();
		var MPwd = $("#MPwd").val();
		var MName = $("#MName").val();
		var MEmail = $("#MEmail").val();
		var MNick = $("#MNick").val();
		
		if(MId.length == 0){
	        alert("아이디를 입력해 주세요"); 
	        $("#MId").focus();
	        return false;
	    }
	    
	    if(MPwd.length == 0){
	        alert("비밀번호를 입력해 주세요"); 
	        $("#MPwd").focus();
	        return false;
	    }
	 	
	    if(MName.length == 0){
	        alert("이름을 입력해주세요");
	        $("#MName").focus();
	        return false;
	    }
	    if(MEmail.length == 0){
	        alert("이메일을 입력해주세요");
	        $("#MEmail").focus();
	        return false;
	    }
	    if(MNick.length == 0){
	        alert("닉네임을 입력해주세요");
	        $("#MNick").focus();
	        return false;
	    }
	    
	    if(confirm("회원가입을 하시겠습니까?")){
	        return true;
	    }else {
	    	alert("취소하셨습니다.");
	    	return false
	    }
	}
</script>