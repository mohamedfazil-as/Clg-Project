package org.student.mgmt.model;

import java.util.List;

public class MarkSheet {
	private Student student ;
	private Course  course;
	private List<Mark> mark ;
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public List<Mark> getMark() {
		return mark;
	}
	public void setMark(List<Mark> mark) {
		this.mark = mark;
	}
	
	@Override
	public String toString() {
		return "MarkSheet [student=" + student + ", course=" + course + ", mark=" + mark +" ]";
	}
	

}
