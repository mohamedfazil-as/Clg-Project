<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.studentmanagement.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class ="container mt-4">
<h2 class ="text-center mb-4">Course</h2>
<div>
<div>
</div>
<div>
</div>
<div class="text-end">
 <a href="add_course.jsp" class ="btn btn-success">Add course</a>
</div>
</div> 

<table class="table table-bordered table-striped">
   <thead class="table-dark">
            <tr>
                <th>CourseCode</th> <th>CourseName</th> <th>Implementaion Date</th>  <th>Active</th>  <th>Discountinuation Date </th> <th>Actions</th>
                 </tr>
        </thead>
        <tbody>
          <% Connection  conn =  DBConnection.getConnection();
          PreparedStatement ps = conn.prepareStatement("SELECT * from course ");
          ResultSet rs  = ps.executeQuery() ; 
          while(rs.next()) {%>
          <tr>
            <td><%=rs.getString("coursecode") %></td>
            <td><%=rs.getString("coursename") %></td>
            <td><%=rs.getDate("imple_date") %></td> 
            <td><%=rs.getString("isActive")%></td>
            <td><%=rs.getDate("discont_date") %></td> 
            <td>
              
              <a href ="edit_course.jsp?coursecode=<%= rs.getString("coursecode") %>"class="btn btn-warning btn-sm">Edit</a>
             <a href="DeleteCourseServlet?coursecode=<%= rs.getString("coursecode") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
           </tr>
             <% } %>
            
        
        
        </tbody>
</table>
  <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>

</body>
</html>