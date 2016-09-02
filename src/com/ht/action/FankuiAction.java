package com.ht.action;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Dep;
import com.ht.bean.Fankui;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.FankuiService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author YX
 * 教员反馈管理
 */
public class FankuiAction extends ActionSupport {
	
	private static final long serialVersionUID = 7138916939990920958L;

	private FankuiService fankuiService;
	private Pager<Fankui> pager;
	private Fankui fankui;
	private List<Fankui> rows;
	private long total;
	private ControllerResult result;

	public ControllerResult getResult() {
		return result;
	}
	
	@SuppressWarnings("unused")
	private int page;
	
	public void setFankuiService(FankuiService fankuiService) {
		this.fankuiService = fankuiService;
	}

	public Fankui getFankui() {
		return fankui;
	}

	public void setFankui(Fankui fankui) {
		this.fankui = fankui;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Fankui> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		Dep dep = new Dep();
		dep.setEid(2);
		fankui.setDep(dep);
		fankui.setAns("暂未回复");
		Fankui f=fankuiService.add(fankui);
		if(f == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}
	
	public String update(){
		fankui = fankuiService.update(fankui);
		if(fankui == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		fankuiService.delete(fankui);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String query(){
		fankui=fankuiService.query(fankui);
		return "xq";
	}
	
	public String queryAll(){
		pager = new Pager<>();
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		int p = Integer.valueOf(ServletActionContext.getRequest().getParameter("page"));
		pager.setPageSize(pageSize);
		pager.setPageNo(p);
		pager = fankuiService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String all() {
		return "all";
	}
	
}
