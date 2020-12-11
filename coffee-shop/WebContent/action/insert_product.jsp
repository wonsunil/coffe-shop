<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="coffee.DB" %>
<%@ page import="java.sql.ResultSet" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String pcode = request.getParameter("pcode");
	String name = request.getParameter("name");
	int cost = Integer.parseInt(request.getParameter("cost"));
	
	String[] datas = {pcode, name, String.valueOf(cost)};
	String insert_shop_query = "INSERT INTO TBL_PRODUCT_01 VALUES(?, ?, ?)";
	
	DB.execute(insert_shop_query, datas);

	response.sendRedirect("../index.jsp");
%>