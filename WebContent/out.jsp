<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<JSONObject> list = new ArrayList<JSONObject>();
list = (List<JSONObject>)request.getAttribute("out");
String json = list.toString();
out.print(json);
%>