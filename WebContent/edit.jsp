<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2 class="post-title">Click on a trip to edit:</h2>

	<ul>
		<c:forEach var="trip" items="${triplist}">
			<li><h3><a href="GeneratePage.do?action=editview&index=${trip.value.index}">${trip.value.city}, ${trip.value.state}</a></h3></li>
		</c:forEach>
	</ul>
