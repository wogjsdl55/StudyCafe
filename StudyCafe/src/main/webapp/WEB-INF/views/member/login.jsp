<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<body class="register-page sidebar-collapse">
 	<%@ include file="/WEB-INF/views/include/top.jsp" %>

  <div class="page-header" style="background-image: url('/resources/img/bg-masthead.jpg');">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 ml-auto mr-auto">
          <div class="card card-register">
            <h3 class="title mx-auto">로그인</h3>
            <div class="social-line text-center">
              <a href="#pablo" class="btn btn-neutral btn-facebook btn-just-icon">
                <i class="fa fa-facebook-square"></i>
              </a>
              <a href="#pablo" class="btn btn-neutral btn-google btn-just-icon">
                <i class="fa fa-google-plus"></i>
              </a>
              <a href="#pablo" class="btn btn-neutral btn-twitter btn-just-icon">
                <i class="fa fa-twitter"></i>
              </a>
            </div>
            <form class="register-form" onsubmit="return login();" action="login_proc" method="post"> 
              <label>Id</label>
              <input type="text" class="form-control" placeholder="Id" name="MId" id="MId">
              <label>Password</label>
              <input type="password" class="form-control" name="MPwd" id="MPwd" placeholder="Password">
              <input type="submit" class="btn btn-danger btn-block btn-round" value="로그인">
            </form>
            <div class="forgot">
              <a href="#" class="btn btn-link btn-danger">계정찾기</a>
              <a href="/member/member" class="btn btn-link btn-danger">회원가입</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="footer register-footer text-center">
      <h6>©
        <script>
          document.write(new Date().getFullYear())
        </script>, made with <i class="fa fa-heart heart"></i> by Creative Tim</h6>
    </div>
  </div>

</body>
</html>

<script>
	function login(){
		var MId = $("#MId").val();
		var MPwd = $("#MPwd").val();
		
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
	 	
	}
</script>