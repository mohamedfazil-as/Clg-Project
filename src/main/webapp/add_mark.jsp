<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* General body styling */
        body {
            background-color: #f1f1f1;
            font-family: 'Arial', sans-serif;
            padding: 50px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Flexbox Container for form */
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-color: white;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            padding: 40px;
            border-radius: 8px;
            width: 100%;
            max-width: 400px;
            animation: fadeIn 1s ease-in-out;
        }

        /* Input field styling */
        .form-group {
            margin-bottom: 20px;
            width: 100%;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: all 0.3s ease-in-out;
        }

        .form-group input:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
        }

        /* Label styling */
        .form-group label {
            font-weight: bold;
            color: #333;
        }

        /* Button styling */
        .btn-submit {
            background-color: #007bff;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease-in-out;
            animation: buttonBounce 0.5s infinite alternate;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        /* Form Header */
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-header h3 {
            color: #007bff;
            font-size: 24px;
        }

        /* Fade-In Animation */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Button Bounce Animation */
        @keyframes buttonBounce {
            0% {
                transform: translateY(0);
            }
            100% {
                transform: translateY(-10px);
            }
        }
        /* Back to Dashboard Link at the bottom-left */
.back-link {
    position: fixed;
    bottom: 20px;
    left: 20px;
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

    <div class="form-container">
        <div class="form-header">
            <h3>Add Mark</h3>
        </div>
        <form action="AddMarkServlet" method="post">
        	
        	<div class="form-group">
                <label for="studentid">Student Id</label>
                <input type="text" id="studentid" name="studentid" required>
            </div>
       	
      <!--      <div class="form-group">
                <label for="subjectcode">Subject Code</label>
                <input type="text" id="subjectcode" name="subjectcode" required>
            </div> --> 
          <!--   <div class="form-group">
                <label for="semster">SEMSTER  </label>
                <input type="text" id="semster" name="semster" required>
            </div>  --> 
          <div class="form-group">
        <select id ="semster" name="semster" class="btn btn-primary dropdown-toggle" aria-label="Default select example">
            <option selected>Select Semster</option>
            <option value="Semster-I">Semster-I</option>
            <option value="Semster-II">Semster-II</option>
            <option value="Semster-III">Semster-III</option>
            <option value="Semster-IV">Semster-IV</option>
            <option value="Semster-V">Semster-V</option>
            <option value="Semster-VI">Semster-VI</option>
             
</select>
</div>

         
             <%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<div class="form-group">
    <label for="subjectcode">Subject Code</label>
    <select id="subjectcode" name="subjectcode" class="form-control" required>
        <option value="">Select Subject Code</option>
        <%
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management", "root", "admin123");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT subjectcode FROM subjects");

                // Populate the dropdown dynamically
                while (rs.next()) {
                    String subjectcode = rs.getString("subjectcode");
        %>
                    <option value="<%= subjectcode %>"><%= subjectcode %></option>
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
                <label for="subjectname">Subject Name</label>
                <input type="text" id="subjectname" name="subjectname" required>
            </div>
       
       
            
             <div class="form-group">
                <label for="exam_date">Exam Date </label>
                <input type="date" id="exam_date" name="exam_date" required>
            </div> 
             <div class="form-group">
                <label for="cia_mark">CIA MARK </label>
                <input type="text" id="cia_mark" name="cia_mark" required>
            </div>
             <div class="form-group">
                <label for="se_mark">SEMSTER MARK </label>
                <input type="text" id="se_mark" name="se_mark" required>
            </div>
             <div class="form-group">
                <label for="subject_tot">Total </label>
                <input type="text" id="subject_tot" name="subject_tot" required>
          <!--   </div>
              <div class="form-group">
                <label for="subject_credits">Credits </label>
                <input type="text" id="subject_credits" name="subject_credits" required>
            </div> --> 
            <div class="form-group">
                <label for="subject_gradepoint">Grade Point </label>
                <input type="text" id="subject_gradepoint" name="subject_gradepoint" required>
            </div>
            <div class="form-group">
                <label for="grade">Grade  </label>
                <input type="text" id="grade" name="grade" required>
            </div>
             <div class="form-group">
                <label for="result">Result  </label>
                <input type="text" id="result" name="result" required>
            </div>
            
            
            
            <button type="submit" class="btn-submit">Add Mark</button>
            <a href="dashboard.jsp" class="btn btn-primary back-link">Back to Dashboard</a>
            
        </form>
    </div>

</body>
</html>
