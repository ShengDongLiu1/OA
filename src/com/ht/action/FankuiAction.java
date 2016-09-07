package com.ht.action;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Fankui;
import com.ht.bean.User;
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
	private int page;

	public ControllerResult getResult() {
		return result;
	}
	
	
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
		fankui = fankuiService.query(fankui);
		return "xq";
	}
	
	public String queryAll(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		pager = new Pager<>();
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager.setPageNo(page);
		User user = (User) session.getAttribute("user");
		
		if(user.getStatuss().getZid() == 11 || user.getStatuss().getZid() == 7){
			pager = fankuiService.queryAll(pager);
		}else{
			int id = user.getDep().getEid();
			pager = fankuiService.queryByDepId(pager,id);
		}
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String all() {
		return "all";
	}
	
}
