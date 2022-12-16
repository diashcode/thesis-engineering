<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Welcome to Taxi Service App!</title>
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
                    <li class="nav-item"><a href="<c:url value='/welcome'/>" class="nav-link">Find travel</a></li>
                    <li class="nav-item"><a href="<c:url value='/travel-offer'/>" class="nav-link">Offer travel</a></li>
                    <li class="nav-item"><a href="<c:url value='/add-car'/>" class="nav-link">Add car</a></li>
                    <li class="nav-item dropdown"><a id="docsDropdownMenuLink" href="index.html" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle "> Info</a>
                        <div aria-labelledby="docsDropdownMenuLink" class="dropdown-menu dropdown-menu-right">
                            <div class="dropdown-divider"></div>
                            <h6 class="dropdown-header font-weight-normal">Travels</h6>
                            <a href="<c:url value='/travels-offered'/>" class="dropdown-item">Travels offered </a>
                            <a href="<c:url value='/travels-booked'/>" class="dropdown-item">Travels booked </a>
                        </div>
                    </li>
                    <li class="nav-item dropdown ml-lg-3"><a id="userDropdownMenuLink" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <img src="img/avatar/avatar-101.jpg" alt="" class="avatar avatar-sm avatar-border-white mr-2"></a>
                        <div aria-labelledby="userDropdownMenuLink" class="dropdown-menu dropdown-menu-right">
                            <div class="dropdown-divider"></div><a href="<c:url value='/logout'/>" class="dropdown-item"><i class="fas fa-sign-out-alt mr-2 text-muted"></i> Sign out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- /Navbar -->
</header>
<section class="py-5">
    <form action="/editprofile/save" method="post">
        <div class="container">
            <h1 class="h2 mb-5"> Your personal information  </h1>
            <div class="row form-block">
                <div class="col-lg-4">
                    <h4>Photos</h4>
                    <p class="text-muted text-sm">Photo</p>
                </div>
                <div class="col-lg-7 ml-auto">
                    <div class="form-group">
                        <form id="demo-upload" action="/upload" class="dropzone">
                            <div class="dz-message text-muted">
                                <p>Drop files here or click to upload.</p>
                                <p><span class="note">Here is for uploading photo.</span></p>
                            </div>
                        </form>
                    </div>
                    <div id="dropzoneTemplate" class="d-none">
                        <div class="dz-preview dz-file-preview">
                            <div class="dz-image"><img data-dz-thumbnail="" alt="" src="img/logo-square.svg"></div>
                            <div class="dz-details">
                                <div class="dz-filename"><span data-dz-name=""></span></div>
                                <div data-dz-size="" class="dz-size"></div>
                            </div>
                            <div class="dz-progress"><span data-dz-uploadprogress="" class="dz-upload"></span></div>
                            <div class="dz-success-mark"><span class="dz-icon"><i class="fa-check fa"></i></span></div>
                            <div class="dz-error-mark"><span class="dz-icon"><i class="fa-times fa"></i></span></div>
                            <div class="dz-error-message"><span data-dz-errormessage=""></span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row form-block">
                <div class="col-lg-4">
                    <h4>Basic</h4>
                    <p class="text-muted text-sm">Your basic info. Fill please</p>
                </div>
                <div class="col-lg-7 ml-auto">
                    <div class="form-group"></div>
                    <div class="form-group">
                        <label for="form_name" class="form-label">Name</label>
                        <input name="name"  class="form-control" value = "${user.name}">
                    </div>
                    <div class="form-group">
                        <label for="form_type" class="form-label">Usename</label>
                        <input name="username"  class="form-control" value = "${user.username}">
                    </div>
                    <div class="form-group">
                        <label for="form_type" class="form-label">E-mail</label>
                        <input name="email"  class="form-control" value="${user.email}">
                    </div>
                    <div class="form-group">
                        <label for="form_type" class="form-label">BirthDate</label>
                        <input name="BirthDate"  class="form-control" value="${user.birthDate}">
                    </div>
                    <div class="form-group">
                        <label for="form_type" class="form-label">Phone number</label>
                        <input name="phoneNumber"  class="form-control" value="${user.phoneNumber}">
                    </div>
                </div>
            </div>
            <div class="row form-block flex-column flex-sm-row">
                <div class="col text-center text-sm-right">
                    <button type="submit" class="btn btn-primary px-3">Save</button>
                    <!--<a href="user-add-5.html" class="btn btn-primary px-3">Save</a>-->
                </div>
            </div>
        </div>
    </form>
</section>
<!-- Footer-->
<footer class="position-relative z-index-10 d-print-none">
    <!-- Main block - menus, subscribe form-->
    <div class="py-6 bg-gray-200 text-muted">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <div class="font-weight-bold text-uppercase text-dark mb-3">Directory</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
                    <ul class="list-inline">
                        <li class="list-inline-item"><a href="#" target="_blank" title="twitter" class="text-muted text-hover-primary"><i class="fab fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="facebook" class="text-muted text-hover-primary"><i class="fab fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="instagram" class="text-muted text-hover-primary"><i class="fab fa-instagram"></i></a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="pinterest" class="text-muted text-hover-primary"><i class="fab fa-pinterest"></i></a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="vimeo" class="text-muted text-hover-primary"><i class="fab fa-vimeo"></i></a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
                    <h6 class="text-uppercase text-dark mb-3">Rentals</h6>
<%--                    <ul class="list-unstyled">--%>
<%--                        <li><a href="index.html" class="text-muted">Rooms     </a></li>--%>
<%--                        <li><a href="category-rooms.html" class="text-muted">Map on top     </a></li>--%>
<%--                        <li><a href="category-2-rooms.html" class="text-muted">Side map     </a></li>--%>
<%--                        <li><a href="category-3-rooms.html" class="text-muted">No map     </a></li>--%>
<%--                        <li><a href="detail-rooms.html" class="text-muted">Room detail     </a></li>--%>
<%--                    </ul>--%>
                </div>
                <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
                    <h6 class="text-uppercase text-dark mb-3">Pages</h6>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-muted">Contact                                   </a></li>
                        <li><a href="#" class="text-muted">Pricing                                   </a></li>
                        <li><a href="#" class="text-muted">Text page                                   </a></li>
<%--                        <li><a href="faq.html" class="text-muted">F.A.Q.s  <span class="badge badge-info ml-1">New</span>                                   </a></li>--%>
<%--                        <li><a href="coming-soon.html" class="text-muted">Coming soon                                   </a></li>--%>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <h6 class="text-uppercase text-dark mb-3">Daily Offers & Discounts</h6>
                    <p class="mb-3"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. At itaque temporibus.</p>
                    <form action="#" id="newsletter-form">
                        <div class="input-group mb-3">
                            <input type="email" placeholder="Your Email Address" aria-label="Your Email Address" class="form-control bg-transparent border-dark border-right-0">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-outline-dark border-left-0"> <i class="fa fa-paper-plane text-lg"></i></button>
                            </div>
                        </div>
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
                    <p class="text-sm mb-md-0">&copy; 2022 Your company.  All rights reserved.</p>
                </div>
                <div class="col-md-6">
                    <ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-right">
                        <li class="list-inline-item"><img src="img/visa.svg" alt="..." class="w-2rem"></li>
                        <li class="list-inline-item"><img src="img/mastercard.svg" alt="..." class="w-2rem"></li>
                        <li class="list-inline-item"><img src="img/paypal.svg" alt="..." class="w-2rem"></li>
                        <li class="list-inline-item"><img src="img/western-union.svg" alt="..." class="w-2rem"></li>
                    </ul>
                </div>
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
<!-- Dropzone.js-->
<script src="vendor/dropzone/dropzone.js"></script>
<!-- Dropzone Init-->
<script src="js/forms-dropzone.js">    </script>
</body>
</html>