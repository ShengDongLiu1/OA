package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Getjob;
import com.ht.bean.Student;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.GetjobService;
import com.opensymphony.xwork2.ActionSupport;

public class GetjobAction extends ActionSupport {

	private static final long serialVersionUID = 4871622471724110057L;

	private GetjobService getjobService;
	private ControllerResult result;
	private Pager<Getjob> pager;
	private Getjob getjob;
	private List<Getjob> rows;
	private long total;
	private List<Student> student;
	private int page;

	public Getjob getGetjob() {
		return getjob;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public void setGetjob(Getjob getjob) {
		this.getjob = getjob;
	}

	public List<Getjob> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setGetjobService(GetjobService getjobService) {
		this.getjobService = getjobService;
	}

	public void setPager(Pager<Getjob> pager) {
		this.pager = pager;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		getjob=getjobService.add(getjob);
		if(getjob == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}

	public String update() {
		getjob=getjobService.update(getjob);
		if(getjob == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}

	public String delete() {
		getjobService.delete(getjob);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}

	public String query() {
		getjobService.query(getjob);
		return SUCCESS;
	}

	public String queryAll() {
		HttpServletRequest req = ServletActionContext.getRequest();
		String time = req.getParameter("time");
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		if(time == null){
			pager = getjobService.queryAll(pager);
		}else{
			pager = getjobService.queryByTime(pager, time);
		}
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String xzxs() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		student = getjobService.queryStudent(); 
		List<Combox> list = new ArrayList<>();
		for (Student student : student) {
			int intenid = student.getIntenid();
			String intenname = student.getIntenname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(intenid));
			combox.setName(intenname);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "xzxs";
	}

	public String all() {
		return "all";
	}
}
