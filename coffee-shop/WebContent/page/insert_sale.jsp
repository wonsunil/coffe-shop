<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>판매등록</h1>
<form action="action/insert_sale.jsp" method="POST">
	<table border=1>
		<tr>
			<td>비번호</td>
			<td><input name="saleno"></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td><input name="pcode"></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input name="sale_date" type="number"></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td><input name="scode"></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input name="amount" type="number"></td>
		</tr>
		<tr>
			<td rowspan=2>
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
			alet("상품코드칸이 비었습니다");
			
			return form.pcdoe.focus();
		};
		if(form.sale_date.vlaue === "") {
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