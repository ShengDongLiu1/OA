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
import com.ht.bean.Classes;
import com.ht.bean.Dep;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.ClassesService;
import com.opensymphony.xwork2.ActionSupport;

public class ClassesAction extends ActionSupport{

	private static final long serialVersionUID = 7929754318757391487L;
	private ControllerResult result;
	private ClassesService classesService;
	private Pager<Classes> pager;
	private Classes classes;
	private List<Classes> rows;
	private long total;
	private int page;
	private List<Dep> deps;
	private String lx;

	public List<Dep> getDeps() {
		return deps;
	}
	
	public void setClassesService(ClassesService classesService) {
		this.classesService = classesService;
	}
	
	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Classes> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}

	public String add() {
		if(classes.getClassaddr() == null|| classes.getClassaddr().equals("")){
			classes.setClassaddr("暂未分配");
		}
		classes.setClasscount(0);
		classes.setClasslx("空");
		classes = classesService.add(classes);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("cid", classes.getClassid());
		if(classes == null){
			result = ControllerResult.getFailResult("添加失败 ");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}
	
	public String update(){
		classes = classesService.update(classes);
		if(classes == null){
			result = ControllerResult.getFailResult("修改失败 ");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		classesService.delete(classes);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String query(){
		classes = classesService.query(classes);
		return "bjxq";
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = classesService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String tjrkls() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		deps = classesService.queryDeprk();
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
		return "tjls";
	}
	
	public String tjfdls() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		deps = classesService.queryDepfd();
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
		return "tjls";
	}
	
	public String tjls() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		deps = classesService.queryDep();
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
		return "tjls";
	}
	
	public String all() {
		return "all";
	}
	
	public String addfb() {
		return "addfb";
	}

	public String allyk() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("lx", lx);
		return "money";
	}

	public String queryAllyk() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		lx = session.getAttribute("lx").toString();
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = classesService.queryAllstu(pager,lx);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String queryyk(){
		classes = classesService.query(classes);
		return "fhyk";
	}
}
