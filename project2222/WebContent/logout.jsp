<%@page import="project2222.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
Connection conn=DbConnection.getConnection();
session.invalidate();
response.sendRedirect("home.jsp");
%>
