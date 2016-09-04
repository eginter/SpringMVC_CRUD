<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form class="details">
	<c:forEach var="trip" items="${sessionScope.triplist}">
		<c:choose>
			<c:when test="${param.city == trip.value.city}">
				<li>Welcome to:</li>
				<li>${trip.value.city}</li>
				<li>${trip.value.state}</li>
				<li>${trip.value.startDate}</li>
				<li>${trip.value.endDate}</li>
				<li>Something to do nearby while you're there</li>
				<li>${yelp.id}</li>
				<a href="${yelp.url}"><img alt="" src="${yelp.imageUrl}"></a>
				<iframe width="450" height="250" frameborder="0" style="border: 0"
					src="https://www.google.com/maps/embed/v1/search?key=AIzaSyBSZ6I-8PramlLicQV2zY1ykm8EpcQJ_ko&q=${trip.value.city}+${trip.value.state}"
					allowfullscreen> </iframe>
				
				
			</c:when>
		</c:choose>
	</c:forEach>
</form>
