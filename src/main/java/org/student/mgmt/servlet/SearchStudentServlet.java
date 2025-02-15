package org.student.mgmt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.student.mgmt.db.DBConnection;

@WebServlet("/SearchStudentServlet")
public class SearchStudentServlet extends HttpServlet {
    
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
			
			try {
				Connection conn = DBConnection.getConnection();
				PreparedStatement	ps = conn.prepareStatement("SELECT * FROM students WHERE id=?");
				   ps.setInt(1, Integer.parseInt(request.getParameter("id")));
				   ResultSet rs = ps.executeQuery();
				   
				   HttpSession session = request.getSession();
		            if (rs.next()) {
		                session.setAttribute("student", rs);
		                response.sendRedirect("student.jsp");
		            } else {
		                response.sendRedirect("searchStudent.jsp?error=Student not found");
		            }


			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}
	
}