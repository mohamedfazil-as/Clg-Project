<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Student</title>
<!-- Bootstrap 4 CDN -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	padding-top: 50px;
}

.container {
	margin-top: 50px;
}

.form-container {
	background-color: white;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	padding: 30px;
	border-radius: 8px;
}

.form-header {
	text-align: center;
	margin-bottom: 20px;
}

.form-header h2 {
	color: #007bff;
}

.form-group input {
	border-radius: 5px;
}

.btn-search {
	width: 100%;
	background-color: #007bff;
	color: white;
	border: none;
	padding: 12px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
}

.btn-search:hover {
	background-color: #0056b3;
}

.back-link {
	position: fixed;
	top: 20px;
	right: 20px;
	font-size: 14px; /* Small text size */
	padding: 8px 15px;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	border-radius: 4px;
	transition: background-color 0.3s;
}

.back-link:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="form-container">
					<div class="form-header">
						<h2>Search Student</h2>
					</div>
					<form action="SearchStudentServlet" method="post">
						<div class="form-group">
							<label for="id">Enter Student ID</label> <input type="text"
								class="form-control" id="id" name="id" required>
						</div>
						<button type="submit" class="btn-search">Search</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<a href="dashboard.jsp" class="btn btn-primary back-link">Back to
		Dashboard</a>
	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
