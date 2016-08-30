package com.ht.bean;

/**
 * Grade entity. @author MyEclipse Persistence Tools
 */

public class Grade implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer scoid;
	private Integer stuid;
	private Float score;
	private String sconame;
	private Student students;

	// Constructors

	/** default constructor */
	public Grade() {
	}

	/** minimal constructor */
	public Grade(Integer scoid) {
		this.scoid = scoid;
	}

	/** full constructor */
	public Grade(Integer scoid, Integer stuid, Float score, String sconame) {
		this.scoid = scoid;
		this.stuid = stuid;
		this.score = score;
		this.sconame = sconame;
	}

	// Property accessors

	public Integer getScoid() {
		return this.scoid;
	}

	public void setScoid(Integer scoid) {
		this.scoid = scoid;
	}

	public Integer getStuid() {
		return this.stuid;
	}

	public void setStuid(Integer stuid) {
		this.stuid = stuid;
	}

	public Float getScore() {
		return this.score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public String getSconame() {
		return this.sconame;
	}

	public void setSconame(String sconame) {
		this.sconame = sconame;
	}

	public Student getStudents() {
		return students;
	}

	public void setStudents(Student students) {
		this.students = students;
	}

}