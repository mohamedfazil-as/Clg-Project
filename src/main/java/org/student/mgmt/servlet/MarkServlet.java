package org.student.mgmt.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.student.mgmt.db.DBConnection;
import org.student.mgmt.model.Subject;

@WebServlet("/MarkServlet")
public class MarkServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Subject> subjectList = new ArrayList<>();

        try {
            // Get DB connection
            conn = DBConnection.getConnection();

            // Prepare and execute query
            ps = conn.prepareStatement("SELECT subjectcode, partno, credits FROM subjects");
            rs = ps.executeQuery();

            // Process result set
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSubjectCode(rs.getString("subjectcode"));
                subject.setPartNo(rs.getString("partno"));
                subject.setCredits(rs.getInt("credits"));

                subjectList.add(subject);
            }

            // Pass data to JSP
            request.setAttribute("subjectList", subjectList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("subjects.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
