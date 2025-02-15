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
 * Servlet implementation class UpdateCourseServlet
 */
@WebServlet("/UpdateCourseServlet")
public class UpdateCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	            Connection conn = DBConnection.getConnection();
	            PreparedStatement ps = conn.prepareStatement("UPDATE course SET coursename=?, imple_date=? WHERE coursecode=?");
	            ps.setString(1, request.getParameter("coursename"));
	            ps.setString(2, request.getParameter("imple_date"));
	            ps.setString(3, request.getParameter("coursecode"));
	            ps.executeUpdate();
	            response.sendRedirect("course.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
