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

/**
 * Servlet implementation class DeleteSubjectServlet
 */
@WebServlet("/DeleteSubjectServlet")
public class DeleteSubjectServlet extends HttpServlet {
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
