package org.student.mgmt.model;

public class Student {
	// id, name, dob, gender, email, mobile, blood_group, father_name, mother_name, address, enroll_id, enroll_date, completion_date, course_code
	  private int id;
	    private String name;
	    private String dob;
	    private String gender;
	    private String email;
	    private String mobile;
	    private String bloodGroup;
	    private String fatherName;
	    private String motherName;
	    private String address;
	    private String enrollId;
	    private String enrollDate;
	    private String completionDate;
	    private String courseCode;

	    // Getters and Setters
	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getDob() {
	        return dob;
	    }

	    public void setDob(String dob) {
	        this.dob = dob;
	    }

	    public String getGender() {
	        return gender;
	    }

	    public void setGender(String gender) {
	        this.gender = gender;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getMobile() {
	        return mobile;
	    }

	    public void setMobile(String mobile) {
	        this.mobile = mobile;
	    }

	    public String getBloodGroup() {
	        return bloodGroup;
	    }

	    public void setBloodGroup(String bloodGroup) {
	        this.bloodGroup = bloodGroup;
	    }

	    public String getFatherName() {
	        return fatherName;
	    }

	    public void setFatherName(String fatherName) {
	        this.fatherName = fatherName;
	    }

	    public String getMotherName() {
	        return motherName;
	    }

	    public void setMotherName(String motherName) {
	        this.motherName = motherName;
	    }

	    public String getAddress() {
	        return address;
	    }

	    public void setAddress(String address) {
	        this.address = address;
	    }

	    public String getEnrollId() {
	        return enrollId;
	    }

	    public void setEnrollId(String enrollId) {
	        this.enrollId = enrollId;
	    }

	    public String getEnrollDate() {
	        return enrollDate;
	    }

	    public void setEnrollDate(String enrollDate) {
	        this.enrollDate = enrollDate;
	    }

	    public String getCompletionDate() {
	        return completionDate;
	    }

	    public void setCompletionDate(String completionDate) {
	        this.completionDate = completionDate;
	    }

	    public String getCourseCode() {
	        return courseCode;
	    }

	    public void setCourseCode(String courseCode) {
	        this.courseCode = courseCode;
	    }

		@Override
		public String toString() {
			return "Student [id=" + id + ", name=" + name + ", dob=" + dob + ", gender=" + gender + ", email=" + email
					+ ", mobile=" + mobile + ", bloodGroup=" + bloodGroup + ", fatherName=" + fatherName
					+ ", motherName=" + motherName + ", address=" + address + ", enrollId=" + enrollId + ", enrollDate="
					+ enrollDate + ", completionDate=" + completionDate + ", courseCode=" + courseCode + "]";
		}
	    

}
