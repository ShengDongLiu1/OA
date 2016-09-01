package com.ht.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * Depsartment entity. @author MyEclipse Persistence Tools
 */

public class Department implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer did;
	private String dname;
	private String dcreatetime;
	private Set<Dep> deps;


	public Department() {
	}

	public Department(String dname, String dcreatetime) {
		this.dname = dname;
		this.dcreatetime = dcreatetime;
	}

	public Integer getDid() {
		return this.did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public String getDname() {
		return this.dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDcreatetime() {
		return this.dcreatetime;
	}

	public void setDcreatetime(String dcreatetime) {
		this.dcreatetime = dcreatetime;
	}

	@JSON(serialize=false)
	public Set<Dep> getDeps() {
		return deps;
	}

	public void setDeps(Set<Dep> deps) {
		this.deps = deps;
	}

}