<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
<link rel="stylesheet" href="css/layouts/blog.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trip List</title>
</head>


<body>

	<div id="layout" class="pure-g">
		<div class="sidebar pure-u-1 pure-u-md-1-4">
			<div class="header">
				<h1 class="brand-title">Menu</h1>
				<h2 class="brand-tagline"></h2>

				<nav class="nav">
					<ul class="nav-list">
						<li class="nav-item"><a class="pure-button" href="add.jsp">Add</a>
						</li>
						<li class="nav-item"><a class="pure-button" href="edit.jsp">Edit</a>
						</li>
						<li class="nav-item"><a class="pure-button"
							href="results.jsp">List</a></li>
					</ul>
				</nav>
			</div>
		</div>

		<div class="content pure-u-1 pure-u-md-3-4">
			<div>
				<!-- A wrapper for all the blog posts -->
				<div class="posts">
					<h1 class="content-subhead">Trip Planner</h1>

					<!-- A single blog post -->
					<section class="post">
						<header class="post-header">


							<h2 class="post-title">Upcoming Trips:</h2>

						</header>

						<div class="post-description">
							<p>
								${randomRecTrips.state}
								<div class="pure-g">
										<div class="pure-u-1-3 post-title"><p>Location:</p></div>
										<div class="pure-u-1-3 post-title"><p>Start:</p></div>
										<div class="pure-u-1-3 post-title"><p>End:</p></div>
									<c:forEach var="trip" items="${sessionScope.triplist}">
    										<div class="pure-u-1-3"><h3>${trip.value.city}, ${trip.value.state}</h3></div>
    										<div class="pure-u-1-3"><p>${trip.value.startDate}</p></div>
    										<div class="pure-u-1-3"><p>${trip.value.endDate}</p></div>
									</c:forEach>
								</div>
							</p>

						</div>
					</section>
				</div>

				<div class="posts">
					<h1 class="content-subhead">Recommendations</h1>



					<section class="post">

						<div class="post-description">
							<div class="post-images pure-g">
								<div class="pure-u-1 pure-u-md-1-2">
									<a href="add.jsp?city=${randomRecTrips.city}&state=${randomRecTrips.state}">
										<img alt=""
										class="pure-img-responsive"
										src="img/${randomRecTrips.imgUrl}">
									</a>

									<div class="post-image-meta">
										<h3>${randomRecTrips.city}, ${randomRecTrips.state}</h3>
									</div>
								</div>

								<div class="pure-u-1 pure-u-md-1-2">
									<a href="http://www.flickr.com/photos/uberlife/8907351301/">
										<img alt="Photo of the sunset on the beach"
										class="pure-img-responsive"
										src="http://farm8.staticflickr.com/7382/8907351301_bd7460cffb.jpg">
									</a>

									<div class="post-image-meta">
										<h3>JSConf Photos</h3>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>

				<div class="footer">
					<div class="pure-menu pure-menu-horizontal">
						<ul>
							<li class="pure-menu-item"><a href="http://purecss.io/"
								class="pure-menu-link">About</a></li>
							<li class="pure-menu-item"><a
								href="http://twitter.com/yuilibrary/" class="pure-menu-link">Twitter</a></li>
							<li class="pure-menu-item"><a
								href="http://github.com/yahoo/pure/" class="pure-menu-link">GitHub</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>