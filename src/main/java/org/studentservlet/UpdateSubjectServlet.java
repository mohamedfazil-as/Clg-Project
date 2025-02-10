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
 * Servlet implementation class UpdateSubjectServlet
 */
@WebServlet("/UpdateSubjectServlet")
public class UpdateSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	            Connection conn = DBConnection.getConnection();
	            PreparedStatement ps = conn.prepareStatement("UPDATE subjects SET subjectname=?, partno=?,cia_markmax=?,se_markmax=? WHERE subjectcode=?");
	            ps.setString(1, request.getParameter("subjectname"));
	            ps.setString(2, request.getParameter("partno"));           
	            ps.setInt(3,Integer.parseInt(request.getParameter("cia_markmax")));
	            ps.setInt(4,Integer.parseInt(request.getParameter("se_markmax")));
	            ps.setString(5, request.getParameter("subjectcode"));
	            ps.executeUpdate();
	            response.sendRedirect("subject.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
