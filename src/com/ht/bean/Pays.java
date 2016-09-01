package com.ht.bean;
/**
 * 
 * @author Su
 *
 */

public class Pays implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer paysid;	//工资编码
	private double paysa;	//奖励金额
	private double paysb;	//惩罚金额
	private String payspro;	//奖惩原因
	private double payssta;	//基本工资
	private double paysc;	//补贴工资
	private double paysd;	//结余工资
	private String paytime;
	private Dep dep;

	public Pays() {
	}

	public Pays( double paysa, double paysb, String payspro,
			double payssta, double paysc, double paysd) {
		this.paysa = paysa;
		this.paysb = paysb;
		this.payspro = payspro;
		this.payssta = payssta;
		this.paysc = paysc;
		this.paysd = paysd;
	}

	public Integer getPaysid() {
		return paysid;
	}

	public void setPaysid(Integer paysid) {
		this.paysid = paysid;
	}

	public double getPaysa() {
		return paysa;
	}

	public void setPaysa(double paysa) {
		this.paysa = paysa;
	}

	public double getPaysb() {
		return paysb;
	}

	public void setPaysb(double paysb) {
		this.paysb = paysb;
	}

	public String getPayspro() {
		return payspro;
	}

	public void setPayspro(String payspro) {
		this.payspro = payspro;
	}

	public double getPayssta() {
		return payssta;
	}

	public void setPayssta(double payssta) {
		this.payssta = payssta;
	}

	public double getPaysc() {
		return paysc;
	}

	public void setPaysc(double paysc) {
		this.paysc = paysc;
	}

	public double getPaysd() {
		return paysd;
	}

	public void setPaysd(double paysd) {
		this.paysd = paysd;
	}

	public String getPaytime() {
		return paytime;
	}

	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	
}