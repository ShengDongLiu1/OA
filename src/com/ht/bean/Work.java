package com.ht.bean;

/**
 * Work entity. @author MyEclipse Persistence Tools
 */

public class Work implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer wid;
	private Integer wtypeid;
	private String wname;
	private Integer wcount;
	private Integer wamount;
	
	private Worktype worktype;

	public Worktype getWorktype() {
		return worktype;
	}

	public void setWorktype(Worktype worktype) {
		this.worktype = worktype;
	}

	/** default constructor */
	public Work() {
	}

	/** full constructor */
	public Work(Integer wtypeid, String wname, Integer wamount) {
		this.wtypeid = wtypeid;
		this.wname = wname;
		this.wamount = wamount;
	}

	// Property accessors

	public Integer getWid() {
		return this.wid;
	}

	public void setWid(Integer wid) {
		this.wid = wid;
	}

	public Integer getWtypeid() {
		return this.wtypeid;
	}

	public void setWtypeid(Integer wtypeid) {
		this.wtypeid = wtypeid;
	}

	public String getWname() {
		return this.wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public Integer getWcount() {
		return wcount;
	}

	public void setWcount(Integer wcount) {
		this.wcount = wcount;
	}

	public Integer getWamount() {
		return this.wamount;
	}

	public void setWamount(Integer wamount) {
		this.wamount = wamount;
	}

	@Override
	public String toString() {
		return "Work [wid=" + wid + ", wtypeid=" + wtypeid + ", wname=" + wname + ", wcount=" + wcount + ", wamount=" + wamount + ", worktype="
				+ worktype + "]";
	}
	
	

}