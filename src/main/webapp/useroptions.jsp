<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Options</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
</head>
<body>
<div class="container mt-5">
    <h2>Welcome, ${user.firstname} ${user.lastname}!</h2>
    <div class="mt-4">
        <a href="userhome" class="btn btn-primary me-2">View Your Payrolls</a>
        <a href="logout" class="btn btn-danger">Logout</a>
    </div>
</div>
</body>
</html>
