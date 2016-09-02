<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
<link rel="stylesheet" href="css/layouts/blog.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit View</title>
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
					<li class="nav-item"><a class="pure-button" href="results.jsp">List</a></li>
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
					<section class="post"> <header class="post-header">

					<h2 class="post-title">Upcoming Trips:</h2>

					</header>

					<div class="post-description">
						<p>
						<form class="pure-form" action="EditTrip.do" method="POST">
		<c:forEach var="trip" items="${sessionScope.triplist}">
			<c:choose>
    				<c:when test="${param.tripID == trip.value.index}">
        				<li><input type="text" name="city" value="${trip.value.city}"></li>
        				<li><input type="text" name="state" value="${trip.value.state}"></li>
        				<li><input type="date" name="startDate" value="${trip.value.startDate}"></li>
        				<li><input type="date" name="endDate" value="${trip.value.endDate}"></li>
        				<li><input type="hidden" name="index" value="${trip.value.index}"></li>
        				<li><input type="submit" value="submit"></li>
					<li>	<input type="submit" name="delete" value="Delete"></li>		
    				</c:when>
			</c:choose>
		</c:forEach>
	</form>
						</p>


					</div>
					</section>
				</div>

				<div class="posts">
					<h1 class="content-subhead">Recent Posts</h1>



					<section class="post">

					<div class="post-description">
						<div class="post-images pure-g">
							<div class="pure-u-1 pure-u-md-1-2">
								<a href="http://www.flickr.com/photos/uberlife/8915936174/">
									<img alt="Photo of someone working poolside at a resort"
									class="pure-img-responsive"
									src="http://farm8.staticflickr.com/7448/8915936174_8d54ec76c6.jpg">
								</a>

								<div class="post-image-meta">
									<h3>CSSConf Photos</h3>
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