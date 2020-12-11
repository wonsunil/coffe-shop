<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="action/insert_shop.jsp" method="POST">
	<table border=1>
		<tr>
			<td>매장코드</td>
			<td><input name="scode"></td>
		</tr>
		<tr>
			<td>매장이름</td>
			<td><input name="sname"></td>
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
		
		if(form.scode.value === "") {
			alert("매장코드칸이 비었습니다");
			
			return form.scode.focus();
		};
		if(form.sname.value === "") {
			alert("매장이름칸이 비었습니다");
			
			return form.sname.focus();
		};
		
		alert("정상적으로 등록되었습니다");
		form.submit();
	});
</script>