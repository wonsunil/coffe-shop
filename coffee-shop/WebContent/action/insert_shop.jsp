<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="coffee.DB" %>
<%@ page import="java.sql.ResultSet" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String scode = request.getParameter("scode");
	String sname = request.getParameter("sname");
	
	String[] datas = {scode, sname};
	String insert_shop_query = "INSERT INTO TBL_SHOP_01 VALUES(?, ?)";
	
	DB.execute(insert_shop_query, datas);
	
	response.sendRedirect("../index.jsp");
%>