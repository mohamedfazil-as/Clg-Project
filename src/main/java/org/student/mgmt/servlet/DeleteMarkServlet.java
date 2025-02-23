package org.student.mgmt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.student.mgmt.db.DBConnection;

/**
 * Servlet implementation class DeleteMarkServlet
 */
@WebServlet("/DeleteMarkServlet")
public class DeleteMarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMarkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Connection conn = null;
	        PreparedStatement ps = null;
		try {
             conn = DBConnection.getConnection();
           // PreparedStatement ps = conn.prepareStatement("DELETE FROM students WHERE id=?");
             ps = conn.prepareStatement("update marks set isDeleted=? WHERE student_id=?");
            ps.setString(1,"Y");
            ps.setInt(2, Integer.parseInt(request.getParameter("studentId")));
            ps.executeUpdate();
            response.sendRedirect("MarkSearchServlet?enroll_id=" + request.getParameter("enrollId")   );
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
           
            try {
             
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}
}
	

