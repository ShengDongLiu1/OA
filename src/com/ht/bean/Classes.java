package com.ht.bean;

import java.util.Set;

/**
 * Classes entity. @author MyEclipse Persistence Tools
 */

public class Classes implements java.io.Serializable {
	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer classid;
	private String classname;
	private Integer classcount;
	private Dep empteach;
	private Dep empteachs;
	private Dep empteaches;
	private String classaddr;
	private String classlx;
	
	private Set<Student> stu;
	
	public Set<Student> getStu() {
		return stu;
	}

	public void setStu(Set<Student> stu) {
		this.stu = stu;
	}

	public Classes() {
	}

	public Classes(Integer classid, String classname, Integer classcount, Dep empteach, Dep empteachs, Dep empteaches,
			String classaddr) {
		this.classid = classid;
		this.classname = classname;
		this.classcount = classcount;
		this.empteach = empteach;
		this.empteachs = empteachs;
		this.empteaches = empteaches;
		this.classaddr = classaddr;
	}

	public Integer getClassid() {
		return this.classid;
	}
	
	public String getClasslx() {
		return classlx;
	}

	public void setClasslx(String classlx) {
		this.classlx = classlx;
	}

	public void setClassid(Integer classid) {
		this.classid = classid;
	}

	public String getClassname() {
		return this.classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}
	
	public Integer getClasscount() {
		return classcount;
	}

	public void setClasscount(Integer classcount) {
		this.classcount = classcount;
	}

	public String getClassaddr() {
		return this.classaddr;
	}

	public void setClassaddr(String classaddr) {
		this.classaddr = classaddr;
	}

	public Dep getEmpteach() {
		return empteach;
	}

	public void setEmpteach(Dep empteach) {
		this.empteach = empteach;
	}

	public Dep getEmpteachs() {
		return empteachs;
	}

	public void setEmpteachs(Dep empteachs) {
		this.empteachs = empteachs;
	}

	public Dep getEmpteaches() {
		return empteaches;
	}

	public void setEmpteaches(Dep empteaches) {
		this.empteaches = empteaches;
	}

}