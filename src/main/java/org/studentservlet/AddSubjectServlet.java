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
 * Servlet implementation class AddSubjectServlet
 */
@WebServlet("/AddSubjectServlet")
public class AddSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Connection conn  =null ;
	        PreparedStatement ps = null;
		try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement("INSERT INTO subjects(subjectcode, subjectname, partno, cia_markmax, se_markmax) VALUES (?, ?, ?, ?,?)");
           ps.setString(1, request.getParameter("subjectcode"));
           ps.setString(2,  request.getParameter("subjectname") );
           ps.setString(3, request.getParameter("partno"));
           ps.setInt(4, Integer.parseInt(request.getParameter("cia_markmax")));
           ps.setInt(5, Integer.parseInt(request.getParameter("se_markmax")));
           
          
           
        
           ps.executeUpdate();
           response.sendRedirect("subject.jsp");
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


