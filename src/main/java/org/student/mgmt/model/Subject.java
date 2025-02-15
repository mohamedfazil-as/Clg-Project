package org.student.mgmt.model;

public class Subject {
	// subjectcode, subjectname, partno, cia_markmax, se_markmax, credits
	private String SubjectCode;
	private String SubjectName;
	private String PartNo ;
	private Integer Cia_Markmax;
	private Integer Se_Markmax;
	private Integer Credits;
	public String getSubjectCode() {
		return SubjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		SubjectCode = subjectCode;
	}
	public String getSubjectName() {
		return SubjectName;
	}
	public void setSubjectName(String subjectName) {
		SubjectName = subjectName;
	}
	public String getPartNo() {
		return PartNo;
	}
	public void setPartNo(String partNo) {
		PartNo = partNo;
	}
	public Integer getCia_Markmax() {
		return Cia_Markmax;
	}
	public void setCia_Markmax(Integer cia_Markmax) {
		Cia_Markmax = cia_Markmax;
	}
	public Integer getSe_Markmax() {
		return Se_Markmax;
	}
	public void setSe_Markmax(Integer se_Markmax) {
		Se_Markmax = se_Markmax;
	}
	public Integer getCredits() {
		return Credits;
	}
	public void setCredits(Integer credits) {
		Credits = credits;
	}
	@Override
	public String toString() {
		return "Subject [SubjectCode=" + SubjectCode + ", SubjectName=" + SubjectName + ", PartNo=" + PartNo
				+ ", Cia_Markmax=" + Cia_Markmax + ", Se_Markmax=" + Se_Markmax + ", Credits=" + Credits + "]";
	}
    
	

}
