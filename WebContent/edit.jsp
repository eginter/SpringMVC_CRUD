<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2 class="post-title">Click on a trip to edit:</h2>

	<ul>
		<c:forEach var="trip" items="${sessionScope.triplist}">
			<li><a href="GeneratePage.do?editview=true&tripID=${trip.key}">${trip.value.city}</a></li>
		</c:forEach>
	</ul>
