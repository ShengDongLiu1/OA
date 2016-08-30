package com.ht.bean;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 5207074570011533400L;

	private Integer uid;
	private Integer eid;
	private String uname;
	private String pwd;
	private int status;
	private Status statuss;
    private Dep dep;
	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String uname, String pwd, int status) {
		this.uname = uname;
		this.pwd = pwd;
		this.status = status;
	}

	// Property accessors

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

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Status getStatuss() {
		return statuss;
	}

	public void setStatuss(Status statuss) {
		this.statuss = statuss;
	}

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

}