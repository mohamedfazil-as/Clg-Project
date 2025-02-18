<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.student.mgmt.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title> Students</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentmanage.css">
</head>
<body >
<div class="form-container">
     <div class="form-header">
        <h2>Student List</h2>
         
    </div>
  <div class="text-end">
 <a href="addStudent.jsp" class ="btn btn-success">Add Student</a>
</div>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th> <th>Name</th> <th>DOB</th> <th>Gender</th> <th>Email</th> <th>Mobile</th> <th>Blood Group</th>  <th>Enrollment Id</th> <th>Course Code</th> <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * from Students where isDeleted ='N' ");
               ResultSet rs = ps.executeQuery();
               while (rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id")%></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("dob") %></td>
                <td><%= rs.getString("gender") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("mobile") %></td>
                <td><%= rs.getString("blood_group") %></td>
                <td><%= rs.getString("enroll_id") %></td>
                <td><%= rs.getString("course_code") %></td>
                
                
                <td>
                    <a href="editStudent.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="DeleteStudentServlet?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    <a href="MarkSearchServlet?enroll_id=<%= rs.getString("enroll_id") %>" class="btn btn-primary btn-sm">Mark</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
</body>
</html>
