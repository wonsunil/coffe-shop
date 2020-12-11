<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="coffee.DB" %>
<%@ page import="java.sql.ResultSet" %>

<%
	String shop_query = "SELECT SH.SCODE, SNAME, SUM(P.COST*SL.AMOUNT) FROM TBL_PRODUCT_01 P, TBL_SHOP_01 SH, TBL_SALELIST_01 SL WHERE SH.SCODE = SL.SCODE AND SL.PCODE = P.PCODE GROUP BY SH.SCODE, SNAME ORDER BY SH.SCODE, SNAME";

	ResultSet shop_rs = DB.fetch(shop_query);
%>

<h1>매장별 판매액</h1>
<table border=1>
	<thead>
		<tr>
			<td>매장코드</td>
			<td>매장명</td>
			<td>매장별 판매액</td>
		</tr>
	</thead>
	<tbody>
		<%
			while(shop_rs.next()) {
		%>
		<tr>
			<td><%=shop_rs.getString(1) %></td>
			<td><%=shop_rs.getString(2) %></td>
			<td><%=shop_rs.getInt(3) %></td>
		</tr>
		<%
			};
			
			shop_rs.close();
		%>
	</tbody>
</table>