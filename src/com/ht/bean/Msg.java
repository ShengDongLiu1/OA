package com.ht.bean;

/**
 * Msg entity. @author MyEclipse Persistence Tools
 */

public class Msg implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private Integer msgid;
	private String msgcon;
	private String msgks;
	private String msgjz;
	
	public Msg() {
	}

	public Msg(Integer msgid, String msgcon, String msgks, String msgjz) {
		this.msgid = msgid;
		this.msgcon = msgcon;
		this.msgks = msgks;
		this.msgjz = msgjz;
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

	public String getMsgks() {
		return msgks;
	}

	public void setMsgks(String msgks) {
		this.msgks = msgks;
	}

	public String getMsgjz() {
		return msgjz;
	}

	public void setMsgjz(String msgjz) {
		this.msgjz = msgjz;
	}

	@Override
	public String toString() {
		return "Msg [msgid=" + msgid + ", msgcon=" + msgcon + ", msgks=" + msgks + ", msgjz=" + msgjz + "]";
	}
}