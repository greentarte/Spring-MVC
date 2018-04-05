<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#main_center {
	margin: 0 20px;
	width: 760px;
	height: 480px;
	background: white;
}
</style>

<div id="main_center">
	<h1>Product List Page</h1>
	<form method="post">
		<table border="1">
			<thead>
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>price</th>
					<th>regdate</th>
					<th>imgname</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${productlist }">
					<tr>
						<td><a href="productinfo.do?id=${p.id }">${p.id }</a></td>
						<th>${p.name }</th>
						<th>${p.price }</th>
						<th>${p.regdate }</th>
						<th>${p.imgname }</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</div>











