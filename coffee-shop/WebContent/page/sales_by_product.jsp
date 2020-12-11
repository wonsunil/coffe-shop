<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="coffee.DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.DecimalFormat"%>

<%
	DecimalFormat formatter = new DecimalFormat("###,###");

	String product_query = "SELECT P.PCODE, NAME, SUM(AMOUNT*COST) FROM TBL_PRODUCT_01 P, TBL_SALELIST_01 SL WHERE P.PCODE = SL.PCODE GROUP BY P.PCODE, NAME";
	
	ResultSet product_rs = DB.fetch(product_query);
%>

<h1>상품별 판매액</h1>
<table border=1>
	<thead>
		<tr>
			<td>상품코드</td>
			<td>상품명</td>
			<td>상품별 판매액</td>
		</tr>
	</thead>
	<tbody>
		<%
			while(product_rs.next()) {
		%>
		<tr>
			<td><%=product_rs.getString(1) %></td>
			<td><%=product_rs.getString(2) %></td>
			<td><%=formatter.format(product_rs.getInt(3)) %></td>
		</tr>
		<%
			};
			
			product_rs.close();
		%>
	</tbody>
</table>