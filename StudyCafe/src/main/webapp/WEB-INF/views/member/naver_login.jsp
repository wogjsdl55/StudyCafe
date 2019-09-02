<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<html>
	<head>
    	<title>네이버로그인</title>
  	</head>
  	<body>
	<% 
	    String clientId = "Z2mQMW6lHERYw5lYBVEy";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "SknlDaf_U4";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8181/member/naver_login", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    //System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
    	    JSONParser parsing = new JSONParser();
    	    Object obj = parsing.parse(res.toString());
    	    JSONObject jsonObj = (JSONObject)obj;
    	                 
    	    access_token = (String)jsonObj.get("access_token");
    	    refresh_token = (String)jsonObj.get("refresh_token");
    	    
    	}
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	    
	    
	    if(access_token != null) { // access_token을 잘 받아왔다면
	    	String token = access_token;// 네이버 로그인 접근 토큰;
	        String header = "Bearer " + token; // Bearer 다음에 공백 추가
	        try {
	            apiURL = "https://openapi.naver.com/v1/nid/me";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization", header);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response_info = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	            	response_info.append(inputLine);
	            }
	            br.close();
	            
	            JSONParser parsing = new JSONParser();
	            Object obj = parsing.parse(response_info.toString());
	            JSONObject jsonObj = (JSONObject)obj;
	            JSONObject resObj = (JSONObject)jsonObj.get("response");
	             
	            //왼쪽 변수 이름은 원하는 대로 정하면 된다. 
	            //단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
	            String naver_code = (String)resObj.get("id");
	            String email = (String)resObj.get("email");
	            String name = (String)resObj.get("name");
	            String nick_name = (String)resObj.get("nickname");
	            
	            ArrayList naver_info = new ArrayList(); 
	            
	            naver_info.add(naver_code);
	            naver_info.add(nick_name);
	            naver_info.add(email);
	            
	            session.setAttribute("naver_info", naver_info);
	            
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        response.sendRedirect("/");
	    }
	  %>
  	</body>
</html>