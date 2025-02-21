package org.student.mgmt.model;

public class Subject {
	// subjectcode, subjectname, partno, cia_markmax, se_markmax, credits
	private String subjectCode;
	private String subjectName;
	private String partNo ;
	private Integer cia_Markmax;
	private Integer se_Markmax;
	private Integer totalMaxMark;
	private Integer credit;
	public Integer getTotalMaxMark() {
		return (getCia_Markmax()+getSe_Markmax());
	}
	
	
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getPartNo() {
		return partNo;
	}
	public void setPartNo(String partNo) {
		this.partNo = partNo;
	}
	public Integer getCia_Markmax() {
		return cia_Markmax;
	}
	public void setCia_Markmax(Integer cia_Markmax) {
		this.cia_Markmax = cia_Markmax;
	}
	public Integer getSe_Markmax() {
		return se_Markmax;
	}
	public void setSe_Markmax(Integer se_Markmax) {
		this.se_Markmax = se_Markmax;
	}
	
	public Integer getCredit() {
		return credit;
	}
	public void setCredit(Integer credit) {
		this.credit = credit;
	}
	@Override
	public String toString() {
		return "Subject [subjectCode=" + subjectCode + ", subjectName=" + subjectName + ", partNo=" + partNo
				+ ", cia_Markmax=" + cia_Markmax + ", se_Markmax=" + se_Markmax + ", credit=" + credit + "]";
	}


}
