package com.ht.bean;

import java.util.Date;

/**
 * Duty entity. @author MyEclipse Persistence Tools
 */

public class Duty implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer did;
	private Integer eid;
	private Date ddatetime;
	private String dstatus;
	private String drange;
	private String ddesc;
	
	private Dep dep;

	// Constructors

	/** default constructor */
	public Duty() {
	}

	/** full constructor */
	public Duty(Integer eid, Date ddatetime,String dstatus, String drange, String ddesc) {
		this.eid = eid;
		this.ddatetime = ddatetime;
		this.dstatus = dstatus;
		this.drange = drange;
		this.ddesc = ddesc;
	}

	// Property accessors

	public Integer getDid() {
		return this.did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public Integer getEid() {
		return this.eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public Date getDdatetime() {
		return ddatetime;
	}

	public void setDdatetime(Date ddatetime) {
		this.ddatetime = ddatetime;
	}

	public String getDrange() {
		return this.drange;
	}

	public void setDrange(String drange) {
		this.drange = drange;
	}

	public String getDdesc() {
		return this.ddesc;
	}

	public void setDdesc(String ddesc) {
		this.ddesc = ddesc;
	}

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	public String getDstatus() {
		return dstatus;
	}

	public void setDstatus(String dstatus) {
		this.dstatus = dstatus;
	}

}