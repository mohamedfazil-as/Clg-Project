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

/**
 * Servlet implementation class AddCourseServlet
 */
@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
String impleDate = request.getParameter("imple_date");
    	
    	// Validate Date of Birth (avoid empty string)
        if (impleDate == null || impleDate.trim().isEmpty()) {
        	impleDate = null; // Set to null so MySQL can handle it properly
        }
        Connection conn  =null ;
        PreparedStatement ps = null;
    	try {
             conn = DBConnection.getConnection();
             ps = conn.prepareStatement("INSERT INTO course(coursecode, coursename, imple_date, isActive) VALUES (?, ?, ?, ?)");
            ps.setString(1, request.getParameter("coursecode"));
            ps.setString(2,  request.getParameter("coursename") );
            ps.setString(3, impleDate);
            ps.setString(4, "Y");
           
           
            
            
            if (impleDate == null) {
                ps.setNull(3, java.sql.Types.DATE);
            } else {
                ps.setDate(3, java.sql.Date.valueOf(impleDate)); // Convert String to SQL Date
            }
            ps.executeUpdate();
            response.sendRedirect("course.jsp");
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
