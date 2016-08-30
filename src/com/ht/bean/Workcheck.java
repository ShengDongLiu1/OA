package com.ht.bean;

import java.util.Date;

/**
 * Workcheck entity. @author MyEclipse Persistence Tools
 */

public class Workcheck implements java.io.Serializable {

	private static final long serialVersionUID = 655966617859861232L;
	private Integer wid;
	private Integer eid;
	private Date wdate;
	private String status;
	private Dep dep;

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	public Workcheck() {
	}

	public Workcheck(Integer eid, Date wdate, String status) {
		this.eid = eid;
		this.wdate = wdate;
		this.status=status;
	}


	public Integer getWid() {
		return this.wid;
	}

	public void setWid(Integer wid) {
		this.wid = wid;
	}

	public Integer getEid() {
		return this.eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public Date getWdate() {
		return this.wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Workcheck [wid=" + wid + ", eid=" + eid + ", wdate=" + wdate + ", status=" + status + ", dep=" + dep
				+ "]";
	}
	
	
}