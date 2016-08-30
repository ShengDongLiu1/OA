package com.ht.action;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import com.ht.bean.Expend;
import com.ht.common.Pager;
import com.ht.service.ExpendService;
import com.opensymphony.xwork2.ActionSupport;

public class ExpendAction extends ActionSupport{
	
	private static final long serialVersionUID = -2594624483507664833L;
	private ExpendService expendService;
	private Pager<Expend> pager;
	private Expend expend;
	private List<Expend> rows;
	private long total;
	private int page;


	public void setExpendService(ExpendService expendService) {
		this.expendService = expendService;
	}

	public Expend getExpend() {
		return expend;
	}

	public void setExpend(Expend expend) {
		this.expend = expend;
	}
	
	public void setPager(Pager<Expend> pager) {
		this.pager = pager;
	}

	public long getTotal() {
		return total;
	}

	public List<Expend> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		expendService.add(expend);
		return SUCCESS;
	}

	public String update() {
		System.out.println("update");
		System.out.println(expend.toString());
		expendService.update(expend);
		return SUCCESS;
	}

	public String delete() {
		expendService.delete(expend);
		return SUCCESS;
	}

	public String query() {
		expendService.query(expend);
		return SUCCESS;
	}

	public String queryAll() {
		System.out.println("query all");
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = expendService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String all() {
		return "all";
	}
}
