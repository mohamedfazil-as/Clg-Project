package org.student.mgmt.model;

public class Course {
	
	    private String courseCode;
	    private String courseName;
	    private String impleDate;
	    private boolean isActive;
	    private String discontDate;

	    // Getters and Setters
	    public String getCourseCode() {
	        return courseCode;
	    }

	    public void setCourseCode(String courseCode) {
	        this.courseCode = courseCode;
	    }

	    public String getCourseName() {
	        return courseName;
	    }

	    public void setCourseName(String courseName) {
	        this.courseName = courseName;
	    }

	    public String getImpleDate() {
	        return impleDate;
	    }

	    public void setImpleDate(String impleDate) {
	        this.impleDate = impleDate;
	    }

	    public boolean isActive() {
	        return isActive;
	    }

	    public void setActive(boolean isActive) {
	        this.isActive = isActive;
	    }

	    public String getDiscontDate() {
	        return discontDate;
	    }

	    public void setDiscontDate(String discontDate) {
	        this.discontDate = discontDate;
	    }

	    @Override
	    public String toString() {
	        return "Course{" +
	                "courseCode='" + courseCode + '\'' +
	                ", courseName='" + courseName + '\'' +
	                ", impleDate='" + impleDate + '\'' +
	                ", isActive=" + isActive +
	                ", discontDate='" + discontDate + '\'' +
	                '}';
	    }
	}


