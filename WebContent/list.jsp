<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pure-g">
	<div class="pure-u-1-3 post-title">
		<p>Location:</p>
	</div>
	<div class="pure-u-1-3 post-title">
		<p>Start:</p>
	</div>
	<div class="pure-u-1-3 post-title">
		<p>End:</p>
	</div>
	<c:forEach var="trip" items="${sessionScope.triplist}">
		<div class="pure-u-1-3">
			<h3>${trip.value.city},${trip.value.state}</h3>
		</div>
		<div class="pure-u-1-3">
			<p>${trip.value.startDate}</p>
		</div>
		<div class="pure-u-1-3">
			<p>${trip.value.endDate}</p>
		</div>
	</c:forEach>

</div>