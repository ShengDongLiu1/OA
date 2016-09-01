package com.ht.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * Worktype entity. @author MyEclipse Persistence Tools
 */

public class Worktype implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer swid;
	private String swname;
	
	private Set<Work> works;
	private Set<Apply> applys;
	private Set<Receiue> receiue;

	public Worktype() {
	}

	public Worktype(String swname) {
		this.swname = swname;
	}

	public Integer getSwid() {
		return this.swid;
	}

	public void setSwid(Integer swid) {
		this.swid = swid;
	}

	public String getSwname() {
		return this.swname;
	}

	public void setSwname(String swname) {
		this.swname = swname;
	}

	@JSON(serialize=false)
	public Set<Apply> getApplys() {
		return applys;
	}

	public void setApplys(Set<Apply> applys) {
		this.applys = applys;
	}

	@JSON(serialize=false)
	public Set<Work> getWorks() {
		return works;
	}

	public void setWorks(Set<Work> works) {
		this.works = works;
	}

	@JSON(serialize=false)
	public Set<Receiue> getReceiue() {
		return receiue;
	}

	public void setReceiue(Set<Receiue> receiue) {
		this.receiue = receiue;
	}

}