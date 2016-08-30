package com.ht.bean;

/**
 * Rawpun entity. @author MyEclipse Persistence Tools
 */

public class Rawpun implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer jid;
	private Integer jstuid;
	private String jtitle;
	private String jcontent;

	// Constructors

	/** default constructor */
	public Rawpun() {
	}

	/** full constructor */
	public Rawpun(Integer jstuid, String jtitle, String jcontent) {
		this.jstuid = jstuid;
		this.jtitle = jtitle;
		this.jcontent = jcontent;
	}

	// Property accessors

	public Integer getJid() {
		return this.jid;
	}

	public void setJid(Integer jid) {
		this.jid = jid;
	}

	public Integer getJstuid() {
		return this.jstuid;
	}

	public void setJstuid(Integer jstuid) {
		this.jstuid = jstuid;
	}

	public String getJtitle() {
		return this.jtitle;
	}

	public void setJtitle(String jtitle) {
		this.jtitle = jtitle;
	}

	public String getJcontent() {
		return this.jcontent;
	}

	public void setJcontent(String jcontent) {
		this.jcontent = jcontent;
	}

}