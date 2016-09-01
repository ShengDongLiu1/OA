package com.ht.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * Hourse entity. @author MyEclipse Persistence Tools
 */

public class Hourse implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer hourid;
	private String hourname;
	private Integer hourkz;
	private Integer houryz;
	private Integer hourhkz;
	private String hourxb;

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

	@JSON(serialize=false)
	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

	public Integer getHourkz() {
		return hourkz;
	}

	public void setHourkz(Integer hourkz) {
		this.hourkz = hourkz;
	}

	public Integer getHouryz() {
		return houryz;
	}

	public void setHouryz(Integer houryz) {
		this.houryz = houryz;
	}

	public Integer getHourhkz() {
		return hourhkz;
	}

	public void setHourhkz(Integer hourhkz) {
		this.hourhkz = hourhkz;
	}

	public String getHourxb() {
		return hourxb;
	}

	public void setHourxb(String hourxb) {
		this.hourxb = hourxb;
	}

	 
}