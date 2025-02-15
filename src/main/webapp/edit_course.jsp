<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.student.mgmt.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Course</title>
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
			<h2>Edit Course</h2>
			<%
			String coursecode = request.getParameter("coursecode");
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * from course Where coursecode=?");
			ps.setString(1, coursecode);
			ResultSet rs = ps.executeQuery();
			rs.next();
			%>
			<form action="UpdateCourseServlet" method="post">
				<input type="hidden" name="coursecode" value="<%=rs.getString("coursecode")%>">

				<div class="mb-3">
					<label for="coursename" class="form-label"> Course Name</label> <input
						type="text" class="form-control" name="coursename"
						value="<%=rs.getString("coursename")%>" required>
				</div>

				<div class="mb-3">
					<label for="imple_date" class="form-label">Implementation Date </label> <input type="date"
						class="form-control" name="imple_date" value="<%=rs.getDate("imple_date")%>"
						required>
				</div>
				
				


				<button type="submit" class="btn btn-primary">Update</button>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
