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
<title>Subjects</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class ="container mt-4">
<h2 class ="text-center mb-4">Subject</h2>
<div>
<div>
</div>
<div>
</div>
<div class="text-end">
 <a href="add_subject.jsp" class ="btn btn-success">Add Subject</a>
</div>
</div> 
<table class="table table-bordered table-striped">
<thead class="table-dark">
            <tr>
                <th>Subject Code</th> <th>Subject Name</th> <th>Part </th>  <th>CIA Max Mark </th> <th>Semster Max Mark </th> <th>Actions</th>
                 </tr>
        </thead>
         <tbody>
          <% Connection  conn =  DBConnection.getConnection();
          PreparedStatement ps = conn.prepareStatement("SELECT * from subjects ");
          ResultSet rs  = ps.executeQuery() ;
          while(rs.next()) {%>
          <tr>
            <td><%=rs.getString("subjectcode") %></td>
            <td><%=rs.getString("subjectname") %></td>     
            <td><%=rs.getString("partno") %></td> 
            <td><%=rs.getInt("cia_markmax")%></td>
            <td><%=rs.getInt("se_markmax") %></td> 
            <td>
              
              <a href ="edit_subject.jsp?subjectcode=<%= rs.getString("subjectcode") %>"class="btn btn-warning btn-sm">Edit</a>
           <!--   <a href="DeleteSubjectServlet?subjectcode=<%= rs.getString("subjectcode") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a> -->
            </td>
           </tr>
             <% } %>
            
        
        
        </tbody>


</body>
</html>