package com.ht.bean;

import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * Status entity. @author MyEclipse Persistence Tools
 */

public class Status implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer zid;
	private String status;
    private Set<User> user;
    private Set<Student> students;


	// Constructors

	/** default constructor */
	public Status() {
	}

	/** full constructor */
	public Status(String status) {
		this.status = status;
	}

	// Property accessors

	public Integer getZid() {
		return this.zid;
	}

	public void setZid(Integer zid) {
		this.zid = zid;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@JSON(serialize=false)
	public Set<User> getUser() {
		return user;
	}

	public void setUser(Set<User> user) {
		this.user = user;
	}

	@JSON(serialize=false)
	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

}