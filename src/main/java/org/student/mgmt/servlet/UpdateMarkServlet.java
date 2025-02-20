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
 * Servlet implementation class UpdateMarkServlet
 */
@WebServlet("/UpdateMarkServlet")
public class UpdateMarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMarkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	            Connection conn = DBConnection.getConnection();
	            PreparedStatement ps = conn.prepareStatement("UPDATE marks SET subject_code=?, semster=?, exam_date=?, cia_mark=?, se_mark=?, subject_tot=?, sub_gradepoint=?, grade=?, result WHERE student_id=?");
	            ps.setString(1, request.getParameter("subject_code"));
	            ps.setInt(2,Integer.parseInt(request.getParameter("semster")));
	            ps.setString(3, request.getParameter("exam_date"));       
	            ps.setInt(4,Integer.parseInt(request.getParameter("cia_mark")));
	            ps.setInt(5,Integer.parseInt(request.getParameter("se_mark")));
	            ps.setInt(6,Integer.parseInt(request.getParameter("subject_tot")));
	            ps.setDouble(7, Double.parseDouble(request.getParameter("sub_gradepoint")));
	            ps.setString(8, request.getParameter("subjectcode"));
	            ps.executeUpdate();
	            response.sendRedirect("subject.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
