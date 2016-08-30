package com.ht.bean;

import java.util.Date;

/**
 * Income entity. @author MyEclipse Persistence Tools
 */

public class Income implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer monid;
	private double moncount;
	private String monpro;
	private String mname;
	private Date mdate;

	public Income() {
	}

	public Income(Long moncount, String monpro) {
		this.moncount = moncount;
		this.monpro = monpro;
	}

	public Integer getMonid() {
		return this.monid;
	}

	public void setMonid(Integer monid) {
		this.monid = monid;
	}

	public double getMoncount() {
		return this.moncount;
	}

	public void setMoncount(double moncount) {
		this.moncount = moncount;
	}

	public String getMonpro() {
		return this.monpro;
	}

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}

	public void setMonpro(String monpro) {
		this.monpro = monpro;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	@Override
	public String toString() {
		return "Income [monid=" + monid + ", moncount=" + moncount + ", monpro=" + monpro + "]";
	}

	
}