package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Dep;
import com.ht.bean.Department;
import com.ht.bean.Dstatus;
import com.ht.bean.Jobs;
import com.ht.bean.Status;
import com.ht.bean.User;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.DepService;
import com.ht.service.DepartmentService;
import com.ht.service.JobsService;
import com.opensymphony.xwork2.ActionSupport;

public class DepAction extends ActionSupport{

	private static final long serialVersionUID = 7929754318757391487L;
	private ControllerResult result;
	private DepService depService;
	private JobsService jobsService;
	private DepartmentService departmentService;
	private Pager<Dep> pager;
	private Dep dep;
	private Jobs jobs;
	private List<Dep> rows;
	private long total;
	private int page;
	private List<Department> department;
	private List<Dstatus> dstatus;
	
	public List<Dstatus> getDstatus() {
		return dstatus;
	}

	public void setDstatus(List<Dstatus> dstatus) {
		this.dstatus = dstatus;
	}

	public void setJobsService(JobsService jobsService) {
		this.jobsService = jobsService;
	}

	public void setDepService(DepService depService) {
		this.depService = depService;
	}
	
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	public Jobs getJobs() {
		return jobs;
	}

	public void setJobs(Jobs jobs) {
		this.jobs = jobs;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Dep> getRows() {
		return rows;
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
		department = departmentService.queryDepar();
		List<Combox> list  = new ArrayList<>();
		for (Department department : department) {
			int did = department.getDid();
			String dname = department.getDname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(did));
			combox.setName(dname);
			list.add(combox);
		}
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
		dstatus = depService.queryDstatus();
		List<Combox> list  = new ArrayList<>();
		for (Dstatus dstatus : dstatus) {
			int dsid = dstatus.getDsid();
			String dsname = dstatus.getDsname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(dsid));
			combox.setName(dsname);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "tjls";
	}
	public String add() {
		Dstatus ds = new Dstatus();
		Department depar = new Department();
		if(dep.getMid() == null){
			depar.setDid(1);
		}else{
			depar.setDid(dep.getMid());
		}
		dep.setDepartments(depar);
		if(dep.getDstatuss() == null){
			ds.setDsid(1);
		}else{
			ds = dep.getDstatuss();
		}
		dep.setDstatuss(ds);
		dep = depService.add(dep);
		if(jobs == null){
			jobs = new Jobs();;
		}
		jobs.setJid(dep.getEid());
		jobs.setDep(dep);
		jobsService.add(jobs);
		
		if(dep==null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
			Status s = new Status();
			s.setZid(dep.getDstatuss().getDsid());
			User user = new User();
			user.setStatuss(s);
			user.setDep(dep);
			user.setUname(dep.getEnumber());
			user.setPwd("JdVa0oOqQAr0ZMdtcTwHrQ==");
			depService.addUser(user);
		}
		return SUCCESS;
	}
	public String addn() {
		Department depar = new Department();
		depar.setDid(dep.getMid());
		dep.setDepartments(depar);
		Dstatus ds = new Dstatus();
		ds.setDsid(dep.getDstatuss().getDsid());
		dep.setDstatuss(ds);
		dep = depService.addn(dep);
		if(dep == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		
		return SUCCESS;
	}
	
	public String update(){
		Department depar = new Department();
		depar.setDid(dep.getMid());
		dep.setDepartments(depar);
		dep = depService.update(dep);
		if(dep == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		depService.delete(dep);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String query(){
		depService.query(dep);
		return SUCCESS;
	}
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = depService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String queryByName(){
		int count = 0;
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		String ename = session.getAttribute("ename").toString();
		pager = depService.queryByName(pager, ename);
		for(Dep d : pager.getRows()){
			count ++;
			Department depar = d.getDepartments();
			if(depar != null){
				d.setMid(depar.getDid());
				System.out.println(depar+"------"+d.getMid());
			}
		}
		rows = pager.getRows();
		total = count;
		return SUCCESS;
	}
	
	public String byname(){
		HttpServletRequest req = ServletActionContext.getRequest();
		String ename = req.getParameter("ename1");
		HttpSession session = req.getSession();
		session.setAttribute("ename", ename);
		return "byname";
	}
	
	public String all() {
		return "all";
	}

	public String queryAlln(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = depService.queryAlln(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String byid(){
		return "byid";
	}

	public String alln() {
		return "alln";
	}
}
