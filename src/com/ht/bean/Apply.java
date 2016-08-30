package com.ht.bean;

import java.util.Date;

/**
 * Apply entity. @author MyEclipse Persistence Tools
 */

public class Apply implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 773504404485074813L;

	private Integer aid;
	private String gname;
	private Integer gcounts;
	private String gunit;
	private double gprice;
	private double gtotle;
	private String gpurpose;
	private Date adatetime;
	private String astatus;
	
	private Dep dep;
	private Worktype worktype;

	// Constructors


	public Integer getGcounts() {
		return gcounts;
	}


	public void setGcounts(Integer gcounts) {
		this.gcounts = gcounts;
	}


	public String getGunit() {
		return gunit;
	}


	public void setGunit(String gunit) {
		this.gunit = gunit;
	}


	public double getGprice() {
		return gprice;
	}


	public void setGprice(double gprice) {
		this.gprice = gprice;
	}


	public double getGtotle() {
		return gtotle;
	}


	public void setGtotle(double gtotle) {
		this.gtotle = gtotle;
	}


	public String getGpurpose() {
		return gpurpose;
	}


	public void setGpurpose(String gpurpose) {
		this.gpurpose = gpurpose;
	}


	public Dep getDep() {
		return dep;
	}


	public void setDep(Dep dep) {
		this.dep = dep;
	}

	/** default constructor */
	public Apply() {
	}

	/** full constructor */
	public Apply( String gname, Integer gcounts,
			String gunit, Double gprice, Long gtotle, String gpurpose, Date adatetime, String astatus) {
		this.gname = gname;
		this.gcounts = gcounts;
		this.gunit = gunit;
		this.gprice = gprice;
		this.gtotle = gtotle;
		this.gpurpose = gpurpose;
		this.adatetime = adatetime;
		this.astatus = astatus;
	}

	// Property accessors

	public Integer getAid() {
		return this.aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Date getAdatetime() {
		return this.adatetime;
	}

	public void setAdatetime(Date adatetime) {
		this.adatetime = adatetime;
	}

	public String getAstatus() {
		return this.astatus;
	}

	public void setAstatus(String astatus) {
		this.astatus = astatus;
	}

	public Worktype getWorktype() {
		return worktype;
	}


	public void setWorktype(Worktype worktype) {
		this.worktype = worktype;
	}


	public String getGname() {
		return gname;
	}


	public void setGname(String gname) {
		this.gname = gname;
	}



}