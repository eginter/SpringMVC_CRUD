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
						<li class="nav-item"><a class="pure-button"  href="GeneratePage.do?add=true">Add</a>
						</li>
						<li class="nav-item"><a class="pure-button" href="GeneratePage.do?edit=true">Edit</a>
						</li>
						<li class="nav-item"><a class="pure-button"
							href="GeneratePage.do?list=true">List</a></li>
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


							

						</header>

						<div class="post-description">
							<p>	
								<jsp:include page="${snippet}" />
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
									<a href="GeneratePage.do?add=true&city=${randomRecTrips.city}&state=${randomRecTrips.state}">
										<img alt=""
										class="pure-img-responsive"
										src="img/${randomRecTrips.imgUrl}">
									</a>

									<div class="post-image-meta">
										<h3>${randomRecTrips.city}, ${randomRecTrips.state}</h3>
									</div>
								</div>

								<div class="pure-u-1 pure-u-md-1-2">
									<a href="GeneratePage.do?add=true&city=${randomRecTrips2.city}&state=${randomRecTrips2.state}">
										<img alt=""
										class="pure-img-responsive"
										src="img/${randomRecTrips2.imgUrl}">
									</a>

									<div class="post-image-meta">
										<h3>${randomRecTrips2.city}, ${randomRecTrips2.state}</h3>
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