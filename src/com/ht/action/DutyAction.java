package com.ht.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Duty;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.DutyService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author djs
 * 值班管理
 */
public class DutyAction extends ActionSupport {
	private static final long serialVersionUID = 6188507486009467648L;
	private DutyService dutyService;
	private ControllerResult result;
	private Pager<Duty> pager;
	private Duty duty;
	private List<Duty> rows;

	private long total;
	
	private int page;

	public void setDutyService(DutyService dutyService) {
		this.dutyService = dutyService;
	}

	public Duty getDuty() {
		return duty;
	}

	public void setDuty(Duty duty) {
		this.duty = duty;
	}
	
	public List<Duty> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public String add(){
		duty = dutyService.add(duty);
		if(duty == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}
	
	public String query(){
		dutyService.query(duty);
		return SUCCESS;
	}
	
	public String update(){
		duty = dutyService.update(duty);
		if(duty == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		dutyService.delete(duty);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = dutyService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String all() {
		return "all";
	}
}
