<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Mark  Information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentmanage.css">
 

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: sans-serif;
        }
        .container {
            margin-top: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .student-info {
            margin-bottom: 20px;
        }
        .table-bordered th, .table-bordered td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center; /* Center the text in cells */
            vertical-align: middle; /* Center vertically */
        }
        .table-bordered th {
            background-color: #f2f2f2; /* Light gray background for header */
        }
        .mark-entry-table {
          width: 100%; /* Ensure table takes full width */
          table-layout: fixed; /* For equal column widths */
        }
        .mark-entry-table td {
          word-wrap: break-word; /* Prevent content from overflowing */
        }
    </style>
</head>
<body>

<div class="form-container">
    <div class="form-header">
        <h2>Student Mark Information</h2>
    </div>

    <div class="student-info">
        <div class="row">
            <div class="col-md-4">
                <label for="studentId">Student ID:</label>
                <label for="studentId">${marksheet.student.id}</label>
               
            </div>
            <div class="col-md-4">
                <label for="studentName">Student Name:</label>
                <label for="studentName">${marksheet.student.name}</label>
             
            </div>
            <div class="col-md-4">
                <label for="course">Course:</label>
                 <label for="course">${marksheet.course.courseName}</label>
        
            </div>
        </div>
    </div>


    <table class="table table-bordered">
        <thead>
        <tr>
            <th>PART</th>
            <th>I</th>
            <th>II</th>
            <th>III</th>
            <th>IV</th>
            <th>GPA</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>

    <h3>Mark Detail Entry</h3>
    <table class="table table-bordered mark-entry-table">
        <thead>
        <tr>
            <th>Subject Code</th>
            <th>Subject Name</th>
            <th>Part</th>
             <th>Semster</th>
            <th>Exam Date</th>
            <th>CIA Max Mark</th>
            <th>CIA Mark</th>
             <th>Semster Max Mark</th>
            <th>Semster Mark</th>
             <th>Total Max Mark</th>
            <th>Subject Total Mark</th>
            <th>Credits</th>
            <th>Grade Point</th>
            <th>Grade</th>
            <th>Result P/F</th>
        </tr>
        </thead>
        <tbody>
        <%-- Add rows dynamically as needed --%>
           <c:forEach items="${marksheet.mark}" var="mark">
            <tr>
                  <td> ${mark.subject.subjectCode }</td>
                 <td> ${mark.subject.subjectName }</td>
                  <td> ${mark.subject.partNo }</td>
                  <td> ${mark.semester }</td>
                   <td> ${mark.examDate }</td>
                   <td> ${mark.subject.cia_Markmax }</td>    
                    <td> ${mark.ciaMark }</td>
                      <td> ${mark.subject.se_Markmax }</td>  
                     <td> ${mark.seMark}</td>
                      <td> ${mark.subject.totalMaxMark}</td>  
                      <td> ${mark.subjectTotal }</td>
                       <td> ${mark.subject.credit }</td>
                        <td> ${mark.subGradePoint }</td>
                         <td>${mark.grade }</td>
                            <td> ${mark.result }</td>

   </tr>
</c:forEach>
           
        
        </tbody>
    </table>

</div>

</body>
</html>