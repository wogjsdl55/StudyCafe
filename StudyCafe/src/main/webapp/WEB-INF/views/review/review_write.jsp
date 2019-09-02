<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<link href="/resources/css/review.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body class="register-page sidebar-collapse">
 <%@ include file="/WEB-INF/views/include/top.jsp" %>

  <div class="page-header" style="background-image: url('/resources/img/bg-masthead.jpg');">
    <div class="container">
      <div class="row" style="min-height: 450px; padding-top: 30px; background-color: #f8f8f8;">
        <div class="col-lg-4 ml-auto mr-auto" style="max-width: none;">
          <div class="col">
          	<form name="review_wirte" onsubmit="return write_proc();" action="review_write_proc" method="post" >
	      	    <div class="card shadow" >
	          		<input type="hidden" name="MStar" value="" />
	          		<input type="hidden" name="MId" value="<c:forEach items="${login_result}" var="result">${result.MId}</c:forEach>${naver_info[2]}" />
	          		<input type="hidden" name="MNick" value="<c:forEach items="${login_result}" var="result">${result.MNick}</c:forEach>${naver_info[1]}" />
	          		
	          	 	<div class="card-header border-0" style="height:60px;">
	          			<h5><input type="text" style="width: 50%; float:left;" id="RSubject" name="RSubject" placeholder="제목을 입력해주세요."></h5>
	          			<div class="starRev" style="float:right;">
							<span class="starR on">1</span>
							<span class="starR">2</span>
							<span class="starR">3</span>
							<span class="starR">4</span>
							<span class="starR">5</span>
						</div>
	          		</div> 
	          		<textarea name="RComment" id="RComment" class="form-control" style="width:400px;" placeholder="글 내용을 입력하세요."></textarea>
	          	</div>
	          	<div style="width:315px; margin-top: 5%; margin-left: 39%;">
	          		<input type="submit" class="btn btn-danger btn-block btn-round" style="width:30%; float: left;" value="작성완료">
	          		<a href="/review/review"><button class="btn btn-danger btn-block btn-round" style="width:30%; background-color: #5cb85c; border-color: #5cb85c;" >작성취소</button></a>
	          	</div>
	         </form>
	        </div>
	      </div>
        </div>
      </div>
    </div>
    <div class="footer register-footer text-center">
      <h6>©
        <script>
          document.write(new Date().getFullYear())
        </script>, made with <i class="fa fa-heart heart"></i> by Creative NoMan</h6>
    </div>
  </div>
</body>
</html>

<script>
	CKEDITOR.replace('RComment');
	
	document.review_wirte.MStar.value = "1";
	
	$('.starRev span').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		
		var star_value =  $(this).text();
		document.review_wirte.MStar.value = star_value;
		
		return false;
	});
	
	
	function write_proc(){
		var RSubject = $("#RSubject").val();
		
		if(RSubject.length == 0){
	        alert("제목을 입력해주세요"); 
	        $("#RSubject").focus();
	        return false;
	    }

	    
	    if(confirm("작성한 내용을 등록 하시겠습니까?")){
	        return true;
	    }else {
	    	alert("취소하셨습니다.");
	    	return false
	    }
	}
</script>

