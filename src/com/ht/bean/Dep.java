package com.ht.bean;

import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * Dep entity. @author MyEclipse Persistence Tools
 */

public class Dep implements java.io.Serializable {

	private static final long serialVersionUID = -199868942063273880L;
	private Integer eid;
	private String ename;
	private String esex;
	private Integer mid;
	private String ebirth;
	private String enumber;
	private String ecertid;
	private String ecity;
	private String eanton;
	private String edu;
	private String eaddr;
	private Date etry;
	private String ecreate;
	private Double basepay;
	
    private Set<User> users;
	private Set<Fankui> fankuis;
	private Set<Items> items;
	private Set<Classes> classch;
	private Set<Classes> classchs;
	private Set<Classes> classches;
	private Set<Receiue> receiues;
	private Set<Apply> apply;
	private Set<Workcheck> workcheck;
	private Set<Pays> pays;
	private Set<Duty> dutys;
	private Jobs jobs;
	private Department departments;
	private Dstatus dstatuss;
	private Set<Says> says;

	public Dep(String ename, String esex, Integer mid, String ebirth,
			String ecertid, String ecity, String eanton, String edu,
			String eaddr, Date etry, String ecreate, Dstatus dstatuss) {
		this.ename = ename;
		this.esex = esex;
		this.mid = mid;
		this.ebirth = ebirth;
		this.ecertid = ecertid;
		this.ecity = ecity;
		this.eanton = eanton;
		this.edu = edu;
		this.eaddr = eaddr;
		this.etry = etry;
		this.ecreate = ecreate;
		this.dstatuss = dstatuss;
	}

	public Dep() {
		
	}

	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEsex() {
		return esex;
	}

	public void setEsex(String esex) {
		this.esex = esex;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getEbirth() {
		return ebirth;
	}

	public void setEbirth(String ebirth) {
		this.ebirth = ebirth;
	}

	public String getEnumber() {
		return enumber;
	}

	public void setEnumber(String enumber) {
		this.enumber = enumber;
	}

	public String getEcertid() {
		return ecertid;
	}

	public void setEcertid(String ecertid) {
		this.ecertid = ecertid;
	}

	public String getEcity() {
		return ecity;
	}

	public void setEcity(String ecity) {
		this.ecity = ecity;
	}

	public String getEanton() {
		return eanton;
	}

	public void setEanton(String eanton) {
		this.eanton = eanton;
	}

	public String getEdu() {
		return edu;
	}

	public void setEdu(String edu) {
		this.edu = edu;
	}

	public String getEaddr() {
		return eaddr;
	}

	public void setEaddr(String eaddr) {
		this.eaddr = eaddr;
	}

	public Date getEtry() {
		return etry;
	}

	public void setEtry(Date etry) {
		this.etry = etry;
	}

	public String getEcreate() {
		return ecreate;
	}

	public void setEcreate(String ecreate) {
		this.ecreate = ecreate;
	}
	

	public Double getBasepay() {
		return basepay;
	}

	public void setBasepay(Double basepay) {
		this.basepay = basepay;
	}

	@JSON(serialize=false)
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@JSON(serialize=false)
	public Set<Fankui> getFankuis() {
		return fankuis;
	}

	public void setFankuis(Set<Fankui> fankuis) {
		this.fankuis = fankuis;
	}

	@JSON(serialize=false)
	public Set<Items> getItems() {
		return items;
	}

	public void setItems(Set<Items> items) {
		this.items = items;
	}

	@JSON(serialize=false)
	public Set<Classes> getClassch() {
		return classch;
	}

	public void setClassch(Set<Classes> classch) {
		this.classch = classch;
	}

	@JSON(serialize=false)
	public Set<Classes> getClasschs() {
		return classchs;
	}

	public void setClasschs(Set<Classes> classchs) {
		this.classchs = classchs;
	}

	@JSON(serialize=false)
	public Set<Classes> getClassches() {
		return classches;
	}

	public void setClassches(Set<Classes> classches) {
		this.classches = classches;
	}

	@JSON(serialize=false)
	public Set<Receiue> getReceiues() {
		return receiues;
	}

	public void setReceiues(Set<Receiue> receiues) {
		this.receiues = receiues;
	}

	@JSON(serialize=false)
	public Set<Apply> getApply() {
		return apply;
	}

	public void setApply(Set<Apply> apply) {
		this.apply = apply;
	}

	@JSON(serialize=false)
	public Set<Workcheck> getWorkcheck() {
		return workcheck;
	}

	public void setWorkcheck(Set<Workcheck> workcheck) {
		this.workcheck = workcheck;
	}

	@JSON(serialize=false)
	public Set<Pays> getPays() {
		return pays;
	}

	public void setPays(Set<Pays> pays) {
		this.pays = pays;
	}

	@JSON(serialize=false)
	public Set<Duty> getDutys() {
		return dutys;
	}

	public void setDutys(Set<Duty> dutys) {
		this.dutys = dutys;
	}

	@JSON(serialize=false)
	public Set<Says> getSays() {
		return says;
	}

	public void setSays(Set<Says> says) {
		this.says = says;
	}

	public Jobs getJobs() {
		return jobs;
	}

	public void setJobs(Jobs jobs) {
		this.jobs = jobs;
	}

	public Department getDepartments() {
		return departments;
	}

	public void setDepartments(Department departments) {
		this.departments = departments;
	}

	public Dstatus getDstatuss() {
		return dstatuss;
	}

	public void setDstatuss(Dstatus dstatuss) {
		this.dstatuss = dstatuss;
	}
	

}