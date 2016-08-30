package com.ht.bean;

/**
 * Report entity. @author MyEclipse Persistence Tools
 */

public class Report implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer rid;
	private Integer eid;
	private String rdate;
	private String rsun;
	private String rmon;
	private String rtue;
	private String twed;
	private String rthu;
	private String tfri;
	private String rsta;
	private String rsummary;

	// Constructors

	/** default constructor */
	public Report() {
	}

	/** full constructor */
	public Report(Integer eid, String rdate, String rsun, String rmon,
			String rtue, String twed, String rthu, String tfri, String rsta,
			String rsummary) {
		this.eid = eid;
		this.rdate = rdate;
		this.rsun = rsun;
		this.rmon = rmon;
		this.rtue = rtue;
		this.twed = twed;
		this.rthu = rthu;
		this.tfri = tfri;
		this.rsta = rsta;
		this.rsummary = rsummary;
	}

	// Property accessors

	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public Integer getEid() {
		return this.eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public String getRdate() {
		return this.rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getRsun() {
		return this.rsun;
	}

	public void setRsun(String rsun) {
		this.rsun = rsun;
	}

	public String getRmon() {
		return this.rmon;
	}

	public void setRmon(String rmon) {
		this.rmon = rmon;
	}

	public String getRtue() {
		return this.rtue;
	}

	public void setRtue(String rtue) {
		this.rtue = rtue;
	}

	public String getTwed() {
		return this.twed;
	}

	public void setTwed(String twed) {
		this.twed = twed;
	}

	public String getRthu() {
		return this.rthu;
	}

	public void setRthu(String rthu) {
		this.rthu = rthu;
	}

	public String getTfri() {
		return this.tfri;
	}

	public void setTfri(String tfri) {
		this.tfri = tfri;
	}

	public String getRsta() {
		return this.rsta;
	}

	public void setRsta(String rsta) {
		this.rsta = rsta;
	}

	public String getRsummary() {
		return this.rsummary;
	}

	public void setRsummary(String rsummary) {
		this.rsummary = rsummary;
	}

}