package org.student.mgmt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.student.mgmt.db.DBConnection;
import org.student.mgmt.model.Course;
import org.student.mgmt.model.Mark;
import org.student.mgmt.model.MarkSheet;
import org.student.mgmt.model.Student;
import org.student.mgmt.model.Subject;

@WebServlet("/MarkSearchServlet")
public class MarkSearchServlet extends HttpServlet {
    
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	
		try {
				 conn = DBConnection.getConnection();
					ps = conn.prepareStatement("select students.id as stuid, students.name as stuname, students.enroll_id, students.course_code "
		    			+ " ,course.coursecode,course.coursename,marks.student_id, marks.subject_code, marks.semester"
						+ " ,marks.exam_date, marks.cia_mark, marks.se_mark, marks.subject_tot,marks.sub_gradepoint"
						+ " ,marks.grade, marks.result,marks.isDeleted,subjects.subjectcode,subjects.subjectname,subjects.partno"
						+ " ,subjects.cia_markmax, subjects.se_markmax, subjects.credit "
						+ "from students "
						+ "join course on students.course_code = course.coursecode "
						+ "left join marks  on marks.student_id = students.id "
						+ "join subjects on subjects.subjectcode = marks.subject_code "
						+ "where "
						+ "students.enroll_id = ?"
					//	+ " and marks.isDeleted=?"
						+ " order  by marks.semester,subjects.partno"
						);
				   ps.setString(1,  request.getParameter("enroll_id"));
				  // ps.setString(2, "N");
				    rs = ps.executeQuery(); 
				    
				    MarkSheet marksheet = new MarkSheet();
				   List <Mark> markList = new ArrayList<Mark>() ;
				   List <Subject> subjectList = new ArrayList<Subject>() ;
				   TreeMap<String, int[]> partWiseMarks = new TreeMap<>();
				   while (rs.next()) {
					    Student student = new Student() ;
					    Course course   = new Course() ;
		                Subject subject = new Subject();
		               
		                Mark    mark = new Mark();
		                
		                student.setId(rs.getInt("stuid"));
		                student.setName(rs.getString("stuname"));
		                student.setEnrollId(rs.getString("enroll_id"));
		                student.setCourseCode(rs.getString("course_code"));
		                
		                course.setCourseCode(rs.getString("coursecode"));
		                course.setCourseName(rs.getString("coursename"));

                        mark.setStudentId(rs.getInt("student_id"));
                       
                        mark.setSemester(rs.getString("semester"));
                        mark.setExamDate(rs.getString("exam_date"));
                        mark.setCiaMark(rs.getInt("cia_mark"));
                        mark.setSeMark(rs.getInt("se_mark"));
                        mark.setSubjectTotal(rs.getInt("subject_tot"));
                        mark.setSubGradePoint(rs.getInt("sub_gradepoint"));
                        mark.setGrade(rs.getString("grade"));
                        mark.setResult(rs.getString("result"));
                        mark.setIsDeleted(rs.getString("isDeleted"));
            
		               
		                subject.setSubjectCode(rs.getString("subjectcode"));
		                subject.setSubjectName(rs.getString("subjectname"));
		                subject.setPartNo(rs.getString("partno"));
		                subject.setCia_Markmax(rs.getInt("cia_markmax"));
		                subject.setSe_Markmax(rs.getInt("se_markmax"));
		           		subject.setCredit(rs.getInt("credit"));
		           		 
		           		mark.setSubject(subject);
		           		markList.add(mark);
		           		
		           		if (!partWiseMarks.containsKey(subject.getPartNo())) {
		                    partWiseMarks.put(subject.getPartNo(), new int[]{0, 0});
		                }
		                int [] data = partWiseMarks.get(subject.getPartNo());
		                data[0] += mark.getSubGradePoint(); // Sum of marks
		                data[1] += 1;
		                
		                
		                marksheet.setStudent(student);
		                marksheet.setCourse(course);
		                marksheet.setMark(markList);
		           
		                
		               
		                
		            }
				   
				   request.setAttribute("marksheet", marksheet);
				   request.setAttribute("partWiseMarks", partWiseMarks);
		            RequestDispatcher dispatcher = request.getRequestDispatcher("view_mark.jsp");
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