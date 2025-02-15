package org.student.mgmt.servlet;

import java.io.IOException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.student.mgmt.db.DBConnection;

/**
 * Servlet implementation class DeleteCourseServlet
 */
@WebServlet("/DeleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	  try {
		 
          Connection conn = DBConnection.getConnection();
          PreparedStatement ps = conn.prepareStatement("update course set isActive=?,discont_date=? WHERE coursecode=?");
          ps.setString(1,"N");
          ps.setDate(2,java.sql.Date.valueOf(java.time.LocalDate.now()));
          ps.setString(3, request.getParameter("coursecode"));
          
          ps.executeUpdate();
          response.sendRedirect("course.jsp");
      } catch (Exception e) {
          e.printStackTrace();
      }
	}

}
