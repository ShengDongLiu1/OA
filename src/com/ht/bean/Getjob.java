package com.ht.bean;

/**
 * Getjob entity. @author MyEclipse Persistence Tools
 */

public class Getjob implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer jobid;
	private String jobname;
	private String jobdesc;
	
	private Student student;

	// Constructors

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	/** default constructor */
	public Getjob() {
	}

	/** full constructor */
	public Getjob(String jobname, String jobdesc) {
		this.jobname = jobname;
		this.jobdesc = jobdesc;
	}

	// Property accessors

	public Integer getJobid() {
		return this.jobid;
	}

	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}

	public String getJobname() {
		return this.jobname;
	}

	public void setJobname(String jobname) {
		this.jobname = jobname;
	}

	public String getJobdesc() {
		return this.jobdesc;
	}

	public void setJobdesc(String jobdesc) {
		this.jobdesc = jobdesc;
	}

}