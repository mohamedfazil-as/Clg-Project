<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h1 class="text-center">Student Management System</h1>
    <h3>Welcome, <%= session.getAttribute("username") %>!</h3>
    <div class="row mt-4">
        <div class="col-md-6">
            <a href="addStudent.jsp" class="btn btn-success btn-lg w-100 mb-2">➕ Add New Student</a>
        </div>
        <div class="col-md-6">
            <a href="searchStudent.jsp" class="btn btn-primary btn-lg w-100 mb-2">🔍 Search Student</a>
        </div>
        <div class="col-md-6">
            <a href="viewStudents.jsp" class="btn btn-info btn-lg w-100 mb-2">📋 View All Students</a>
        </div>
        <div class="col-md-6">
            <a href="LogoutServlet" class="btn btn-danger btn-lg w-100 mb-2">🚪 Logout</a>
        </div>
    </div>
</body>
</html>