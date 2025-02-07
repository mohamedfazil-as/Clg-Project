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

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE students SET name=?, dob=?, gender=?, email=?, mobile=? WHERE id=?");
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("dob"));
            ps.setString(3, request.getParameter("gender"));
            ps.setString(4, request.getParameter("email"));
            ps.setString(5, request.getParameter("mobile"));
            ps.setInt(6, Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
            response.sendRedirect("viewStudents.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}