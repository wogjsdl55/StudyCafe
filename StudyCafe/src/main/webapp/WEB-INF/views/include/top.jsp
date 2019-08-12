<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String login_name;

	if((String)session.getAttribute("login_name") == null){
		login_name = "로그인";
	}else {
		login_name = (String)session.getAttribute("login_name");
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
	            	<a href="/" class="nav-link" style="font-size: 20px;">HOME</a>
	          	</li>
	          	<li class="nav-item">
	            	<a href="notice" class="nav-link" style="font-size: 20px;">공지사항</a>
	          	</li>
				
	    	    <li class="nav-item">
		    	    <a href="/member/memer_edit" class="nav-link" style="font-size: 20px;"><%=login_name%></a>		    	    
	          	</li>
	      	<% if(login_name != "로그인"){%>
	          	<li class="nav-item">
	        		<a href="/member/login_out" class="nav-link" style="font-size: 20px;">로그아웃</a>
	        	</li>
	        <% } %>
	        </ul>
	      </div>
	  </div>
  </nav>
  <!-- End Navbar -->
</body>
</html>