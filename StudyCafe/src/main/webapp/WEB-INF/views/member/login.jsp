<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
	String clientId = "Z2mQMW6lHERYw5lYBVEy";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8181/member/naver_login", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);

%>
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
            <form class="register-form" onsubmit="return login();" action="login_proc" method="post"> 
              <label>Id</label>
              <input type="text" class="form-control" placeholder="Id" name="MId" id="MId">
              <label>Password</label>
              <input type="password" class="form-control" name="MPwd" id="MPwd" placeholder="Password">
              <input type="submit" class="btn btn-danger btn-block btn-round" value="로그인">
              <!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
			  <div id="naver_id_login" style="text-align:center; margin-top: 16px; height: 50px;">
				  <a href="<%=apiURL%>">
				  	<img style="width:100%; height:100%; border-radius: 0px 0px 0 0;" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
				  </a> 
			  </div> 
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
