<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Generate Payroll</title>
    <!-- mobile responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" sizes="57x57" href="images/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="images/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="images/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="images/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="images/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="images/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="images/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="images/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
    <link rel="manifest" href="images/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="images/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">


    <!-- depdency stylesheet -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i%7CCovered+By+Your+Grace" rel="stylesheet">


    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/hover-min.css">
    <link rel="stylesheet" type="text/css" href="plugins/payonline-icon/style.css">
    <link rel="stylesheet" type="text/css" href="plugins/bands-icon/style.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.bxslider.min.css">
    
    

    <!-- main template stylesheet -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>

<div class="page-wrapper">

    <div class="preloader"></div><!-- /.preloader -->
    
    <header class="site-header ">


        <nav class="navbar navbar-expand-lg navbar-light header-navigation stricky header-style-two">
            <div class="container clearfix">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="logo-box clearfix">
                    <button class="menu-toggler" data-target="#main-nav-bar">
                        <span class="fa fa-bars"></span>
                    </button>
                </div><!-- /.logo-box -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="main-navigation" id="main-nav-bar">
                    <ul class=" navigation-box">
                        <li>
                            <a href="welcome">Home</a>
                        </li>
                        <li>
                            <a href="all-users">All Employees</a>
                        </li>
                        <li  class=" current">
                            <a href="manage">Manage Payroll</a>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
                <div class="right-side-box">
                    <a href="register" class="signin-btn">New</a>
                </div>
                <!-- /.right-side-box -->
            </div>
            <!-- /.container -->
        </nav>
    </header><!-- /.site-header -->

    <div class="inner-banner text-center">
        <div class="container">
            <ul class="breadcrumb">
                <li>
                    <a href="welcome">Home</a>
                </li>
                <li>
                    <span>Generate Payroll</span>
                </li>
            </ul><!-- /.breadcrumb -->
            <h1> Generate Payroll</h1>
        </div><!-- /.container -->
    </div><!-- /.inner-banner -->

    <section class="meeting-form-wrapper sec-pad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 d-flex">
                    <div class="meeting-form-content my-auto">
                        <div class="sec-title">
                            <span>Generate Payroll</span>
                            <h2>Generate payroll for our<br>Employee</h2>
                        </div><!-- /.sec-title -->
                        <div class="single-form-step">


                        </div><!-- /.single-form-step -->


                        </div><!-- /.single-form-step -->
                        <div class="single-form-step">


                        </div><!-- /.single-form-step -->
                    </div><!-- /.meeting-form-content -->
                </div><!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <form action="save-payslip" class="meeting-form contact-form" method="get">
                        <div class="row">
                                                        <div class="col-md-12">
                                                                <select id="emailSelect" class="selectpicker" name="email">
                                                                    <option value="">Select the Employee..</option>
                                                                    <c:forEach items="${users}" var="user">
                                                                    <option value="${user.email}">${user.email}</option>
                                                                    </c:forEach>
                                                                </select>
                                                        </div><!-- /.col-md-12 -->
                                                        <div class="col-md-12">
                                                                <select id="monthSelect" class="selectpicker" name="month">
                                  <option value="">Select the Month..</option>
								  <option value="January">January</option>
								  <option value="February">February</option>
								  <option value="March">March</option>
								  <option value="April">April</option>
								  <option value="May">May</option>
								  <option value="June">June</option>
								  <option value="July">July</option>
								  <option value="August">August</option>
								  <option value="September">September</option>
								  <option value="October">October</option>
								  <option value="November">November</option>
								  <option value="December">December</option>
								</select>
                            </div><!-- /.col-md-12 -->
                            <div class="col-md-6">
                                <input type="text" name="year" value="2025">
                            </div><!-- /.col-md-12 -->
                            <div class="col-md-6">
                                <input type="text" name="deduction" placeholder="Any extra Deductions ">
                            </div><!-- /.col-md-6 -->
                            <div class="col-md-12">
                                <input type="text" name="deductionReason" placeholder="Reason for extra deductions">
                            </div><!-- /.col-md-12 -->
                            <div class="col-md-12">
                                <div class="btn-box">
                                    <button type="submit" class="thm-btn">Generate</button>
                                    
                                </div><!-- /.btn-box -->
                            </div><!-- /.col-md-12 -->
                        </div><!-- /.row -->
                    </form><!-- /.meeting-form -->
                    <div class="result"></div><!-- /.result -->
                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </section><!-- /.meeting-form-wrapper -->











</div><!-- /.page-wrapper -->



<div class="search_area zoom-anim-dialog mfp-hide" id="test-search">
    <div class="search_box_inner">
        <div class="input-box">
            <input type="text" class="form-control" placeholder="Search for...">
            <span class="input-box-btn"> <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button> </span>
        </div>
    </div>
</div>


<a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-long-arrow-up"></i></a>
<!-- /.scroll-to-top -->


<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/isotope.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/theme.js"></script>

<script>
    // Ensure bootstrap-select reflects the current <select> options when the page loads.
    (function() {
        try {
            $(document).ready(function() {
                if ($.fn.selectpicker) {
                    $('#emailSelect').selectpicker('refresh');
                    $('#monthSelect').selectpicker('refresh');
                }
            });
        } catch (e) {
            // ignore if jQuery or selectpicker not available
            console.warn('Selectpicker refresh skipped', e);
        }
    })();
</script>

<script>
    // When the user navigates back to this page, some browsers restore the page from bfcache.
    // Listen to pageshow and refresh selectpicker to avoid stale UI/options.
    try {
        window.addEventListener('pageshow', function(event) {
            try {
                // Determine if this pageshow is due to back/forward (bfcache) restore
                var isBackNavigation = false;
                try {
                    isBackNavigation = !!event.persisted;
                } catch (x) {
                    isBackNavigation = false;
                }
                // Fallback check for Navigation Timing Level 2
                try {
                    if (!isBackNavigation && performance && performance.getEntriesByType) {
                        var nav = performance.getEntriesByType('navigation');
                        if (nav && nav.length && nav[0].type === 'back_forward') isBackNavigation = true;
                    }
                } catch (ex) {
                    // ignore
                }

                if (isBackNavigation) {
                    // Reset the form so selects and inputs are cleared when user returns via back
                    try {
                        var frm = document.querySelector('form.meeting-form.contact-form');
                        if (frm) {
                            frm.reset();
                        }
                    } catch (resetErr) {
                        console.warn('Form reset failed', resetErr);
                    }
                }

                // Always attempt to refresh selectpicker UI so it matches underlying <select>
                if ($.fn && $.fn.selectpicker) {
                    $('#emailSelect').selectpicker('refresh');
                    $('#monthSelect').selectpicker('refresh');
                }
            } catch (err) {
                console.warn('Error handling pageshow for selectpicker', err);
            }
        });
    } catch (e) {
        // ignore if environment doesn't support addEventListener
    }
</script>


</body>
</html>