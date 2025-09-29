<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Home</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
</head>
<body>
<div class="container mt-5">
    <div class="d-flex justify-content-end mb-3">
        <a href="logout" class="btn btn-danger">Logout</a>
    </div>
    <h2>Welcome, ${user.firstname} ${user.lastname}!</h2>
    <h4>Your Payslips</h4>
    <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <form action="view-payslip" method="post" class="row g-2 mb-3">
        <div class="col-auto">
            <select name="month" class="form-select">
                <option value="">Select month</option>
                <option>January</option>
                <option>February</option>
                <option>March</option>
                <option>April</option>
                <option>May</option>
                <option>June</option>
                <option>July</option>
                <option>August</option>
                <option>September</option>
                <option>October</option>
                <option>November</option>
                <option>December</option>
            </select>
        </div>
        <div class="col-auto">
            <input type="text" name="year" value="2025" class="form-control" />
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">View Generated Payslip</button>
        </div>
    </form>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Month</th>
            <th>Year</th>
            <th>Deduction</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="payslip" items="${payslips}">
            <tr>
                <td>${payslip.month}</td>
                <td>${payslip.year}</td>
                <td>${payslip.deduction}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
