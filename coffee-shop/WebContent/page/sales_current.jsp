<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="coffee.DB" %>
<%@ page import="java.sql.ResultSet" %>

<%
	String current_query = "SELECT " +
								"SALENO, " +
								"P.PCODE, " +
								"SALEDATE, " +
								"SCODE, " +
								"P.NAME, " +
								"AMOUNT, " +
								"COST*AMOUNT " + 
							"FROM " +
								"TBL_PRODUCT_01 P, " +
								"TBL_SALELIST_01 SL " +
							"WHERE " +
								"P.PCODE = SL.PCODE";
	
	ResultSet current_rs = DB.fetch(current_query);
%>

<h1>판매현황</h1>
<table border=1>
	<thead>
		<tr>
			<td>비번호</td>
			<td>상품코드</td>
			<td>판매날짜</td>
			<td>매장코드</td>
			<td>상품명</td>
			<td>판매수량</td>
			<td>총판매액</td>		
		</tr>
	</thead>
	<tbody>
		<%
			while(current_rs.next()) {
		%>
		<tr>
			<td><%=current_rs.getInt(1) %></td>
			<td><%=current_rs.getString(2) %></td>
			<td><%=current_rs.getString(3).substring(0, 10) %></td>
			<td><%=current_rs.getString(4) %></td>
			<td><%=current_rs.getString(5) %></td>
			<td><%=current_rs.getInt(6) %></td>
			<td><%=current_rs.getInt(7) %></td>
		</tr>
		<%
			};
			
			current_rs.close();
		%>
	</tbody>
</table>