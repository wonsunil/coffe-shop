<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="coffee.DB" %>
<%@ page import="java.sql.ResultSet" %>

<%
	String search = request.getParameter("search");
	String search_query = "SELECT " +
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
								"P.PCODE = SL.PCODE AND " +
								"P.NAME = ?";
	
	String[] data = {search};
	
	ResultSet search_rs = DB.fetch(search_query, data);

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
			if(search != null && search != "") {
				while(search_rs.next()) {
		%>
			<tr>
				<td><%=search_rs.getInt(1) %></td>
				<td><%=search_rs.getString(2) %></td>
				<td><%=search_rs.getString(3).substring(0, 10) %></td>
				<td><%=search_rs.getString(4) %></td>
				<td><%=search_rs.getString(5) %></td>
				<td><%=search_rs.getInt(6) %></td>
				<td><%=search_rs.getInt(7) %></td>
			</tr>
		<%	
				};
				
				search_rs.close();
			}else {
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
			};
		%>
	</tbody>
</table>
<form action="index.jsp?section=sales_current" method="POST">
	<tr>
		<td><input name="search"></td>
		<td><input type="submit"></td>
	</tr>
</form>