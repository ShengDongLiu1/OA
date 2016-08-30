package com.ht.bean;

/**
 * WMF
 */

public class Courseplan implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer kid;
	private Integer empid;
	private Integer objectid;
	private String content;
	private Course course;
	private Dep dep;

	public Courseplan() {
	}

	public Courseplan(Integer empid, Integer objectid, String content) {
		this.empid = empid;
		this.objectid = objectid;
		this.content = content;
	}


	public Integer getKid() {
		return this.kid;
	}

	public void setKid(Integer kid) {
		this.kid = kid;
	}

	public Integer getEmpid() {
		return this.empid;
	}

	public void setEmpid(Integer empid) {
		this.empid = empid;
	}

	public Integer getObjectid() {
		return this.objectid;
	}

	public void setObjectid(Integer objectid) {
		this.objectid = objectid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}
	
}