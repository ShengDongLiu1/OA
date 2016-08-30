package com.ht.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Rawpun;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.RawpunService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author djs
 * 奖惩管理
 */
public class RawpunAction extends ActionSupport{
	private static final long serialVersionUID = 3776576797212584629L;
	private RawpunService rawpunService;
	private Pager<Rawpun> pager;
	private Rawpun rawpun;
	private List<Rawpun> rows;
	private long total;
	private int page;
	private ControllerResult result;

	public void setRawpunService(RawpunService rawpunService) {
		this.rawpunService = rawpunService;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public Rawpun getRawpun() {
		return rawpun;
	}

	public void setRawpun(Rawpun rawpun) {
		this.rawpun = rawpun;
	}
	
	public List<Rawpun> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public String add(){
		rawpun = rawpunService.add(rawpun);
		if(rawpun == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}
	
	public String query(){
		rawpunService.query(rawpun);
		return SUCCESS;
	}
	
	public String update(){
		rawpun = rawpunService.update(rawpun);
		if(rawpun == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		rawpunService.delete(rawpun);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = rawpunService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String all() {
		return "all";
	}

}
