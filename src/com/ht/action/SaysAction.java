package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Dep;
import com.ht.bean.Says;
import com.ht.bean.Student;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.SaysService;
import com.ht.service.StutotalService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author djs
 * 谈心记录
 */
public class SaysAction extends ActionSupport {
	private static final long serialVersionUID = 6188507486009467648L;
	private SaysService saysService;
	private StutotalService stutotalService;
	private Pager<Says> pager;
	private Says says;
	private List<Says> rows;
	private long total;
	private int page;
	private ControllerResult result;
	private List<Student> students;
	private List<Dep> deps;
	

	public List<Dep> getDeps() {
		return deps;
	}

	public void setDeps(List<Dep> deps) {
		this.deps = deps;
	}

	public void setStutotalService(StutotalService stutotalService) {
		this.stutotalService = stutotalService;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public void setSaysService(SaysService saysService) {
		this.saysService = saysService;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public Says getSays() {
		return says;
	}

	public void setSays(Says sayss) {
		this.says = sayss;
	}
	
	public List<Says> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String tjls() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		students = stutotalService.queryStudents();
		List<Combox> list  = new ArrayList<>();
		for (Student stu : students) {
			int sid = stu.getIntenid();
			String sname = stu.getIntenname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(sid));
			combox.setName(sname);
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
		deps = saysService.querydepname();
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
	
	public String add(){
		Dep dep = new Dep();
		dep.setEid(says.getSayempid());
		Student student = new Student();
		student.setIntenid(says.getSayface());
		says.setDeps(dep);
		says.setStudents(student);
		says = saysService.add(says);
		if(says == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}
	
	public String query(){
		saysService.query(says);
		return SUCCESS;
	}
	
	public String update(){
		Dep dep = new Dep();
		dep.setEid(says.getSayempid());
		Student student = new Student();
		student.setIntenid(says.getSayface());
		says.setDeps(dep);
		says.setStudents(student);
		says = saysService.update(says);
		if(says == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		saysService.delete(says);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = saysService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		System.out.println(pager.getRows().get(0).getSayspro()+"------");
		return SUCCESS;
	}
	
	public String all() {
		return "all";
	}
}
