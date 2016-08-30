package com.ht.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Jobs entity. @author MyEclipse Persistence Tools
 */

public class Jobs implements Serializable {

	// Fields

	private static final long serialVersionUID = -2845662597244301600L;
	
	private Integer jid;
	private Integer eid;
	private String jstart;
	private String jedu;
	private Date jend;
	private Date jcompany;
	private String jpeople;
	private String jtel;

	private Dep dep;
	
	public Jobs() {
	}

	public Jobs(Integer jid, Integer eid, String jstart, String jedu, Date jend, Date jcompany, String jpeople,
			String jtel, Dep dep) {
		super();
		this.jid = jid;
		this.eid = eid;
		this.jstart = jstart;
		this.jedu = jedu;
		this.jend = jend;
		this.jcompany = jcompany;
		this.jpeople = jpeople;
		this.jtel = jtel;
		this.dep = dep;
	}

	public Integer getJid() {
		return jid;
	}

	public void setJid(Integer jid) {
		this.jid = jid;
	}

	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public String getJstart() {
		return jstart;
	}

	public void setJstart(String jstart) {
		this.jstart = jstart;
	}

	public String getJedu() {
		return jedu;
	}

	public void setJedu(String jedu) {
		this.jedu = jedu;
	}

	public Date getJend() {
		return jend;
	}

	public void setJend(Date jend) {
		this.jend = jend;
	}

	public Date getJcompany() {
		return jcompany;
	}

	public void setJcompany(Date jcompany) {
		this.jcompany = jcompany;
	}

	public String getJpeople() {
		return jpeople;
	}

	public void setJpeople(String jpeople) {
		this.jpeople = jpeople;
	}

	public String getJtel() {
		return jtel;
	}

	public void setJtel(String jtel) {
		this.jtel = jtel;
	}

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}
	
	

}