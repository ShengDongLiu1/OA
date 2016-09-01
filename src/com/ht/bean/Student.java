package com.ht.bean;

import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 7278254363569334471L;
	
	
	private Integer intenid;
	private String intenname;
	private String intensch;
	private String intensex;
	private Integer intenage;
	private String intenbir;
	private String intenfat;
	private String intentel;
	private String intenfatel;
	private String intenaddr;
	private String intenpeo;
	private String intenstatus;
	private Integer classid;
	private Integer hourid;
	private Date intendate;
	private String intenmz;
	private String intenjg;
	private int stustatus;
	
	private Set<Items> items;
	private Set<Grade> grades;
	private Set<Computer> computer;
	private Set<Getjob> getjob;
	private Set<Stutotal> stutotal;
	private Status status;
	private Classes classes;
	private Hourse hourse;
	/** default constructor */
	public Student() {
	}

	/** full constructor */
	public Student(String intenname, String intensch, String intensex,
			Integer intenage, String intenbir,
			String intenfat, String intentel, String intenfatel,
			String intenaddr, String intenpeo, String intenstatus,
			Integer classid, Integer hourid, Date intendate) {
		this.intenname = intenname;
		this.intensch = intensch;
		this.intensex = intensex;
		this.intenage = intenage;
		this.intenbir = intenbir;
		this.intenfat = intenfat;
		this.intentel = intentel;
		this.intenfatel = intenfatel;
		this.intenaddr = intenaddr;
		this.intenpeo = intenpeo;
		this.intenstatus = intenstatus;
		this.classid = classid;
		this.hourid = hourid;
		this.intendate = intendate;
	}

	// Property accessors

	public Integer getIntenid() {
		return this.intenid;
	}

	public void setIntenid(Integer intenid) {
		this.intenid = intenid;
	}

	public String getIntenname() {
		return this.intenname;
	}

	public void setIntenname(String intenname) {
		this.intenname = intenname;
	}

	public String getIntensch() {
		return this.intensch;
	}

	public void setIntensch(String intensch) {
		this.intensch = intensch;
	}

	public String getIntensex() {
		return this.intensex;
	}

	public void setIntensex(String intensex) {
		this.intensex = intensex;
	}

	public Integer getIntenage() {
		return this.intenage;
	}

	public void setIntenage(Integer intenage) {
		this.intenage = intenage;
	}

	public String getIntenbir() {
		return this.intenbir;
	}

	public void setIntenbir(String intenbir) {
		this.intenbir = intenbir;
	}

	public String getIntenfat() {
		return this.intenfat;
	}

	public void setIntenfat(String intenfat) {
		this.intenfat = intenfat;
	}

	public String getIntentel() {
		return this.intentel;
	}

	public void setIntentel(String intentel) {
		this.intentel = intentel;
	}

	public String getIntenfatel() {
		return this.intenfatel;
	}

	public void setIntenfatel(String intenfatel) {
		this.intenfatel = intenfatel;
	}

	public String getIntenaddr() {
		return this.intenaddr;
	}

	public void setIntenaddr(String intenaddr) {
		this.intenaddr = intenaddr;
	}

	public String getIntenpeo() {
		return this.intenpeo;
	}

	public void setIntenpeo(String intenpeo) {
		this.intenpeo = intenpeo;
	}

	public String getIntenstatus() {
		return this.intenstatus;
	}

	public void setIntenstatus(String intenstatus) {
		this.intenstatus = intenstatus;
	}

	public Integer getClassid() {
		return this.classid;
	}

	public void setClassid(Integer classid) {
		this.classid = classid;
	}

	public Integer getHourid() {
		return this.hourid;
	}

	public void setHourid(Integer hourid) {
		this.hourid = hourid;
	}

	public Date getIntendate() {
		return this.intendate;
	}

	public void setIntendate(Date intendate) {
		this.intendate = intendate;
	}

	@JSON(serialize=false)
	public Set<Grade> getGrades() {
		return grades;
	}

	public void setGrades(Set<Grade> grades) {
		this.grades = grades;
	}

	public int getStustatus() {
		return stustatus;
	}

	public void setStustatus(int stustatus) {
		this.stustatus = stustatus;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public String getIntenmz() {
		return intenmz;
	}

	public void setIntenmz(String intenmz) {
		this.intenmz = intenmz;
	}

	public String getIntenjg() {
		return intenjg;
	}

	public void setIntenjg(String intenjg) {
		this.intenjg = intenjg;
	}

	public Hourse getHourse() {
		return hourse;
	}

	public void setHourse(Hourse hourse) {
		this.hourse = hourse;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	@JSON(serialize=false)
	public Set<Items> getItems() {
		return items;
	}

	public void setItems(Set<Items> items) {
		this.items = items;
	}

	@JSON(serialize=false)
	public Set<Computer> getComputer() {
		return computer;
	}

	public void setComputer(Set<Computer> computer) {
		this.computer = computer;
	}

	@JSON(serialize=false)
	public Set<Getjob> getGetjob() {
		return getjob;
	}

	public void setGetjob(Set<Getjob> getjob) {
		this.getjob = getjob;
	}

	@JSON(serialize=false)
	public Set<Stutotal> getStutotal() {
		return stutotal;
	}

	public void setStutotal(Set<Stutotal> stutotal) {
		this.stutotal = stutotal;
	}

}