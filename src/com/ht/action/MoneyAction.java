package com.ht.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Income;
import com.ht.common.Pager;
import com.ht.service.IncomeService;
import com.opensymphony.xwork2.ActionSupport;

public class MoneyAction extends ActionSupport {

	private static final long serialVersionUID = -6812629349289155254L;
	

	private IncomeService incomeService;
	private Pager<Income> pager;
	private Income income;
	private List<Income> rows;
	private long total;

	private int page;


	public void setIncomeService(IncomeService incomeService) {
		this.incomeService = incomeService;
	}

	public Income getIncome() {
		return income;
	}

	public void setIncome(Income income) {
		this.income = income;
	}
	
	public void setPager(Pager<Income> pager) {
		this.pager = pager;
	}

	public long getTotal() {
		return total;
	}

	public List<Income> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		incomeService.add(income);
		return SUCCESS;
	}

	public String update() {
		incomeService.update(income);
		return SUCCESS;
	}

	public String delete() {
		incomeService.delete(income);
		return SUCCESS;
	}

	public String query() {
		incomeService.query(income);
		return SUCCESS;
	}

	public String queryAll() {
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = incomeService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	

	public String all() {
		return "all";
	}
}
