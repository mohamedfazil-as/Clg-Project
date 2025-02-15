<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>Error Page</title></head>
<body>
    <h2>Error Occurred</h2>
    <p style="color: red;">
        <%= request.getAttribute("errorMessage") %>
    </p>
    <a href="<%= request.getAttribute("returnpage") %>">Go Back</a>
</body>
</html>
