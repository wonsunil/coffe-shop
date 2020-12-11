<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="action/insert_product.jsp" method="POST">
	<table border=1>
		<tr>
			<td>상품코드</td>
			<td><input name="pcode"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input name="name"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input name="cost"></td>
		</tr>
		<tr>
			<td><input type="submit"></td>
		</tr>
	</table>
</form>

<script>
	document.forms[0].addEventListener("submit", function(event) {
		event.preventDefault();
		
		var form = document.forms[0];
		
		if(form.pcode.value === "") {
			alert("상품코드칸이 비었습니다");
			
			return form.pcode.focus();
		};
		if(form.name.value === "") {
			alert("상품이름칸이 비었습니다");
			
			return form.sname.focus();
		};
		if(form.cost.value === "") {
			alert("가격칸이 비었습니다");
			
			return form.cost.focus();
		};
		
		alert("정상적으로 등록되었습니다");
		form.submit();
	});
</script>