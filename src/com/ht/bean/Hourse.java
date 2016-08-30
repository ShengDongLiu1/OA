package com.ht.bean;

import java.util.Set;

/**
 * Hourse entity. @author MyEclipse Persistence Tools
 */

public class Hourse implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer hourid;
	private String hourname;
	private String hourkz;
	private String houryz;
	private String hourhkz;

	private Set<Student> students;

	/** default constructor */
	public Hourse() {
	}

	/** full constructor */
	public Hourse(String hourname) {
		this.hourname = hourname;
	}

	// Property accessors

	public Integer getHourid() {
		return this.hourid;
	}

	public void setHourid(Integer hourid) {
		this.hourid = hourid;
	}

	public String getHourname() {
		return this.hourname;
	}

	public void setHourname(String hourname) {
		this.hourname = hourname;
	}

	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

	public String getHourkz() {
		return hourkz;
	}

	public void setHourkz(String hourkz) {
		this.hourkz = hourkz;
	}

	public String getHouryz() {
		return houryz;
	}

	public void setHouryz(String houryz) {
		this.houryz = houryz;
	}

	public String getHourhkz() {
		return hourhkz;
	}

	public void setHourhkz(String hourhkz) {
		this.hourhkz = hourhkz;
	}

	 
}