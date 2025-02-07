<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Register Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <div class="card mx-auto p-4" style="max-width: 400px;">
        <h2 class="text-center">User Registration</h2>
        <form action="RegisterServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">UserName</label>
                <input type="text" class="form-control" name="username" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Register</button>
        </form>
        <p class="mt-3 text-center">Already registered? <a href="index.jsp">Login Here</a></p>
    </div>
</body>
</html>
