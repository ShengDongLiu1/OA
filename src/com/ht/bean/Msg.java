package com.ht.bean;

import java.util.Date;

/**
 * Msg entity. @author MyEclipse Persistence Tools
 */

public class Msg implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer msgid;
	private String msgcon;
	private Date msgks;
	
	public Msg() {
	}

	public Msg(Integer msgid, String msgcon, Date msgks) {
		this.msgid = msgid;
		this.msgcon = msgcon;
		this.msgks = msgks;
	}

	public Integer getMsgid() {
		return msgid;
	}

	public void setMsgid(Integer msgid) {
		this.msgid = msgid;
	}

	public String getMsgcon() {
		return msgcon;
	}

	public void setMsgcon(String msgcon) {
		this.msgcon = msgcon;
	}

	public Date getMsgks() {
		return msgks;
	}

	public void setMsgks(Date date) {
		this.msgks = date;
	}

	@Override
	public String toString() {
		return "Msg [msgid=" + msgid + ", msgcon=" + msgcon + ", msgks=" + msgks + "]";
	}
}