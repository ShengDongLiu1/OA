package com.ht.bean;

import java.util.Date;

/**
 * 
 * @author Su
 *
 */
public class Expend implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer payid;
	private String paypro;
	private double paycount;
	private Date ptime;
	private String payname;

	public Expend() {
	}

	public Expend(String paypro, double paycount) {
		this.paypro = paypro;
		this.paycount = paycount;
	}


	public Integer getPayid() {
		return this.payid;
	}

	public void setPayid(Integer payid) {
		this.payid = payid;
	}

	public String getPaypro() {
		return this.paypro;
	}

	public void setPaypro(String paypro) {
		this.paypro = paypro;
	}

	public double getPaycount() {
		return this.paycount;
	}

	public void setPaycount(double paycount) {
		this.paycount = paycount;
	}

	public Date getPtime() {
		return ptime;
	}

	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}

	public String getPayname() {
		return payname;
	}

	public void setPayname(String payname) {
		this.payname = payname;
	}

	
}