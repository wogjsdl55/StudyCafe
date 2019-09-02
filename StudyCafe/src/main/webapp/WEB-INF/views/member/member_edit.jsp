<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/resources/css/member.css" rel="stylesheet" />
<!DOCTYPE html>
<html lang="UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
	<body class="register-page sidebar-collapse">
		<%@ include file="/WEB-INF/views/include/top.jsp" %>
		<div class="page-header" style="background-image: url('/resources/img/bg-masthead.jpg');">
			
			<div class="container">
				<div style="display:flex;width:100%;">
				    <form name="member_proc" onsubmit="return signup();" action="member_edit_proc" method="post">
				    	<c:forEach items="${result}" var="rs">
				    	<input type="hidden" name="MSeq" value="${rs.MSeq}" />
					    	<div style="width:100%;">
					            <input name="MId" id="MId" placeholder="아이디" value="${rs.MId}" readonly>
					        </div>
					        <div style="width:100%;">
					            <input type ="password" name="MPwd" id="MPwd" value="${rs.MPwd}" placeholder="비밀번호">
					        </div>     
					        <div style="width:100%;">
					            <input name="MName" id="MName" value="${rs.MName}" placeholder="이름" >
					        </div> 
					        <div style="width:100%;">
					            <input name="MEmail" id="MEmail" value="${rs.MEmail}"  placeholder="이메일">
					        </div>
					        <div style="width:100%;">
					            <input name="MNick" id="MNick" value="${rs.MNick}" placeholder="닉네임">
					        </div>

				        <input type="submit" class="btn btn-danger btn-block btn-round" value="수정완료">
				        </c:forEach>
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
	    
	    if(confirm("수정 하시겠습니까?")){
	        return true;
	    }else {
	    	alert("취소하셨습니다.");
	    	return false
	    }
	}
</script>