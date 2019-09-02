<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="UTF-8">
<link href="/resources/css/review.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css" rel="stylesheet">
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<body class="register-page sidebar-collapse">
 <%@ include file="/WEB-INF/views/include/top.jsp" %>

  <div class="page-header" style="background-image: url('/resources/img/bg-masthead.jpg');">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 ml-auto mr-auto" style="max-width: none;">
          <div class="col">
	          <div class="card shadow" >
	            <div class="card-header border-0">
	            	<h3 class="mb-0" style="width: 15vw; float: left; ">리뷰 게시판</h3>
	            	<c:choose>
	            		<c:when test="${login_result == null && naver_info == null }">
	            			<a href="/member/login">
	            		</c:when>
	            		<c:when test="${login_result != null || naver_info != null}">
	            			<a href="/review/review_write">
	            		</c:when>
	            	</c:choose>
	            	
	            		<button class="btn btn-danger btn-block btn-round" style="width: 100px; float: right; background-color: #449d44; border-color: #449d44; margin-top:20px; " >새 글 쓰기</button>
	            		</a>
	            </div>
	            <div class="table-responsive" style="min-height:300px;">
	              <div class="table align-items-center table-flush">
	              	<c:forEach items="${review_list}" var="list" >
		                <li class="table_li">
		                	<div class="list_title">
		                    	<div class="list_tag" style="font-size: 12px; margin-bottom: 5px;">${list.RSeq}</div>
		                    	<div style=" margin-top: 3px; margin-bottom: 3px; word-break: break-all;"><a href="/review/review_view?seq=${list.RSeq}" style="color: #2a6496;">${fn:substring(list.RSubject, 0, 10)}</a></div>
		                    </div>
		                    <div class="list_view" >
		                    	<div class="list_view_group">
			                    	<ul style="list-style: none; margin: 0; padding: 0;">
			                    		<li style="float: left; width: 100px; line-height: 20px; vertical-align: middle;">
			                    			<div class="starRev" >
												<span class="starR <c:if test="${list.RStar >= 1 }">on</c:if>" style="width:15px; height:15px; cursor: auto;"></span>
												<span class="starR <c:if test="${list.RStar >= 2}">on</c:if>" style="width:15px; height:15px; cursor: auto;">2</span>
												<span class="starR <c:if test="${list.RStar >= 3}">on</c:if>" style="width:15px; height:15px; cursor: auto;">3</span>
												<span class="starR <c:if test="${list.RStar >= 4}">on</c:if>" style="width:15px; height:15px; cursor: auto;">4</span>
												<span class="starR <c:if test="${list.RStar >= 5}">on</c:if>" style="width:15px; height:15px; cursor: auto;">5</span>
											</div>
			                    		</li> 
			                    		<li style="float: left; width: 45px; line-height: 20px; vertical-align: middle;">${list.RView}</li>
			                    	</ul>
		                    	</div>
		                    </div>
		                    <div class="list_group" style="width: 60px;">
		                    	<div style="color: #999999; display: inline-block; font-size: 10px; margin-right: 10px;">
		                    		<span style="color: #2a6496; font-size: 12px; display: inline-block; max-width: 140px; overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap;">${list.MNick}</span>
		                    	</div>
		                    	<div class="">
		                    		<span style="color: #ccc; display: block; font-size:10px;">${list.RRegdate}</span>
		                    	</div>
		                    </div>
		                </li>
	                </c:forEach>
	              </div>
	            </div>
	            
	            <div class="card-footer py-4">
	              <nav aria-label="...">
	                <ul class="pagination justify-content-end mb-0">
	                  <li class="page-item disabled">
	                    <a class="page-link" href="#" tabindex="-1">
	                      <i class="fas fa-angle-left"></i>
	                      <span class="sr-only">Previous</span>
	                    </a>
	                  </li>
	                  <li class="page-item active">
	                    <a class="page-link" href="#">1</a>
	                  </li>
	                  <li class="page-item">
	                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
	                  </li>
	                  <li class="page-item"><a class="page-link" href="#">3</a></li>
	                  <li class="page-item">
	                    <a class="page-link" href="#">
	                      <i class="fas fa-angle-right"></i>
	                      <span class="sr-only">Next</span>
	                    </a>
	                  </li>
	                </ul>
	              </nav>
	            </div>
	          </div>
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

