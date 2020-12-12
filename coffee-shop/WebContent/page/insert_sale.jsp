<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="coffee.DB" %>
<%@ page import="java.sql.ResultSet" %>

<%
	String select_product_query = "SELECT PCODE, NAME FROM TBL_PRODUCT_01";
	ResultSet select_product_rs = DB.fetch(select_product_query);
	
	String select_shop_query = "SELECT SCODE, SNAME FROM TBL_SHOP_01";
	ResultSet select_shop_rs = DB.fetch(select_shop_query);
%>

<h1>판매등록</h1>
<form action="action/insert_sale.jsp" method="POST">
	<table border=1>
		<tr>
			<td>비번호</td>
			<td><input name="saleno"></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td>
				<select name="pcode">
				<%
					while(select_product_rs.next()) {
				%>
					<option value="<%=select_product_rs.getString(1) %>"><%=String.format("[%s] %s", select_product_rs.getString(1), select_product_rs.getString(2)) %></option>
				<%
					};

					select_product_rs.close();
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input name="sale_date" type="number"></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td>
				<select name="scode">
				<%
					while(select_shop_rs.next()) {
				%>
					<option value="<%=select_shop_rs.getString(1) %>"><%=String.format("[%s] %s", select_shop_rs.getString(1), select_shop_rs.getString(2)) %></option>
				<%
					};
				
					select_shop_rs.close();
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input name="amount" type="number"></td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="submit" value="등록">
				<button>다시쓰기</button>
			</td>
		</tr>
	</table>
</form>

<script>
	document.forms[0].addEventListener("submit", function(event) {
		event.preventDefault();
		
		var form = document.forms[0];
		
		if(form.saleno.value === "") {
			alert("비번호칸이 비었습니다");
			
			return form.saleno.focus();
		};
		if(form.pcode.value === "") {
			alert("상품코드칸이 비었습니다");
			
			return form.pcdoe.focus();
		};
		if(form.sale_date.value === "") {
			alert("판매날짜칸이 비었습니다");
			
			return form.sale_date.focus();
		};
		if(form.amount.value === "" || 0) {
			alert("판매수량칸이 비었습니다");
			
			return form.amount.focus();
		};
		
		alert("정상적으로 등록되었습니다");
		return form.submit();
	});
	document.querySelector("button").onclick = function(event) {
		event.preventDefault();
		
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.forms[0].reset();
		
		return document.forms[0].saleno.focus();
	};
</script>