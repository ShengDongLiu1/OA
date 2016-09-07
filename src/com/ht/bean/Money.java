package com.ht.bean;

import java.util.Date;

public class Money implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer mid;
	private Integer stuid;
	private Integer eid;
	private String semester;
	private double ys;
	private double actual;
	private double owe;
	private Date mtime;
	
	private Dep dep;
	private Student student;
	
	public Integer getMid() {
		return mid;
	}
	
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	
	public Integer getStuid() {
		return stuid;
	}
	
	public void setStuid(Integer stuid) {
		this.stuid = stuid;
	}
	
	public Integer getEid() {
		return eid;
	}
	
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	
	public double getYs() {
		return ys;
	}
	
	public void setYs(double ys) {
		this.ys = ys;
	}
	
	public double getActual() {
		return actual;
	}
	
	public void setActual(double actual) {
		this.actual = actual;
	}
	
	public double getOwe() {
		return owe;
	}
	
	public void setOwe(double owe) {
		this.owe = owe;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public Date getMtime() {
		return mtime;
	}

	public void setMtime(Date mtime) {
		this.mtime = mtime;
	}

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}
