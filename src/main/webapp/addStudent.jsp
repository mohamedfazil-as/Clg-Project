<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentmanage.css">
    <style>
      
        
    </style>
</head>
<body>

    <div class="form-container">
        <div class="form-header">
            <h3>Add Student</h3>
        </div>
        <form action="AddStudentServlet" method="post">
        	
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="enroll_id">Enrollment Id</label>
                <input type="text" id="enroll_id" name="enroll_id" required>
            </div>
          <!--   <div class="form-group">
                <label for="course_code">Course Code</label>
                <input type="text" id="course_code" name="course_code" required>
            </div> --> 
            <%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<div class="form-group">
    <label for="course_code">Course Code</label>
    <select id="course_code" name="course_code" class="form-control" required>
        <option value="">Select Course Code</option>
        <%
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management", "root", "admin123");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT coursecode FROM course");

                // Populate the dropdown dynamically
                while (rs.next()) {
                    String courseCode = rs.getString("coursecode");
        %>
                    <option value="<%= courseCode %>"><%= courseCode %></option>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </select>
</div>
            
            
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="dob" required>
            </div>
          
             <div class="form-group">
        <label class="control-label">Gender</label>
        <div class="">
            <label class="radio-inline"> <input type="radio" name="gender" id="gender" value="Male" checked> Male </label>
            <label class="radio-inline"> <input type="radio" name="gender" id="gender" value="Female"> Female </label>
            <label class="radio-inline"> <input type="radio" name="gender" id="gender" value="Others" > Others </label>
        </div>
    </div>
    
       <div class="form-group">
       <select id ="blood_group" name="blood_group" class="btn btn-primary dropdown-toggle" aria-label="Default select example">
            <option selected>Select Blood Group</option>
        <option value="A+">A+</option>
        <option value="A-">A-</option>
        <option value="B+">B+</option>
        <option value="B-">B-</option>
        <option value="AB+">AB+</option>
        <option value="AB-">AB-</option>
        <option value="O+">O+</option>
        <option value="O-">O-</option>
        <option value="Unknown"> Unknown</option>
    </select>
</div>
           
            <div class="form-group">
                <label for="father_name">Father Name </label>
                <input type="text" id="father_name" name="father_name" required>
            </div>
            <div class="form-group">
                <label for="mother_name">Mother Name </label>
                <input type="text" id="mother_name" name="mother_name" required>
            </div>
             <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>
            </div>
            
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile</label>
                <input type="text" id="mobile" name="mobile" required>
            </div>
            

             
            <button type="submit" class="btn-submit">Add Student</button>
            <a href="dashboard.jsp" class="btn btn-primary back-link">Back to Dashboard</a>
            
        </form>
    </div>
   

</body>
</html>
