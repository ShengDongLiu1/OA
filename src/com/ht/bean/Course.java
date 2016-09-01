package com.ht.bean;

import java.util.Set;

/**
 * WMF
 */

public class Course implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer objectid;
	private String objectname;
	private int semester;
	private String period;
	private Set<Courseplan> courseplan;
	
	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public Set<Courseplan> getCourseplan() {
		return courseplan;
	}

	public void setCourseplan(Set<Courseplan> courseplan) {
		this.courseplan = courseplan;
	}

	public Course() {
	}

	public Course(String objectname) {
		this.objectname = objectname;
	}

	public Integer getObjectid() {
		return this.objectid;
	}

	public void setObjectid(Integer objectid) {
		this.objectid = objectid;
	}

	public String getObjectname() {
		return this.objectname;
	}

	public void setObjectname(String objectname) {
		this.objectname = objectname;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	@Override
	public String toString() {
		return "Course [objectid=" + objectid + ", objectname=" + objectname + ", semester=" + semester + "]";
	}
	
}