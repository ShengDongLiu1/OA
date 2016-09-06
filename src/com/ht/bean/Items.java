package com.ht.bean;

/**
 * Items entity. @author MyEclipse Persistence Tools
 */

public class Items implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer xid;
	private String sname;
	private Integer sstuid;
	private Integer steacher;
	private String sdate;
	private Float score;
	
	private Student student;
	private Dep dep;

	// Constructors

	
	public Student getStudent() {
		return student;
	}

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	/** default constructor */
	public Items() {
	}

	/** minimal constructor */
	public Items(Integer xid) {
		this.xid = xid;
	}

	/** full constructor */
	public Items(Integer xid, String sname, Integer sstuid, Integer steacher,
			String sdate, Float score) {
		this.xid = xid;
		this.sname = sname;
		this.sstuid = sstuid;
		this.steacher = steacher;
		this.sdate = sdate;
		this.score = score;
	}

	// Property accessors

	public Integer getXid() {
		return this.xid;
	}

	public void setXid(Integer xid) {
		this.xid = xid;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public Integer getSstuid() {
		return this.sstuid;
	}

	public void setSstuid(Integer sstuid) {
		this.sstuid = sstuid;
	}

	public Integer getSteacher() {
		return this.steacher;
	}

	public void setSteacher(Integer steacher) {
		this.steacher = steacher;
	}

	public String getSdate() {
		return this.sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public Float getScore() {
		return this.score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Items [xid=" + xid + ", sname=" + sname + ", sstuid=" + sstuid + ", steacher=" + steacher + ", sdate="
				+ sdate + ", score=" + score + ", student=" + student + ", dep=" + dep + "]";
	}
	
}