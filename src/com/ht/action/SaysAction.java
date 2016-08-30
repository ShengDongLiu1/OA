package com.ht.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Says;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.SaysService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author djs
 * 谈心记录
 */
public class SaysAction extends ActionSupport {
	private static final long serialVersionUID = 6188507486009467648L;
	private SaysService saysService;
	private Pager<Says> pager;
	private Says says;
	private List<Says> rows;
	private long total;
	private int page;
	private ControllerResult result;

	public void setSaysService(SaysService saysService) {
		this.saysService = saysService;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public Says getSays() {
		return says;
	}

	public void setSays(Says sayss) {
		this.says = sayss;
	}
	
	public List<Says> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add(){
		says = saysService.add(says);
		if(says == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}
	
	public String query(){
		saysService.query(says);
		return SUCCESS;
	}
	
	public String update(){
		says = saysService.update(says);
		if(says == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		saysService.delete(says);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = saysService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String all() {
		return "all";
	}
}
