<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Generate PaySlip</title>
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
    
    <header class="site-header style-two style-seven">

        <nav class="navbar navbar-expand-lg navbar-light header-navigation stricky header-style-two">
            <div class="container clearfix">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="logo-box clearfix">
                    <a class="navbar-brand" href>

                    </a>
                    <button class="menu-toggler" data-target="#main-nav-bar">
                        <span class="fa fa-bars"></span>
                    </button>
                </div><!-- /.logo-box -->

                <!-- Collect the nav links, forms, and other content for toggling -->
               <div class="main-navigation" id="main-nav-bar">
                    <ul class=" navigation-box">
                        <li class=" current">
                            <a href="welcome">Home</a>
                        </li>
                        <li>
                            <a href="all-users">All Employees</a>
                        </li>
                        <li>
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

    <div class="inner-banner-two text-left">
        <div class="container">
            <ul class="breadcrumb">
                <li>
                    <a href="#">Home</a>
                </li>
                <li>
                    <a href="#">Manage</a>
                </li>
                <li>
                    <span>Generate PaySlip</span>
                </li>
            </ul><!-- /.breadcrumb -->
        </div><!-- /.container -->
    </div><!-- /.inner-banner -->
    
    <section class="careers-page sec-pad">
        <div class="container" id="myfrm">
                        <div class="table-box-content">
                            <div class="title-box">
                                <h3>Final PaySlip for <span id="name">${user.firstname } ${user.lastname }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email: <span id="email">${user.email }</span></h3>
                                <h3>Designation : <span id="designation">${user.pos }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="phone">Phone: ${user.phone }</span></h3>
                                <h4>for the month of <span id="month">${month } ${year}</span></h4>
                            </div><!-- /.title-box -->


                            <div class="table-wrapper">
                                <!-- store total salary in hidden field -->
                                <!-- store total salary (from DB) -->
                                    <input type="hidden" id="totalSalary" value="${user.salary}" />
                                        <input type="hidden" id="extraDeduction" value="${deduction}" />

                                    <table id="job-details-table" class="table">
                                        <tr>
                                            <th>Earnings</th>
                                            <th>Amount</th>
                                        </tr>
                                        <tr>
                                            <td class="job-title">Basic Salary</td>
                                            <td id="basic"></td>
                                        </tr>
                                        <tr>
                                            <td class="job-title">HRA</td>
                                            <td id="hra"></td>
                                        </tr>
                                        <tr>
                                            <td class="job-title">Special Allowance</td>
                                            <td id="specialAllowance"></td>
                                        </tr>
                                        <tr>
                                            <td class="job-title">Other Allowance</td>
                                            <td id="otherAllowance"></td>
                                        </tr>
                                        <tr>
                                            <td class="job-title"><strong>Gross Salary</strong></td>
                                            <td id="grossSalary"></td>
                                        </tr>

                                        <tr>
                                            <th>Deductions</th>
                                            <th>Amount</th>
                                        </tr>
                                        <tr>
                                            <td class="job-title">Provident Fund (12% of Basic)</td>
                                            <td id="pf"></td>
                                        </tr>
                                        <tr>
                                            <td class="job-title">Professional Tax (fixed)</td>
                                            <td id="pt"></td>
                                        </tr>
                                        <tr>
                                            <td class="job-title">Income Tax (TDS)</td>
                                            <td id="tds"></td>
                                        </tr>
                                        <tr>
                                            <td class="job-title"><strong>Total Deductions</strong></td>
                                            <td id="totalDeductions"></td>
                                        </tr>
                                        <c:if test="${not empty deduction and deduction != 0}">
                                        <tr>
                                            <td class="job-title">Deduction Reason</td>
                                            <td id="deductionReason">${deductionReason}</td>
                                        </tr>
                                        <tr>
                                            <td class="job-title">Extra Deduction</td>
                                            <td id="extraDeductionDisplay">${deduction}</td>
                                        </tr>
                                        </c:if>
                                        <tr>
                                            <td class="job-title"><strong>Net Salary (Take Home)</strong></td>
                                            <td id="netSalary"></td>
                                        </tr>
                                    </table>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        
                                        <button type="button" onclick="myPrint('myfrm')" class="thm-btn">Print Pay-Slip</button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;
                                        &nbsp;&nbsp;
                                        <form id="serverEmailForm" method="post" action="${pageContext.request.contextPath}/email-payslip" style="display:inline;">
                                            <input type="hidden" id="hiddenEmail" name="email" value="" />
                                            <input type="hidden" id="hiddenMonth" name="month" value="" />
                                            <input type="hidden" id="hiddenYear" name="year" value="" />
                                            <input type="hidden" id="hiddenPdf" name="pdf" value="false" />
                                            <button type="submit" class="thm-btn" onclick="prepareServerEmail();">Email Pay-Slip</button>
                                        </form>

                                
                            </div><!-- /.table-box-content -->
                        </div><!-- /.table-wrapper -->
                    </div><!-- /.left-content -->
        </div><!-- /.container -->
    </section><!-- /.team-page -->

    





</div><!-- /.page-wrapper -->
<a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-long-arrow-up"></i></a>
<!-- /.scroll-to-top -->



<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/isotope.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<script src="js/theme.js"></script>
<script src="js/smtp.js"></script>
<!-- html2canvas + jsPDF for client-side PDF generation -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

										<script>
                                            // Fetch total salary from DB
                                            var totalSalary = parseInt(document.getElementById("totalSalary").value.replace(/,/g, '')) || 0;

                                            // Earnings
                                            var basic = Math.round(totalSalary * 0.50);      // 50% of total
                                            var hra = Math.round(basic * 0.40);              // 40% of Basic
                                            var specialAllowance = Math.round(totalSalary * 0.20);  // 15% of total
                                            var otherAllowance = Math.round(totalSalary * 0.10);

                                            var grossSalary = basic + hra + specialAllowance + otherAllowance;

                                            // Deductions
                                            var pf = Math.round(basic * 0.12);              // 12% of Basic
                                            var pt = 200;                                   // fixed
                                            var tds = 10000;                                // fixed
                                            var extraDeduction = parseInt(document.getElementById("extraDeduction").value) || 0;
                                            var totalDeductions = pf + pt + tds + extraDeduction;

                                            // Net Salary
                                            var netSalary = grossSalary - totalDeductions;

                                            // Populate table
                                            document.getElementById("basic").textContent = basic.toLocaleString();
                                            document.getElementById("hra").textContent = hra.toLocaleString();
                                            document.getElementById("specialAllowance").textContent = specialAllowance.toLocaleString();
                                            document.getElementById("otherAllowance").textContent = otherAllowance.toLocaleString();
                                            document.getElementById("grossSalary").textContent = grossSalary.toLocaleString();
                                            document.getElementById("pf").textContent = pf.toLocaleString();
                                            document.getElementById("pt").textContent = pt.toLocaleString();
                                            document.getElementById("tds").textContent = tds.toLocaleString();
                                            document.getElementById("totalDeductions").textContent = totalDeductions.toLocaleString();
                                            document.getElementById("netSalary").textContent = netSalary.toLocaleString();
                                            // Show or hide deduction reason and extra deduction rows
                                            try {
                                                if (extraDeduction > 0) {
                                                    document.getElementById('deductionReason').parentElement.style.display = '';
                                                    document.getElementById('extraDeductionDisplay').parentElement.style.display = '';
                                                } else {
                                                    if(document.getElementById('deductionReason')) document.getElementById('deductionReason').parentElement.style.display = 'none';
                                                    if(document.getElementById('extraDeductionDisplay')) document.getElementById('extraDeductionDisplay').parentElement.style.display = 'none';
                                                }
                                            } catch (e) {
                                                // ignore if elements not present
                                            }
                                        </script>

                                        
                                        <script>
									        function myPrint(myfrm) {
									            var printdata = document.getElementById(myfrm);
									            newwin = window.open("");
									            newwin.document.write(printdata.outerHTML);
									            newwin.print();
									            newwin.close();
									        }
									    </script>
									    
                                        <script type="text/javascript">
    // admin mail helpers: plain text mail and PDF attachment mail
    var name = (document.getElementById('name') && document.getElementById('name').textContent) || '';
    var email = (document.getElementById('email') && document.getElementById('email').textContent) || '';
    var phone = (document.getElementById('phone') && document.getElementById('phone').textContent) || '';
    var month = (document.getElementById('month') && document.getElementById('month').textContent) || '';

    function buildMessage() {
        return "Hii  " + name + ",\n" + "your PaySlip for the month of " + month + " is generated.\nFor details contact branch office.\nThank you.";
    }

    function sendEmail() {
        // Use server-side mail: populate hidden fields and submit form (no client SMTP credentials here)
        document.getElementById('hiddenEmail').value = email;
        // month variable already contains "Month Year" span text; split if necessary
        var parts = month.split(' ');
        document.getElementById('hiddenMonth').value = parts[0] || '';
        document.getElementById('hiddenYear').value = parts[1] || '';
        document.getElementById('hiddenPdf').value = 'false';
        document.getElementById('serverEmailForm').submit();
    }

    function prepareServerEmail() {
        // populate hidden fields before submitting serverEmailForm
        document.getElementById('hiddenEmail').value = email;
        var parts = month.split(' ');
        document.getElementById('hiddenMonth').value = parts[0] || '';
        document.getElementById('hiddenYear').value = parts[1] || '';
        // If caller wants to request PDF generation on server, set hiddenPdf to true; default behavior is false.
        // When Email Pay-Slip (Server) button is clicked we keep default 'false' which instructs server to render PDF
        // (server PdfService will build the PDF from data). If you want to explicitly request PDF generation flag, set it here.
    }

    function blobToBase64(blob) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.onloadend = function () {
                const dataUrl = reader.result; // data:*/*;base64,....
                const base64 = dataUrl.split(',')[1];
                resolve(base64);
            };
            reader.onerror = reject;
            reader.readAsDataURL(blob);
        });
    }

    </script>
</body>
</html>
