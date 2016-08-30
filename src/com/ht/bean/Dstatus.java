package com.ht.bean;

import java.util.Set;

public class Dstatus {
	private Integer dsid;
	private String dsname;
	private Set<Dep> dep;
	
	public Dstatus(){}

	public Dstatus(Integer dsid, String dsname) {
		super();
		this.dsid = dsid;
		this.dsname = dsname;
	}

	public Integer getDsid() {
		return dsid;
	}

	public void setDsid(Integer dsid) {
		this.dsid = dsid;
	}

	public String getDsname() {
		return dsname;
	}

	public void setDsname(String dsname) {
		this.dsname = dsname;
	}

	public Set<Dep> getDep() {
		return dep;
	}

	public void setDep(Set<Dep> dep) {
		this.dep = dep;
	}

}
