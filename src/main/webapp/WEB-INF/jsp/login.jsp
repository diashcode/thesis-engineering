<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Login</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">
	<!-- Price Slider Stylesheets -->
	<link rel="stylesheet" href="vendor/nouislider/nouislider.css">
	<!-- Google fonts - Playfair Display-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
	<!-- Google fonts - Poppins-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
	<!-- swiper-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
	<!-- Magnigic Popup-->
	<link rel="stylesheet" href="vendor/magnific-popup/magnific-popup.css">
	<!-- theme stylesheet-->
	<link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
	<!-- Custom stylesheet - for your changes-->
	<link rel="stylesheet" href="css/custom.css">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/favicon.png">
	<!-- Tweaks for older IEs--><!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
	<!-- Font Awesome CSS-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid px-3">
	<div class="row min-vh-100">
		<div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
			<div class="w-100 py-5 px-md-5 px-xl-6 position-relative">
				<div class="mb-5"><p>Taxi Service</p><!--<img src="img/logo-square.svg" alt="..." style="max-width: 4rem;" class="img-fluid mb-3">-->
					<h2>Welcome back</h2>
				</div>
				<form role = "form" method="post" action = "/login" class="form-validate">
					<div class="form-group">
						<label for="loginUsername" class="form-label"> Username</label>
						<input name="username" id="loginUsername" type="text" placeholder="username" autocomplete="off" required data-msg="Please enter your username" class="form-control">
					</div>
					<div class="form-group mb-4">
						<div class="row">
							<div class="col">
								<label for="loginPassword" class="form-label"> Password</label>
							</div>
<%--							<div class="col-auto"><a href="#" class="form-text small">Forgot password?</a></div>--%>
						</div>
						<input name="password" id="loginPassword" placeholder="Password" type="password" required data-msg="Please enter your password" class="form-control">
					</div>
					<!-- Submit-->
					<button type="submit" class="btn btn-lg btn-block btn-primary">Sign in</button>
					<hr class="my-4">
					<p class="text-center"><small class="text-muted text-center">Don't have an account yet? <a href="<c:url value='/signup'/>">Sign Up</a></small></p>
				</form>
				<a href="<c:url value='/welcome'/>" class="close-absolute mr-md-5 mr-xl-6 pt-5">
					<svg class="svg-icon w-3rem h-3rem">
						<use xlink:href="#close-1"> </use>
					</svg></a>
			</div>
		</div>
		<div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
			<!-- Image-->
			<div style="background-image: url(img/photo/photo-1497436072909-60f360e1d4b1.jpg);" class="bg-cover h-100 mr-n3"></div>
		</div>
	</div>
</div>
<!-- JavaScript files-->
<script>
	// ------------------------------------------------------- //
	//   Inject SVG Sprite -
	//   see more here
	//   https://css-tricks.com/ajaxing-svg-sprite/
	// ------------------------------------------------------ //
	function injectSvgSprite(path) {

		var ajax = new XMLHttpRequest();
		ajax.open("GET", path, true);
		ajax.send();
		ajax.onload = function(e) {
			var div = document.createElement("div");
			div.className = 'd-none';
			div.innerHTML = ajax.responseText;
			document.body.insertBefore(div, document.body.childNodes[0]);
		}
	}
	// to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
	// use your own URL in production, please :)
	// https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
	//- injectSvgSprite('icons/orion-svg-sprite.svg');
	injectSvgSprite('https://demo.bootstrapious.com/directory/1-1/icons/orion-svg-sprite.svg');

</script>
<!-- jQuery-->
<script src="vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Magnific Popup - Lightbox for the gallery-->
<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
<!-- Smooth scroll-->
<script src="vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
<!-- Bootstrap Select-->
<script src="vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
<!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
<script src="vendor/object-fit-images/ofi.min.js"></script>
<!-- Swiper Carousel                       -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script>var basePath = ''</script>
<!-- Main Theme JS file    -->
<script src="js/theme.js"></script>
</body>
</html>