<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.studentmanagement.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Student</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f4f6f9;
}

.container {
	max-width: 600px;
	margin-top: 50px;
}

.form-container {
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #007bff;
	margin-bottom: 20px;
	text-align: center;
}

.btn-primary {
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="form-container">
			<h2>Edit Student</h2>
			<%
			int id = Integer.parseInt(request.getParameter("id"));
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * from Students Where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			%>
			<form action="UpdateStudentServlet" method="post">
				<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

				<div class="mb-3">
					<label for="name" class="form-label">Name</label> <input
						type="text" class="form-control" name="name"
						value="<%=rs.getString("name")%>" required>
				</div>

				<div class="mb-3">
					<label for="dob" class="form-label">DOB</label> <input type="date"
						class="form-control" name="dob" value="<%=rs.getString("dob")%>"
						required>
				</div>

				<div class="mb-3">
					<label for="gender" class="form-label">Gender</label> <input
						type="text" class="form-control" name="gender"
						value="<%=rs.getString("gender")%>" required>
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">Email</label> <input
						type="email" class="form-control" name="email"
						value="<%=rs.getString("email")%>" required>
				</div>

				<div class="mb-3">
					<label for="mobile" class="form-label">Mobile</label> <input
						type="text" class="form-control" name="mobile"
						value="<%=rs.getString("mobile")%>" required>
				</div>

				<button type="submit" class="btn btn-primary">Update</button>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
