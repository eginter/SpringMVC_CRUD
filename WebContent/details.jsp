<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form class="details">
	<c:forEach var="trip" items="${triplist}">
		<c:choose>
			<c:when test="${param.city == trip.value.city}">
				<div class="pure-g">

				<div class="pure-u-1 welcome">Welcome to...</div><br>
				<div class="pure-u-1 city">${trip.value.city}, ${trip.value.state}</div><br>
				<div class="pure-u-1"id="map">
				<iframe
					src="https://www.google.com/maps/embed/v1/search?key=AIzaSyBSZ6I-8PramlLicQV2zY1ykm8EpcQJ_ko&q=${trip.value.city}+${trip.value.state}">
				 </iframe>
				</div>
				<div class="pure-u-1 date"> Travel dates: </div>
				<div class="pure-u-1 date"> ${trip.value.startDate} - ${trip.value.endDate}</div><br>
				<h1 class="content-subhead pure-u-1">Local Suggestion from Yelp </h1>
			  <div class="pure-u-4-5 yelp-id"><a href="${yelp.url}">${yelp.id}</div></a>
				<a class="pure-u-1-5 .pure-img-responsive yelp-img"href="${yelp.url}"><img alt="" src="${yelp.imageUrl}"></a>
			</div>
			</c:when>
		</c:choose>
	</c:forEach>
</form>
