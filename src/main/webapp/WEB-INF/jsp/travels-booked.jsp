<%--
  Created by IntelliJ IDEA.
  User: Diana
  Date: 4/29/2022
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Travels booked</title>
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
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="<c:url value='/travel-offer'/>" class="nav-link">Offer travel</a></li>
                    <li class="nav-item"><a href="<c:url value='/welcome'/>" class="nav-link">Find travel</a></li>
                    <li class="nav-item dropdown"><a id="docsDropdownMenuLink" href="index.html" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle "> Info</a>
                        <div aria-labelledby="docsDropdownMenuLink" class="dropdown-menu dropdown-menu-right">
                            <h6 class="dropdown-header font-weight-normal">User's info</h6>
                            <a href="<c:url value='/editprofile'/>" class="dropdown-item">Profile </a>
                            <!--<a href="docs/docs-directory-structure.html" class="dropdown-item">Directory structure </a>
                            <a href="docs/docs-gulp.html" class="dropdown-item">Gulp </a>
                            <a href="docs/docs-customizing-css.html" class="dropdown-item">Customizing CSS </a>
                            <a href="docs/docs-credits.html" class="dropdown-item">Credits </a>
                            <a href="docs/docs-changelog.html" class="dropdown-item">Changelog </a>-->
                            <div class="dropdown-divider"></div>
                            <h6 class="dropdown-header font-weight-normal">Travels</h6>
                            <a href="<c:url value='/travels-booked'/>" class="dropdown-item">Travels booked </a>
                            <a href="<c:url value='/travels-offered'/>" class="dropdown-item">Travel offered </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- /Navbar -->
</header>
<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <p class="subtitle text-primary">Your booked travels</p>
                <div class="text-block">
                </div>
                <div class="text-block">
                    <div class="row mb-3">
                        <div class="col-lg-8 pl-xl-5">
                            <c:forEach items="${travelBookedInfoList}" var="travelBooked">
                                <form role = "form" method="post" action="/cancel-travel">
                                    <div class="card border-0 shadow">
                                        <div class="card-body p-4">
                                            <div class="text-block pb-3">
                                                <div class="media align-items-center">
                                                    <div class="media-body">
                                                        <h6> <a href="detail-rooms.html" class="text-reset">Travel booked</a></h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-block py-3">
                                                <ul class="list-unstyled mb-0">
                                                    <li class="mb-3">Travel Date</li>
                                                    <li class="mb-0">${travelBooked.pickup} <i class="fas fa-arrow-right fa-fw text-muted mx-3"></i>Destination</li>
                                                </ul>
                                            </div>
                                            <div class="text-block pt-3 pb-0">
                                                <table class="w-100">
                                                    <tbody>
                                                    <tr>
                                                        <th class="font-weight-normal py-2">Booked seats</th>
                                                        <td class="text-right py-2">3</td>
                                                    </tr>
                                                    <tr>
                                                        <th class="font-weight-normal pt-2 pb-3">Price</th>
                                                        <td class="text-right pt-2 pb-3">800</td>
                                                    </tr>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr class="border-top">
                                                        <th class="pt-3">Driver's name</th>
                                                        <td class="font-weight-bold text-right pt-3">Tina</td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>
                        </div>
                    </div>
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
                        <li><a href="#" class="text-muted">How it works    </a></li>
                        <li><a href="#" class="text-muted">About us     </a></li>
                        <li><a href="#" class="text-muted">Frequently asked questions     </a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-muted">Contact</a></li>
                        <li><a href="#" class="text-muted">Terms and conditions</a></li>
                        <li><a href="#" class="text-muted">Text page </a></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <h6 class="text-uppercase text-dark mb-3">Language</h6>
                    <form action="#" id="newsletter-form">
                        <select title="Language" data-style="btn-form-control" class="selectpicker">
                            <option value="small">Russian</option>
                            <option value="medium">Kyrgyz</option>
                            <option value="large">German</option>
                            <option value="x-large">English</option>
                        </select>
                    </form>
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
</body>
</html>
