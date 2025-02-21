package org.student.mgmt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.student.mgmt.db.DBConnection;
import org.student.mgmt.model.Mark;
import org.student.mgmt.model.Subject;

/**
 * Servlet implementation class GetMarkByStudent
 */
@WebServlet("/GetMarkByStudent")
public class GetMarkByStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMarkByStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		try {
	             conn = DBConnection.getConnection();
	             ps = conn.prepareStatement("select  *  "
	             		+ "from  marks "
	             		+ "join subjects "
	             		+ "on subjects.subjectcode = marks.subject_code "
	             		+ "where marks.student_id=? and marks.subject_code=? and marks.semster=?");
	            ps.setString(2, request.getParameter("subjectCode"));
	            ps.setInt(1,Integer.parseInt(request.getParameter("studentId")));
	            
	            ps.setInt(3,Integer.parseInt(request.getParameter("semester")));
	           
	           rs=  ps.executeQuery();
	 
	           Mark mark = null ;
	           Subject subject =  null ;
	           //  student_id, subject_code, semster, exam_date, cia_mark, se_mark, subject_tot, sub_gradepoint, grade, result, isDeleted
	           while(rs.next()) {
	        	   mark = new Mark() ;
	        	   subject =  new  Subject() ;
	            	subject.setSubjectCode(rs.getString("subject_code")) ;
	            	subject.setSubjectName(rs.getString("subjectname"));
	            	subject.setCredit(rs.getInt("credit"));
	            	subject.setPartNo(rs.getString("partno"));
	            	mark.setSubject(subject) ;
	            	mark.setStudentId(rs.getInt("student_id")) ;	            
	            	mark.setSemester(rs.getString("semster"));
	            	mark.setExamDate(rs.getString("exam_date"));
	            	mark.setCiaMark(rs.getInt("cia_mark"));
	            	mark.setSeMark(rs.getInt("se_mark")) ;
	            	mark.setSubjectTotal(rs.getInt("subject_tot")) ;
	            	mark.setSubGradePoint(rs.getDouble("sub_gradepoint")) ;
	            	mark.setGrade(rs.getString("grade")) ;
	            	mark.setResult(rs.getString("result")) ;
	            	
	          
	            	
	            }
	           request.setAttribute("mark", mark);
			  
			   request.setAttribute("enrollId",  request.getParameter("enrollId"));
			  
	            RequestDispatcher dispatcher = request.getRequestDispatcher("edit_mark.jsp");
	            dispatcher.forward(request, response);
		  } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("error", "Database error: " + e.getMessage());
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	        } finally {
	           
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	}

}
