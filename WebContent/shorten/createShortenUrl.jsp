<%@page import="kr.co.kic.dev1.util.Utility"%>
<%@ page contentType="application/json;charset=utf-8"%>
<%
	String clientID = "N10mvM_tj8wds6KCavEo";
	String clientSecret = "v6IlK3gTOt";
	String oriUrl = "https://docs.google.com/spreadsheets/d/1AEbbhYgDMouucbzE4OOxLUXoYLMr2nNyWqE4wq3rTeU/edit#gid=0";
	String url = Utility.getShortenURL(clientID, clientSecret, oriUrl);
	// System.out.println(url);
	
%>