package com.ht.bean;

/**
 * Computer entity. @author MyEclipse Persistence Tools
 */

public class Computer implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer comid;
	private String coma;
	private String comb;
	private Integer comcount;
	private Integer stuid;
	
	private Student student;

	// Constructors

	public Integer getComcount() {
		return comcount;
	}

	public void setComcount(Integer comcount) {
		this.comcount = comcount;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	/** default constructor */
	public Computer() {
	}

	/** full constructor */
	public Computer(String coma, String comb, Integer stuid) {
		this.coma = coma;
		this.comb = comb;
		this.stuid = stuid;
	}

	// Property accessors

	public Integer getComid() {
		return this.comid;
	}

	public void setComid(Integer comid) {
		this.comid = comid;
	}

	public String getComa() {
		return this.coma;
	}

	public void setComa(String coma) {
		this.coma = coma;
	}

	public String getComb() {
		return this.comb;
	}

	public void setComb(String comb) {
		this.comb = comb;
	}

	public Integer getStuid() {
		return this.stuid;
	}

	public void setStuid(Integer stuid) {
		this.stuid = stuid;
	}

}