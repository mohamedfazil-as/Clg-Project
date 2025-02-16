package org.student.mgmt.model;

public class Mark {
	private int studentId;
    private Subject subject;
    private String semester;
    private String examDate;
    private int ciaMark;
    private int seMark;
    private int subjectTotal;
    private double subGradePoint;
    private String grade;
    private String result;

    // Getters and Setters
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getExamDate() {
        return examDate;
    }

    public void setExamDate(String examDate) {
        this.examDate = examDate;
    }

    public int getCiaMark() {
        return ciaMark;
    }

    public void setCiaMark(int ciaMark) {
        this.ciaMark = ciaMark;
    }

    public int getSeMark() {
        return seMark;
    }

    public void setSeMark(int seMark) {
        this.seMark = seMark;
    }

    public int getSubjectTotal() {
        return subjectTotal;
    }

    public void setSubjectTotal(int subjectTotal) {
        this.subjectTotal = subjectTotal;
    }

    public double getSubGradePoint() {
        return subGradePoint;
    }

    public void setSubGradePoint(double subGradePoint) {
        this.subGradePoint = subGradePoint;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

	@Override
	public String toString() {
		return "Mark [studentId=" + studentId + ", subject=" + subject + ", semester=" + semester + ", examDate="
				+ examDate + ", ciaMark=" + ciaMark + ", seMark=" + seMark + ", subjectTotal=" + subjectTotal
				+ ", subGradePoint=" + subGradePoint + ", grade=" + grade + ", result=" + result + "]";
	}


}
