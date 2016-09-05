<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2 class="post-title">Upcoming Trips:</h2>

<div class="pure-g">
	<c:forEach var="trip" items="${sessionScope.triplist}">
		<div class="pure-u-1-3">
			<a href="GeneratePage.do?details=true&city=${trip.value.city}&state=${trip.value.state}"><h3>${trip.value.city}, ${trip.value.state}</h3></a>
		</div>
		<div class="pure-u-1-3">
			<p>${trip.value.startDate}</p>
		</div>
		<div class="pure-u-1-3">
			<p>${trip.value.endDate}</p>
		</div>
	</c:forEach>

</div>
