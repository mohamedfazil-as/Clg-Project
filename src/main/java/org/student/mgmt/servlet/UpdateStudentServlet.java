package org.student.mgmt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.student.mgmt.db.DBConnection;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE students SET name=?, dob=?, gender=?, email=?, mobile=?,blood_group=?,father_name=?,mother_name=?,address=?,enroll_id=?,course_code=? WHERE id=?");
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("dob"));
            ps.setString(3, request.getParameter("gender"));
            ps.setString(4, request.getParameter("email"));
            ps.setString(5, request.getParameter("mobile"));
            ps.setString(6, request.getParameter("blood_group"));
            ps.setString(7, request.getParameter("father_name"));
            ps.setString(8, request.getParameter("mother_name"));
            ps.setString(9, request.getParameter("address"));
            ps.setString(10, request.getParameter("enroll_id"));
            ps.setString(11, request.getParameter("course_code"));
            
            ps.setInt(12, Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
            response.sendRedirect("student.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}