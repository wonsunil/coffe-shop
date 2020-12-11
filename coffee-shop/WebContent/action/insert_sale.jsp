<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="coffee.DB" %>

<%
	int saleno = Integer.parseInt(request.getParameter("saleno"));
	String pcode = request.getParameter("pcode");
	String sale_date = request.getParameter("sale_date");
	String scode = request.getParameter("scode");
	int amount = Integer.parseInt(request.getParameter("amount"));

	String[] datas = {String.valueOf(saleno), pcode, sale_date, scode, String.valueOf(amount)};
	
	String insert_query = "INSERT INTO TBL_SALELIST_01 VALUES(?, ?, ?, ?, ?)";
	
	DB.execute(insert_query, datas);
	
	response.sendRedirect("../index.jsp?section=sales_current");
%>