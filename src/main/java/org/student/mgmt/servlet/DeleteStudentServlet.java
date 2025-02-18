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

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DBConnection.getConnection();
           // PreparedStatement ps = conn.prepareStatement("DELETE FROM students WHERE id=?");
            PreparedStatement ps = conn.prepareStatement("update students set isDeleted=? WHERE id=?");
            ps.setString(1,"Y");
            ps.setInt(2, Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
            response.sendRedirect("student.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}