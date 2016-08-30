package com.ht.bean;

/**
 * Stutotal entity. @author MyEclipse Persistence Tools
 */

public class Stutotal implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer sid;
	private Integer stuid;
	private String ssay;
	private String semester;
	
	private Student student;


	/** default constructor */
	public Stutotal() {
	}

	/** full constructor */
	public Stutotal(Integer stuid, String ssay) {
		this.stuid = stuid;
		this.ssay = ssay;
	}


	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getStuid() {
		return this.stuid;
	}

	public void setStuid(Integer stuid) {
		this.stuid = stuid;
	}

	public String getSsay() {
		return this.ssay;
	}

	public void setSsay(String ssay) {
		this.ssay = ssay;
	}
	
	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@Override
	public String toString() {
		return "Stutotal [sid=" + sid + ", stuid=" + stuid + ", ssay=" + ssay + ", semester=" + semester + "]";
	}
	
	

}