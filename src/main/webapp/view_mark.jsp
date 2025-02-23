

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
       
    </style>
</head>
<body>

 
<div class="form-container">
    <div class="form-header">
        <h2>Student Mark Information</h2>
         
    </div>
    <div>
    <div class="text-end">
 <a href="MarkServlet?enrollId=${marksheet.student.enrollId}&studentId=${marksheet.student.id}" class ="btn btn-success">Add Mark</a>
    
</div>
   </div>
   
 
    <div class="student-info">
        <div class="row">
            <div class="col-md-4">
                <label for="enrollId">Enroll ID:</label>
                <label for="enrollId">${marksheet.student.enrollId}</label>
               
            </div>
            
            <div class="col-md-4">
                <label for="studentName">Student Name:</label>
                <label for="studentName">${marksheet.student.name}</label>
             
            </div>
            <div class="col-md-">
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
            
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>GPA</td>
         <c:forEach var="part" items="${partWiseMarks}">
         <c:if test="${part.key=='I'}">
      <td>${part.value[0]/part.value[1]}</td>
      
</c:if>
        <c:if test="${part.key=='II'}">
      <td>${part.value[0]/part.value[1]}</td>
</c:if>
 <c:if test="${part.key=='III'}"> 
      <td>${part.value[0]/part.value[1]}</td>
</c:if>
 <c:if test="${part.key=='IV'}">
     <td>${part.value[0]/part.value[1]}</td>
</c:if>

    </c:forEach>
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
             <th>Semester</th>
            <th>Exam Date</th>
            <th>CIA Max Mark</th>
            <th>CIA Mark</th>
             <th>Semester Max Mark</th>
            <th>Semester Mark</th>
             <th>Total Max Mark</th>
            <th>Subject Total Mark</th>
            <th>Credits</th>
            <th>Grade Point</th>
            <th>Grade</th>
            <th>Result P/F</th>
            <th>Action</th>
            
        
        </thead>
        
        <tbody>
       
        <%-- Add rows dynamically as needed --%>
           <c:forEach items="${marksheet.mark}" var="mark">
            <c:if test="${mark.isDeleted=='N'}">
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
                            <td> 
                            <a href="GetMarkByStudent?enrollId=${marksheet.student.enrollId}&studentId=${marksheet.student.id}&semester=${mark.semester}&subjectCode=${mark.subject.subjectCode}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="DeleteMarkServlet?enrollId=${marksheet.student.enrollId}&studentId=${marksheet.student.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                            </td>
   </tr>
   </c:if>
</c:forEach>
        
        </tbody>
    </table>
  <a href="student.jsp" class="btn btn-primary">Back to Student</a>
  
 
</div>
   
</body>
  
</html>