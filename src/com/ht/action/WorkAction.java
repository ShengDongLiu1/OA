package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Work;
import com.ht.bean.Worktype;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.WorkService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author OYH
 * 办公用品管理
 */
public class WorkAction extends ActionSupport {

	private static final long serialVersionUID = -6549990836056465497L;

	private WorkService workService;
	private Pager<Work> pager;
	private Work work;
	private List<Work> rows;
	private long total;
	private int page;
	private ControllerResult result;
	private List<Worktype> worktype;

	public Work getWork() {
		return work;
	}

	public void setWork(Work work) {
		this.work = work;
	}

	public List<Work> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setWorkService(WorkService workService) {
		this.workService = workService;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public void setPager(Pager<Work> pager) {
		this.pager = pager;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		work = workService.add(work);
		if(work == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}

	public String delete() {
		workService.delete(work);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}

	public String update() {
		work = workService.update(work);
		if(work == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}

	public String query() {
		workService.query(work);
		return SUCCESS;
	}

	public String queryAll() {
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = workService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String xzlx() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		worktype = workService.queryWorktype();
		List<Combox> list = new ArrayList<>();
		for (Worktype worktype : worktype) {
			System.out.println(worktype.getSwid());
			System.out.println(worktype.getSwname());
			int swid = worktype.getSwid();
			String swname = worktype.getSwname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(swid));
			combox.setName(swname);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "xzlx";
	}
	
	public String all() {
		return "all";
	}
}
