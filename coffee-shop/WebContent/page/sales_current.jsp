<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="coffee.DB" %>
<%@ page import="java.sql.ResultSet" %>

<%
	String column = request.getParameter("column");
	String value = request.getParameter("search");
	
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
								"%s = '%s'";
	
	ResultSet search_rs = DB.fetch(String.format(search_query, column, value));

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
			if(value != null && value != "") {
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
		<select name="column">
			<option value="SALENO" <%=column.equals("SALENO") ? "selected" : "" %>>비번호</option>
			<option value="P.PCODE" <%=column.equals("P.PCODE") ? "selected" : "" %>>상품코드</option>
			<option value="SCODE" <%=column.equals("SCODE") ? "selected" : "" %>>매장코드</option>
			<option value="P.NAME" <%=column.equals("P.NAME") ? "selected" : "" %>>상품명</option>
			<option value="AMOUNT" <%=column.equals("AMOUNT") ? "selected" : "" %>>판매수량</option>
			<option value="COST*AMOUNT" <%=column.equals("COST*AMOUNT") ? "selected" : "" %>>총판매액</option>
		</select>
	</tr>
	<tr>
		<td><input name="search" value="<%=value %>"></td>
		<td><input type="submit"></td>
	</tr>
</form>