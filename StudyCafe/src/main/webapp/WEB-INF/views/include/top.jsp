<%@page import="com.Portfolio.StudyCafe.dto.Member_Dto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="300">
		<div class="container">
	    	<div class="navbar-translate">
	    	<a class="navbar-brand" href="/" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom" >
	          	노맨의 Study Cafe
	        </a>
	        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
	        	<span class="navbar-toggler-bar bar1"></span>
	        	<span class="navbar-toggler-bar bar2"></span>
	        	<span class="navbar-toggler-bar bar3"></span>
	        </button>
	      </div>
	      <div class="collapse navbar-collapse justify-content-end" id="navigation">
	      	<ul class="navbar-nav">
	        	<li class="nav-item">
	            	<a href="/" class="nav-link" style="font-size: 20px;">홈</a>
	          	</li>
	          	<li class="nav-item">
	            	<a href="/review/review" class="nav-link" style="font-size: 20px;">리뷰작성</a>
	          	</li>
				
	    	    <li class="nav-item">
	    	    
	    	<c:choose> 
	    		<c:when test="${login_result != null}">
	    			<c:forEach items="${login_result}" var="result">
	    				<li class="nav-item">
		    	    		<a href="/member/member_edit?seq=${result.MSeq}" class="nav-link" style="font-size: 20px;">${result.MNick}</a>
		    	    	</li>
		    	    </c:forEach>
		    	    	<li class="nav-item">
		        			<a href="/member/login_out" class="nav-link" style="font-size: 20px;">로그아웃</a>
		        		</li>
		        </c:when>
		        
		        <c:when test="${naver_info != null}">
    				<li class="nav-item">
	    	    		<a href="#"  class="nav-link" style="font-size: 20px;">${naver_info[1]}</a>
	    	    	</li>
	    	    	<li class="nav-item">
	        			<a href="/member/login_out" class="nav-link" style="font-size: 20px;">로그아웃</a>
	        		</li>
		        </c:when>
		      
		   		<c:when test="${login_result == null}">
		   			<a href="/member/login" class="nav-link" style="font-size: 20px;">로그인</a>
				</c:when>
		   	</c:choose>

	        </ul>
	      </div>
	  </div>
  </nav>
  <!-- End Navbar -->
</body>
</html>