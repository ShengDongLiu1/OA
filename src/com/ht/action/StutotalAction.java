package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Student;
import com.ht.bean.Stutotal;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.StutotalService;
import com.opensymphony.xwork2.ActionSupport;

public class StutotalAction extends ActionSupport{

	private static final long serialVersionUID = 8572204435755440199L;
	

	private ControllerResult result;
	private StutotalService stutotalService;
	private Pager<Stutotal> pager;
	private Stutotal stutotal;
	private List<Stutotal> rows;
	private long total;
	private int page;
	private Integer sid;
	private List<Student> students;
	
	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public void setStutotalService(StutotalService stutotalService) {
		this.stutotalService = stutotalService;
	}
	
	public Stutotal getStutotal() {
		return stutotal;
	}

	public void setStutotal(Stutotal stutotal) {
		this.stutotal = stutotal;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Stutotal> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
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
	
	
	public String add() {
		Student student = new Student();
		student.setIntenid(stutotal.getStuid());
		stutotal.setSid(sid);
		stutotal.setStudent(student);
		Object obj  = stutotalService.queryXueqi(stutotal.getStuid(), stutotal.getSemester());
		if(obj == null){
			stutotalService.add(stutotal);
			result = ControllerResult.getSuccessRequest("添加成功");
		}else{
			result = ControllerResult.getFailResult("该学生已经有该学期的评语了");
		}
		return SUCCESS;
	}
	
	public String update(){
		Student stu = new Student();
		stu.setIntenid(stutotal.getStuid());
		stutotal.setStudent(stu);
		stutotal = stutotalService.update(stutotal);
		result = ControllerResult.getSuccessRequest("修改成功");
		return SUCCESS;
	}
	
	public String delete(){
		stutotalService.delete(stutotal);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String query(){
		stutotalService.query(stutotal);
		return SUCCESS;
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = stutotalService.queryAll(pager);
		for(Stutotal stuto : pager.getRows()){
			Student stu = stuto.getStudent();
			if(stu != null){
				stuto.setStuid(stu.getIntenid());
			}
		}
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String all() {
		return "all";
	}
	
	
}
