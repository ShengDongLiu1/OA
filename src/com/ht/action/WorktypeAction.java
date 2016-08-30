package com.ht.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Worktype;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.WorktypeService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author OYH
 * 办公用品类型管理
 */
public class WorktypeAction extends ActionSupport {

	private static final long serialVersionUID = -1892983975859380194L;

	private WorktypeService worktypeService;
	private Pager<Worktype> pager;
	private Worktype worktype;
	private List<Worktype> rows;
	private long total;
	private int page;
	private ControllerResult result;
	
	public ControllerResult getResult() {
		return result;
	}

	public Worktype getWorktype() {
		return worktype;
	}

	public void setWorktype(Worktype worktype) {
		this.worktype = worktype;
	}

	public List<Worktype> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setWorktypeService(WorktypeService worktypeService) {
		this.worktypeService = worktypeService;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		worktype = worktypeService.add(worktype);
		if(worktype == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}

	public String delete() {
		worktypeService.delete(worktype);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}

	public String update() {
		worktype = worktypeService.update(worktype);
		if(worktype == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}

	public String query() {
		worktypeService.query(worktype);
		return SUCCESS;
	}

	public String queryAll() {
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = worktypeService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String all() {
		return "all";
	}
}
