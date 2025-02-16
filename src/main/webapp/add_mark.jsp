<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Mark</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentmanage.css">

    <style>
     
        
    </style>
     <script>
        function updateSubjectDetails() {
            // Get selected option
            var select = document.getElementById("subjectcode");
            var selectedOption = select.options[select.selectedIndex];

            // Get data attributes
            var subjectName = selectedOption.getAttribute("data-name");
            var credit = selectedOption.getAttribute("data-credit");
            var part = selectedOption.getAttribute("data-part");

            // Populate input fields
            //subject_name
//subject_part
//subject_tot
//subject_credit
//subject_gradepoint
//grade
//result
//cia_mark
//se_mark
//subject_tot
            document.getElementById("subject_name").value = subjectName || "";
            document.getElementById("subject_credit").value = credit ;
            document.getElementById("subject_part").value = part ;
            
        }
        function calculateMark(){
         var ciaMark = document.getElementById("cia_mark").value;
         var seMark = document.getElementById("se_mark").value;
         
         var intCiaMark = parseInt(ciaMark) ;
         var intSeMark = parseInt(seMark) ;
         
         if(isNaN(intCiaMark)||isNaN(intSeMark)) {
         }else {
        	  var subTot = intCiaMark+intSeMark;
        	    document.getElementById("subject_tot").value = subTot  ;
         }
         var resultData = calculateGradeAndResult(subTot);

         // Populate grade and result fields
         document.getElementById("grade").value = resultData.grade;
         document.getElementById("subject_gradepoint").value = resultData.cgpa;
         document.getElementById("result").value = resultData.result;
       }
        function calculateGradeAndResult(subTot) {
            // Convert subTot (out of 100) to CGPA (out of 10)
            let cgpa = (subTot * 10) / 100;
            let grade, classification, result;

            // Determine Grade and Classification based on CGPA
            if (cgpa >= 9.5 && cgpa <= 10) {
                grade = "O+";
                
            } else if (cgpa >= 9.0) {
                grade = "O";
              
            } else if (cgpa >= 8.5) {
                grade = "D++";
               
            } else if (cgpa >= 8.0) {
                grade = "D+";
               
            } else if (cgpa >= 7.5) {
                grade = "D";
              
            } else if (cgpa >= 7.0) {
                grade = "A++";
              
            } else if (cgpa >= 6.5) {
                grade = "A+";
                
            } else if (cgpa >= 6.0) {
                grade = "A";
             
            } else if (cgpa >= 5.5) {
                grade = "B+";
                
            } else if (cgpa >= 5.0) {
                grade = "B";
             
            } else if (cgpa >= 4.5) {
                grade = "C+";
            
            } else if (cgpa >= 4.0) {
                grade = "U";
              
            } else {
                grade = "U";
               
            }

            // Determine Pass or Fail
            result = (cgpa >= 5.0) ? "P" : "F";

            return {
                subTot,
                cgpa: cgpa.toFixed(1), // Format to 1 decimal place
                grade,
                classification,
                result
            };
        }

    </script>
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

         

<div class="form-group">
    <label for="subjectcode">Subject Code</label>
    <select id="subjectcode" name="subjectcode" class="form-control" onchange="updateSubjectDetails()" required>
        <option value="">Select Subject Code</option>
        <c:forEach items="${subjectList}" var="subject">
          <option value="${subject.subjectCode}"  
                data-name="${subject.subjectName}" 
                data-credit="${subject.credit}" 
                data-part="${subject.partNo}">
                ${subject.subjectCode}
            
          </option>
   
</c:forEach>
 </select>
        
        
</div>
       
            <div class="form-group">
                <label for="subject_name">Subject Name</label>
                <input type="text" id="subject_name" name="subject_name" readonly>
            </div>
            <div class="form-group">
                <label for="subject_part">Part No </label>
                <input type="text" id="subject_part" name="subject_part" readonly>
            </div>
       
       
            
             <div class="form-group">
                <label for="exam_date">Exam Date </label>
                <input type="date" id="exam_date" name="exam_date" required>
            </div> 
             <div class="form-group">
                <label for="cia_mark">CIA MARK </label>
                <input type="text" id="cia_mark" name="cia_mark"  onchange="calculateMark()" required>
            </div>
             <div class="form-group">
                <label for="se_mark">SEMSTER MARK </label>
                <input type="text" id="se_mark" name="se_mark"  onchange="calculateMark()" required>
            </div>
             <div class="form-group">
                <label for="subject_tot">Total </label>
                <input type="text" id="subject_tot" name="subject_tot" readonly>
             </div>
              <div class="form-group">
                <label for="subject_credit">Credit </label>
                <input type="text" id="subject_credit" name="subject_credit" readonly>
            </div>  
            <div class="form-group">
                <label for="subject_gradepoint">Grade Point </label>
                <input type="text" id="subject_gradepoint" name="subject_gradepoint" readonly>
            </div>
            <div class="form-group">
                <label for="grade">Grade  </label>
                <input type="text" id="grade" name="grade" readonly>
            </div>
             <div class="form-group">
                <label for="result">Result  </label>
                <input type="text" id="result" name="result"  readonly>
            </div>
            
            
            
            <button type="submit" class="btn-submit">Add Mark</button>
            <a href="dashboard.jsp" class="btn btn-primary back-link">Back to Dashboard</a>
            
        </form>
    </div>

</body>
</html>
