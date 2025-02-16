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

     

        try {
        	   List<Subject> subjectList = new ArrayList<>();
           
            conn = DBConnection.getConnection();

         
            ps = conn.prepareStatement("SELECT subjectcode,subjectname, partno, credit FROM subjects");
            rs = ps.executeQuery();

           
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSubjectCode(rs.getString("subjectcode"));
                subject.setSubjectName(rs.getString("subjectname"));
                subject.setPartNo(rs.getString("partno"));
                subject.setCredit(rs.getInt("credit"));

                subjectList.add(subject);
            }

          
            request.setAttribute("subjectList", subjectList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("add_mark.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
           
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
