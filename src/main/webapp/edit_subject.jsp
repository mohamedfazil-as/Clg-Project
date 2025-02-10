<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.studentmanagement.DBConnection"%>
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
			<h2>Edit Subject</h2>
			<%
               String subjectcode = request.getParameter("subjectcode"); 
               Connection conn = DBConnection.getConnection();
               PreparedStatement ps = conn.prepareStatement("SELECT * from subjects Where subjectcode=?");
               ps.setString(1, subjectcode); 
               ResultSet rs = ps.executeQuery();
               rs.next();
%>           
          
			<form action="UpdateSubjectServlet" method="post">
				<input type="hidden" name="subjectcode" value="<%=rs.getString("subjectcode")%>">

				<div class="mb-3">
					<label for="subjectname" class="form-label"> Subject Name</label> <input
						type="text" class="form-control" name="subjectname"
						value="<%=rs.getString("subjectname")%>" required>
				</div>

				<div class="mb-3">
					<label for="partno" class="form-label">Part </label> <input type="text"
						class="form-control" name="partno" value="<%=rs.getString("partno")%>"
						required>
				</div>
	       	    <div class="mb-3">
					<label for="cia_markmax" class="form-label">CIA MAX MARK  </label> <input type="text"
						class="form-control" name="cia_markmax" value="<%=rs.getInt("cia_markmax")%>"
						required>
				</div>
				<div class="mb-3">
					<label for="se_markmax" class="form-label">SEMSTER MAX MARK  </label> <input type="text"
						class="form-control" name="se_markmax" value="<%=rs.getInt("se_markmax")%>"
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
