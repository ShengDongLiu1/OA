package com.ht.bean;

import java.util.Date;

/**
 * Receiue entity. @author MyEclipse Persistence Tools
 */

public class Receiue implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer uid;
	private Integer eid;
	private Integer uwork;
	private Integer ucount;
	private String upurpose;
	private Date ucreattime;
	private Date uendtime;
	private String restore;
	
	private Work work;
	private Dep dep;
	private Worktype worktype;


	/** default constructor */
	public Receiue() {
	}

	/** full constructor */
	public Receiue(Integer eid,Integer ucount, String upurpose,
			Date ucreattime, Date uendtime) {
		this.eid = eid;
		this.ucount = ucount;
		this.upurpose = upurpose;
		this.ucreattime = ucreattime;
		this.uendtime = uendtime;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public Integer getUcount() {
		return ucount;
	}

	public void setUcount(Integer ucount) {
		this.ucount = ucount;
	}

	public String getUpurpose() {
		return upurpose;
	}

	public void setUpurpose(String upurpose) {
		this.upurpose = upurpose;
	}

	public Date getUcreattime() {
		return ucreattime;
	}

	public void setUcreattime(Date ucreattime) {
		this.ucreattime = ucreattime;
	}

	public Date getUendtime() {
		return uendtime;
	}

	public void setUendtime(Date uendtime) {
		this.uendtime = uendtime;
	}

	public Integer getUwork() {
		return uwork;
	}

	public void setUwork(Integer uwork) {
		this.uwork = uwork;
	}

	public String getRestore() {
		return restore;
	}

	public void setRestore(String restore) {
		this.restore = restore;
	}

	public Work getWork() {
		return work;
	}

	public void setWork(Work work) {
		this.work = work;
	}

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	public Worktype getWorktype() {
		return worktype;
	}

	public void setWorktype(Worktype worktype) {
		this.worktype = worktype;
	}


}