package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.bean.Duty;
import com.ht.bean.Hourse;
import com.ht.common.Combox;
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
	private List<Hourse> hourses;
	private List<Dep> deps;
	private List<Classes> classess;

	private long total;
	
	private int page;
	


	public List<Classes> getClassess() {
		return classess;
	}

	public void setClassess(List<Classes> classess) {
		this.classess = classess;
	}

	public List<Hourse> getHourses() {
		return hourses;
	}

	public void setHourses(List<Hourse> hourses) {
		this.hourses = hourses;
	}

	public List<Dep> getDeps() {
		return deps;
	}

	public void setDeps(List<Dep> deps) {
		this.deps = deps;
	}

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

	
	public String tjls() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		deps = dutyService.queryDepname();
		List<Combox> list  = new ArrayList<>();
		for (Dep dep : deps) {
			int eid = dep.getEid();
			String ename = dep.getEname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(eid));
			combox.setName(ename);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "all";
	}
	

	public String tjls3() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		List<Combox> list  = new ArrayList<>();
		Combox combox = new Combox();
		combox.setId("班级巡查");
		combox.setName("班级巡查");
		Combox combox2 = new Combox();
		combox2.setId("宿舍巡查");
		combox2.setName("宿舍巡查");
		list.add(combox);
		list.add(combox2);
		out.write(JSON.toJSONString(list));
		out.close();
		return "all";
	}
	
	public String tjls2() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		List<Combox> list  = new ArrayList<>();
		String lx = req.getParameter("lx");
		if(lx.equals("班级巡查")){
			classess = dutyService.queryClasses();
			for (Classes classes : classess) {
				int cid = classes.getClassid();
				String cname = classes.getClassname();
				Combox combox = new Combox();
				combox.setId(String.valueOf(cid));
				combox.setName(cname);
				list.add(combox);
			}
		}else{
			hourses = dutyService.queryHourse();
			for (Hourse hourse : hourses) {
				int hid = hourse.getHourid();
				String hname = hourse.getHourname();
				Combox combox = new Combox();
				combox.setId(String.valueOf(hid));
				combox.setName(hname);
				list.add(combox);
			}
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "all";
	}
	public String add(){
		Dep dep = new Dep();
		dep.setEid(duty.getEid());
		duty.setDep(dep);
		duty = dutyService.add(duty);
		result = ControllerResult.getSuccessRequest("添加成功");
		return SUCCESS;
	}
	
	public String query(){
		dutyService.query(duty);
		return SUCCESS;
	}
	
	public String update(){
		Dep dep = new Dep();
		dep.setEid(duty.getEid());
		duty.setDep(dep);
		duty = dutyService.update(duty);
		result = ControllerResult.getSuccessRequest("修改成功");
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
