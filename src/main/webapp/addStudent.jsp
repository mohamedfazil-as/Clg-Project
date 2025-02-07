<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
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
            <h3>Add Student</h3>
        </div>
        <form action="AddStudentServlet" method="post">
        		
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="dob" required>
            </div>
          <!--   <div class="form-group">
                <label for="gender">Gender</label>
                <input type="radiobutton" id="gender" name="gender" required>
            </div> -->
            
            <div class="form-group">
            <input type="radio" class="btn-check" name="gender" id="male" autocomplete="off" checked>
             <label class="btn btn-secondary" for="male">Male</label>

             <input type="radio" class="btn-check" name="gender" id="female" autocomplete="off">
             <label class="btn btn-secondary" for="female">Female</label>

               <input type="radio" class="btn-check" name="gender" id="other" autocomplete="off" >
               <label class="btn btn-secondary" for="other">Other</label>
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
