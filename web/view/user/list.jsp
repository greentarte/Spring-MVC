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
	<h1>User List Page</h1>
	<form method="post" >
		<table border="1">
			<thead>
				<tr>
					<th>ID</th>
					<th>PWD</th>
					<th>NAME</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="u" items="${userlist }">
					<tr>
						<td><a href="userinfo.do?id=${u.id }">${u.id }</a></td>
						<td>${u.pwd }</td>
						<td>${u.name }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>

</div>











