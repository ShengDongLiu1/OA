package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Computer;
import com.ht.bean.Student;
import com.ht.bean.Work;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.ComputerService;
import com.ht.service.WorkService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author OYH
 * 电脑领用管理
 */
public class ComputerAction extends ActionSupport {

	private static final long serialVersionUID = -8824667329746496102L;
	
	private ComputerService computerService;
	private ControllerResult result;
	private Pager<Computer> pager;
	private Computer computer;
	private List<Computer> rows;
	private long total;
	private List<Student> student;
	private int page;
	private WorkService workService;

	public WorkService getWorkService() {
		return workService;
	}

	public void setWorkService(WorkService workService) {
		this.workService = workService;
	}

	public void setComputerService(ComputerService computerService) {
		this.computerService = computerService;
	}
	
	public Computer getComputer() {
		return computer;
	}

	public void setComputer(Computer computer) {
		this.computer = computer;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Computer> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public ControllerResult getResult() {
		return result;
	}
	
	public ComputerService getComputerService() {
		return computerService;
	}

	public String add() {
		Work work = new Work();
		work.setWname("电脑");
		work = workService.query(work);
		if(work != null){
			computer.setComcount(1);
			computerService.add(computer);
			int count = work.getWcount()-1;
			int mount = work.getWamount()-1;
			work.setWcount(count);
			work.setWamount(mount);
			workService.update(work);
			result = ControllerResult.getSuccessRequest("添加成功");
		}else{
			result = ControllerResult.getFailResult("没有电脑可领用，添加失败");
		}
		return SUCCESS;
	}
	
	public String update(){
		computer.setComcount(1);
		Computer c = computerService.update(computer);
		if(c == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		computerService.delete(computer);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String query(){
		computerService.query(computer);
		return SUCCESS;
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = computerService.queryAll(pager);
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
		student = computerService.queryStudent(); //��ѯ��������
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
