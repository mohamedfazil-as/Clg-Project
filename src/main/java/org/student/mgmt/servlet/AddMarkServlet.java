package org.student.mgmt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.student.mgmt.db.DBConnection;

/**
 * Servlet implementation class AddMarkServlet
 */
@WebServlet("/AddMarkServlet")
public class AddMarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String examdate = request.getParameter("exam_date");
    	
    	// Validate Date of Birth (avoid empty string)
        if (examdate == null || examdate.trim().isEmpty()) {
        	examdate = null; // Set to null so MySQL can handle it properly
        }
		
		Connection conn  =null ;
	        PreparedStatement ps = null;
		try {
         conn = DBConnection.getConnection();
         ps = conn.prepareStatement("INSERT INTO marks(student_id, subject_code, semster, exam_date, cia_mark, se_mark, subject_tot, sub_gradepoint, grade, result) VALUES (?, ?, ?, ?,?,?,?,?,?,?)");
        ps.setInt(1, Integer.parseInt(request.getParameter("studentId")));		
        ps.setString(2, request.getParameter("subject_code"));
        ps.setString(3,  request.getParameter("semster") );
        ps.setString(4, examdate);
        ps.setInt(5, Integer.parseInt(request.getParameter("cia_mark")));
        ps.setInt(6, Integer.parseInt(request.getParameter("se_mark")));
        ps.setInt(7, Integer.parseInt(request.getParameter("subject_tot")));
        ps.setDouble(8, Double.parseDouble(request.getParameter("subject_gradepoint")));
        ps.setString(9, request.getParameter("grade"));
        ps.setString(10, request.getParameter("result"));
                        
          ps.executeUpdate();
        
        response.sendRedirect("MarkSearchServlet?enroll_id=" + request.getParameter("enrollId")   );
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage",e.getMessage());
        request.setAttribute("returnpage", "MarkSearchServlet?enroll_id=" + request.getParameter("enrollId") );
        RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
        dispatcher.forward(request, response);
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

