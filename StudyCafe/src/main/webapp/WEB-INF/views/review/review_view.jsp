<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="UTF-8">
<link href="/resources/css/review.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css" rel="stylesheet">
<%
	String seq = request.getParameter("seq");
%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body class="register-page sidebar-collapse">
 <%@ include file="/WEB-INF/views/include/top.jsp" %>

  <div class="page-header" style="background-image: url('/resources/img/bg-masthead.jpg');">
    <div class="container">
      <div class="row" style="min-height: 450px; padding-top: 30px; ">
        <div class="col-lg-4 ml-auto mr-auto" style="max-width: none;">
          <div class="col">
         	<c:forEach items="${result}" var="rs" >
      	    <div class="card shadow" >
          		<input type="hidden" name="MStar" value="" />
          		<input type="hidden" name="MId" value="${rs.MId}" />
          		<input type="hidden" name="MNick" value="${rs.MNick}"/>
          		
          	 	<div class="card-header border-0" >
          			<div style="width: 50%; float:left; padding-top: 2%;" ><h5>${rs.RSubject}</h5></div>
          			<div class="starRev" style="float:right; padding-top:1%;" >
						<span class="starR <c:if test="${rs.RStar >= 1 }">on</c:if>" style="width:15px; height:15px; cursor: auto;"></span>
						<span class="starR <c:if test="${rs.RStar >= 2}">on</c:if>" style="width:15px; height:15px; cursor: auto;">2</span>
						<span class="starR <c:if test="${rs.RStar >= 3}">on</c:if>" style="width:15px; height:15px; cursor: auto;">3</span>
						<span class="starR <c:if test="${rs.RStar >= 4}">on</c:if>" style="width:15px; height:15px; cursor: auto;">4</span>
						<span class="starR <c:if test="${rs.RStar >= 5}">on</c:if>" style="width:15px; height:15px; cursor: auto;">5</span>
					</div>
          		</div> 
          		<textarea name="RComment" class="form-control" style="width:400px;" placeholder="글 내용을 입력하세요." readonly>${rs.RComment}</textarea>
          	</div>
          	 </c:forEach>
          	<div class="card shadow" >
 				<div class="card-header border-0" style="height:60px; background-color: #f7f7f7;">
 					<h5>댓글 수</h5>
 				</div>
 				
 				<c:forEach items="${result_list}" var="rs" >
	 				<div style="position: relative; border: 1px solid #ddd; width: auto;">
	                    <div style="padding: 12px;">
	                    	<div style="color: #999999; display: inline-block; font-size: 10px; margin-right: 10px;">
	                    		<span style="color: #2a6496; font-size: 12px; display: inline-block; max-width: 140px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${rs.MNick}</span>
	                    	</div> 
	                    	<div class="">
	                    		<span style="color: #ccc; display: block; font-size:10px;">${rs.reRegdate}</span>
	                    	</div>
	                    	
	                    	<fieldset class="form" style="margin-top: 13px;">
	                             <article id="note-text-1768236" class="list-group-item-text note-text">
	                             	<p>${rs.reComment}</p>
	                             </article>
	                         </fieldset>
	                    </div>
	                </div>
                </c:forEach>
                <c:choose> 
		    		<c:when test="${login_result != null || naver_info != null}">
		    			<c:forEach items="${login_result}" var="result">
		    				<div style="display: inline-block; margin-left: 5px; margin-top: 2%;">
			 					<span style="font-size: 14px; line-height: 20px; color: #2a6496; padding: 10px;">노맨</span>
			 					<form id="reply_form" method="post" style="margin-top:20px; padding: 10px;" >
		 							<input type ="hidden" name="MNick" id="MNick" value="${result.MNick}">
		 							<input type ="hidden" name="RSeq" id="RSeq" value="<%=seq%>">

				 					<textarea name="ReComment" id="ReComment" class="reply_form" placeholder="댓글 쓰기" style=" height: 100%;"></textarea>
				 					<button id="reply_button" class="btn btn-danger btn-block btn-round" style="width: 100px; height: 55px; float: right; margin: 5px; background-color: #449d44; border-color: #449d44; " >등록</button>
			 					</form>
			 				</div>	
			    	    </c:forEach>
	    				<div style="display: inline-block; margin-left: 5px; margin-top: 2%;">
		 					<span style="font-size: 14px; line-height: 20px; color: #2a6496; padding: 10px;">노맨</span>
		 					<form id="reply_form" method="post" style="margin-top:20px; padding: 10px;" >
	 							<input type ="hidden" name="MNick" id="MNick" value="${naver_info[1]}">
	 							<input type ="hidden" name="RSeq" id="RSeq" value="<%=seq%>">

			 					<textarea name="ReComment" id="ReComment" class="reply_form" placeholder="댓글 쓰기" style=" height: 100%;"></textarea>
			 					<button id="reply_button" class="btn btn-danger btn-block btn-round" style="width: 100px; height: 55px; float: right; margin: 5px; background-color: #449d44; border-color: #449d44; " >등록</button>
		 					</form>
		 				</div>	
			        </c:when> 
		       
			   		<c:when test="${login_result == null && naver_info == null }">
				   		<div class="panel-body" style="border: 1px solid #ddd; padding:3%;">
	                		<h5 class="text-center"><a href="/member/login" class="link" style="color: #2a6496;">로그인</a>을 하시면 댓글을 등록할 수 있습니다.</h5>
	                 	</div>	 
					</c:when>
		   		</c:choose>		
	        </div>
	      </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>

<script>
	CKEDITOR.replace('RComment');
	
	$("#reply_button").click( function(){
		var RSeq = $("#RSeq").val();
		var MNick =  $("#MNick").val();
		var ReComment =  $("#ReComment").val();
		

		if(confirm('댓글을 등록하시겠습니까?'))   {
			
	        $.ajax({
		        url: "/review/review_reply_ajax",
		        type: "post",       
		        data:{ 
		        	RSeq : RSeq,
		        	MNick : MNick,
                	ReComment : ReComment
		        },
		        success: function(result){
		        	alert("성공");
	            },error: function(result) {
	           }
	
	        })
		}
	    else{  
	    	return false;
	    };
	});

	
</script>
