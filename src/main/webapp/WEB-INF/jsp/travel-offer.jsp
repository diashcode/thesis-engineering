<%--
  Created by IntelliJ IDEA.
  User: Diana
  Date: 4/17/2022
  Time: 11:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Travel offer</title>
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
<body style="padding-top: 72px;">
<header class="header">
    <!-- Navbar-->
    <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
        <div class="container-fluid">
            <div class="d-flex align-items-center"><a href="<c:url value='/welcome'/>" class="navbar-brand py-1"><p>Taxi Service</p><!--<img src="img/logo.svg" alt="Directory logo">--></a>
            </div>
            <button type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
            <!-- Navbar Collapse -->
            <div id="navbarCollapse" class="collapse navbar-collapse">
                <form action="#" id="searchcollapsed" class="form-inline mt-4 mb-2 d-sm-none">
                    <div class="input-label-absolute input-label-absolute-left input-reset w-100">
                        <label for="searchcollapsed_search" class="label-absolute"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                        <input id="searchcollapsed_search" placeholder="Search" aria-label="Search" class="form-control form-control-sm border-0 shadow-0 bg-gray-200">
                        <button type="reset" class="btn btn-reset btn-sm"><i class="fa-times fas">           </i></button>
                    </div>
                </form>
                <ul class="navbar-nav ml-auto">
                    <!-- /Megamenu end-->
                    <li class="nav-item"><a href="<c:url value='/travel-offer'/>" class="nav-link">Offer travel</a>
                    </li>
                    <li class="nav-item"><a href="<c:url value='/login'/>" class="nav-link">Sign in</a></li>
                    <li class="nav-item"><a href="<c:url value='/signup'/>" class="nav-link">Sign up</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- /Navbar -->
</header>
<section class="hero-home">
    <div class="swiper-container hero-slider">
        <div class="swiper-wrapper dark-overlay">
            <div style="background-image:url(img/photo/lake.jpg)" class="swiper-slide"></div>
            <div style="background-image:url(img/photo/star.jpg)" class="swiper-slide"></div>
            <div style="background-image:url(img/photo/kyrgyzstan.jpg)" class="swiper-slide"></div>
            <div style="background-image:url(img/photo/horse.jpg)" class="swiper-slide"></div>
        </div>
    </div>
    <div class="container py-6 py-md-7 text-white z-index-20">
        <div class="row">
            <div class="col-xl-10">
                <div class="text-center text-lg-left">
                    <p class="subtitle letter-spacing-4 mb-2 text-secondary text-shadow">Welcome to Taxi Service App!</p>
                    <h1 class="display-3 font-weight-bold text-shadow">I am driving </h1>
                </div>
                <div class="search-bar mt-5 p-3 p-lg-1 pl-lg-4">
                    <form role = "form" method="post" action="/travel-offer">
                        <div class="row">
                            <div class="col-lg-4 d-flex align-items-center form-group">
                                <input type="text" name="pickup" placeholder="From" class="form-control border-0 shadow-0">
                            </div>
                            <div class="col-lg-4 d-flex align-items-center form-group">
                                <div class="input-label-absolute input-label-absolute-right w-100">
                                    <label for="location" class="label-absolute"><span class="sr-only">City</span></label>
                                    <input type="text" name="destination" placeholder="To" id="location" class="form-control border-0 shadow-0">
                                </div>
                            </div>
                            <div class="col-lg-4 d-flex align-items-center form-group no-divider">
                                <input name = "travelDate" placeholder="When" type="text" class="form-control border-0 shadow-0 datetimepicker-input" data-target="#datetimepicker4"/>
                                <div class="input-group-append" data-target="#datetimepicker4" data-toggle="datetimepicker">

                                </div>
                                <!--<div class="input-group date" id="datetimepicker4" data-target-input="nearest">

                                </div>-->
                            </div>
                            <div class="col-lg-4 d-flex align-items-center form-group">
                                <input type="text" name="price" placeholder="Price" class="form-control border-0 shadow-0">
                            </div>
                            <div class="col-lg-4 d-flex align-items-center form-group">
                                <input type="text" name="seats" placeholder="Number of seats" class="form-control border-0 shadow-0">
                            </div>
                            <div class="col-lg-4">
                                <button type="submit" class="btn btn-primary btn-block rounded-xl h-100">Offer </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="hero-home">
    <div class="swiper-container hero-slider">
        <div class="swiper-wrapper dark-overlay">
            <div style="background-image:url(img/photo/kyrgyzstan.jpg)" class="swiper-slide"></div>
            <div style="background-image:url(img/photo/lake.jpg)" class="swiper-slide"></div>
            <div style="background-image:url(img/photo/horse.jpg)" class="swiper-slide"></div>
            <div style="background-image:url(img/photo/star.jpg)" class="swiper-slide"></div>
        </div>
    </div>
    <div class="container py-6 py-md-7 text-white z-index-20">
        <div class="row">
            <div class="col-xl-10">
                <div class="text-center text-lg-left">
                    <h1 class="display-3 font-weight-bold text-shadow">I am a taxi driver in  </h1>
                </div>
                <div class="search-bar mt-5 p-3 p-lg-1 pl-lg-4">
                    <form role = "form" method="post" action="/incity-taxi-offer">
                        <div class="row">
                            <div class="col-lg-6 d-flex align-items-center form-group">
                                <input type="text" name="city" placeholder="Enter a city" class="form-control border-0 shadow-0">
                            </div>
                            <div class="col-lg-6">
                                <button type="submit" class="btn btn-primary btn-block rounded-xl h-100">Let all know </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Footer-->
<footer class="position-relative z-index-10 d-print-none">
    <!-- Main block - menus, subscribe form-->
    <div class="py-6 bg-gray-200 text-muted">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <div class="font-weight-bold text-uppercase text-dark mb-3">Taxi Service</div>
                    <p>Taxi Service is free to use.</p>
                    <ul class="list-inline">
                        <li class="list-inline-item"><a href="#" target="_blank" title="twitter" class="text-muted text-hover-primary"><i class="fab fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="facebook" class="text-muted text-hover-primary"><i class="fab fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="instagram" class="text-muted text-hover-primary"><i class="fab fa-instagram"></i></a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="pinterest" class="text-muted text-hover-primary"><i class="fab fa-pinterest"></i></a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="vimeo" class="text-muted text-hover-primary"><i class="fab fa-vimeo"></i></a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
                    <ul class="list-unstyled">
                        <li><a href="index.html" class="text-muted">How it works    </a></li>
                        <li><a href="category-rooms.html" class="text-muted">About us     </a></li>
                        <li><a href="category-2-rooms.html" class="text-muted">Frequently asked questions     </a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
                    <ul class="list-unstyled">
                        <li><a href="contact.html" class="text-muted">Contact</a></li>
                        <li><a href="pricing.html" class="text-muted">Terms and conditions</a></li>
                        <li><a href="text.html" class="text-muted">Text page </a></li>
                    </ul>
                </div>
                <div class="col-lg-4">
<%--                    <h6 class="text-uppercase text-dark mb-3">Language</h6>--%>
<%--                    <form action="#" id="newsletter-form">--%>
<%--                        <select title="Language" data-style="btn-form-control" class="selectpicker">--%>
<%--                            <option value="small">Russian</option>--%>
<%--                            <option value="medium">Kyrgyz</option>--%>
<%--                            <option value="large">German</option>--%>
<%--                            <option value="x-large">English</option>--%>
<%--                        </select>--%>
<%--                    </form>--%>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright section of the footer-->
    <div class="py-4 font-weight-light bg-gray-800 text-gray-300">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-left">
                    <p class="text-sm mb-md-0">&copy; 2022 Taxi Service.  All rights reserved.</p>
                </div>
                <!--<div class="col-md-6">
                  <ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-right">
                    <li class="list-inline-item"><img src="img/visa.svg" alt="..." class="w-2rem"></li>
                    <li class="list-inline-item"><img src="img/mastercard.svg" alt="..." class="w-2rem"></li>
                    <li class="list-inline-item"><img src="img/paypal.svg" alt="..." class="w-2rem"></li>
                    <li class="list-inline-item"><img src="img/western-union.svg" alt="..." class="w-2rem"></li>
                  </ul>
                </div>-->
            </div>
        </div>
    </div>
</footer>
<!-- /Footer end-->
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
<script type="text/javascript">
    $(function () {
        $('#datetimepicker4').datetimepicker({
            format: 'DD/MM/YYYY'
        });
    });
</script>
</body>
</html>