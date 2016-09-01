package com.ht.bean;

/**
 * Says entity. @author MyEclipse Persistence Tools
 */

public class Says implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer sayid;
	private Integer sayface;
	private Integer sayempid;
	private String sayscon;
	private String sayspro;
	private String sysback;
	private Dep deps;
	private Student students;

	// Constructors

	/** default constructor */
	public Says() {
	}

	/** full constructor */
	public Says(Integer sayface, Integer sayempid, String sayscon,
			String sayspro, String sysback) {
		this.sayface = sayface;
		this.sayempid = sayempid;
		this.sayscon = sayscon;
		this.sayspro = sayspro;
		this.sysback = sysback;
	}

	// Property accessors
		
	public Integer getSayid() {
		return this.sayid;
	}

	public Student getStudents() {
		return students;
	}

	public void setStudents(Student students) {
		this.students = students;
	}

	public Dep getDeps() {
		return deps;
	}

	public void setDeps(Dep deps) {
		this.deps = deps;
	}

	public void setSayid(Integer sayid) {
		this.sayid = sayid;
	}

	public Integer getSayface() {
		return this.sayface;
	}

	public void setSayface(Integer sayface) {
		this.sayface = sayface;
	}

	public Integer getSayempid() {
		return this.sayempid;
	}

	public void setSayempid(Integer sayempid) {
		this.sayempid = sayempid;
	}

	public String getSayscon() {
		return this.sayscon;
	}

	public void setSayscon(String sayscon) {
		this.sayscon = sayscon;
	}

	public String getSayspro() {
		return this.sayspro;
	}

	public void setSayspro(String sayspro) {
		this.sayspro = sayspro;
	}

	public String getSysback() {
		return this.sysback;
	}

	public void setSysback(String sysback) {
		this.sysback = sysback;
	}

}