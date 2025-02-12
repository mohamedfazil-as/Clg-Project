package org.studentservlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studentmanagement.DBConnection;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	String dob = request.getParameter("dob");
    	
    	// Validate Date of Birth (avoid empty string)
        if (dob == null || dob.trim().isEmpty()) {
            dob = null; // Set to null so MySQL can handle it properly
        }
        Connection conn  =null ;
        PreparedStatement ps = null;
    	try {
             conn = DBConnection.getConnection();
             ps = conn.prepareStatement("INSERT INTO students(name, dob, gender, email, mobile,enroll_id,course_code,blood_group,father_name,mother_name,address) VALUES (?, ?, ?, ?, ?,?,?,?,?,?,?)");
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, dob);
            ps.setString(3, request.getParameter("gender"));
            ps.setString(4, request.getParameter("email"));
            ps.setString(5, request.getParameter("mobile"));
            ps.setString(6, request.getParameter("enroll_id"));
            ps.setString(7, request.getParameter("course_code"));
            ps.setString(8, request.getParameter("blood_group"));
            ps.setString(9, request.getParameter("father_name"));
            ps.setString(10, request.getParameter("mother_name"));
            ps.setString(11, request.getParameter("address"));
            
            
           
            
            
            if (dob == null) {
                ps.setNull(2, java.sql.Types.DATE);
            } else {
                ps.setDate(2, java.sql.Date.valueOf(dob)); // Convert String to SQL Date
            }
            ps.executeUpdate();
            response.sendRedirect("student.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    	finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
    }
    	}
   
}