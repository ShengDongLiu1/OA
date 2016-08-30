package com.ht.bean;

import java.util.Date;

public class Fankui implements java.io.Serializable {

	private static final long serialVersionUID = 6796036839125534595L;
	private Integer Tbackid;
	private String pro;
	private String ans;
	private String title;
	private Date time;
	
	private Dep dep;
	
	public Fankui() {
	}

	public Fankui(Integer tBackid, String pro, String ans, String title, Date time) {
		Tbackid = tBackid;
		this.pro = pro;
		this.ans = ans;
		this.title = title;
		this.time = time;
	}
	
	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getTbackid() {
		return this.Tbackid;
	}

	public void setTbackid(Integer Tbackid) {
		this.Tbackid = Tbackid;
	}

	public String getPro() {
		return this.pro;
	}

	public void setPro(String pro) {
		this.pro = pro;
	}

	public String getAns() {
		return this.ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}

	@Override
	public String toString() {
		return "Fankui [Tbackid=" + Tbackid + ", pro=" + pro + ", ans=" + ans + ", title=" + title + ", time=" + time
				+ ", dep=" + dep + "]";
	}

}