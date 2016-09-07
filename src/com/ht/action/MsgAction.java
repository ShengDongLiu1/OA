package com.ht.action;

import java.util.Calendar;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Msg;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.MsgService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author CFL
 * 公告管理
 */
public class MsgAction extends ActionSupport{

	private static final long serialVersionUID = -8079562937005754654L;
	
	private MsgService msgService;
	private Msg msg;
	private ControllerResult result;
	private List<Msg> rows;
	private Pager<Msg> pager;
	private long total;
	private int page;

	public ControllerResult getResult() {
		return result;
	}
	
	public Msg getMsg() {
		return msg;
	}

	public void setMsg(Msg msg) {
		this.msg = msg;
	}

	public void setMsgService(MsgService msgService) {
		this.msgService = msgService;
	}

	public long getTotal() {
		return total;
	}

	public List<Msg> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add(){
		msg.setMsgks(Calendar.getInstance().getTime());
		msg = msgService.add(msg);
		if(msg == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return "success";
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = msgService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String delete(){
		System.out.println(msg);
		msgService.delete(msg);
		result = ControllerResult.getSuccessRequest("删除成功！");
		return SUCCESS;
	}
	
	public String update(){
		msg = msgService.update(msg);
		if(msg == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String all(){
		return "all";
	}
}
