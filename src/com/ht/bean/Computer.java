package com.ht.bean;

/**
 * Computer entity. @author MyEclipse Persistence Tools
 */

public class Computer implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer comid;
	private Integer comno;
	private String coma;
	private String comb;
	private String reason;
	private Integer stuid;
	
	private Student student;

	// Constructors

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
	
	public Integer getComno() {
		return comno;
	}

	public void setComno(Integer comno) {
		this.comno = comno;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Integer getStuid() {
		return this.stuid;
	}

	public void setStuid(Integer stuid) {
		this.stuid = stuid;
	}

}