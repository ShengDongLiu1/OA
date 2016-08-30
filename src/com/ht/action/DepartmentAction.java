package com.ht.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Dep;
import com.ht.bean.Department;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.DepartmentService;
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentAction extends ActionSupport {

	private static final long serialVersionUID = 7138916939990920958L;

	private DepartmentService departmentService;
	private Pager<Department> pager;
	private Department department;
	private List<Department> rows;
	private long total;
	private ControllerResult result;

	private int page;

	public void setdepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Department> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public String add() {
		Department d = departmentService.add(department);
		if(d == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}
	
	public String update(){
		System.out.println(department);
		Department d = departmentService.update(department);
		if(d == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		System.out.println(department.getDid()+"1111");
		List<Dep> dep = departmentService.depcount(department.getDid());
		System.out.println(dep+"11111111111");
		if(dep.size()<1){
			departmentService.delete(department);
			result = ControllerResult.getSuccessRequest("删除成功");
		}else {
			result = ControllerResult.getFailResult("还有员工，无法删除");
		}
		return SUCCESS;
	}
	
	public String query(){
		departmentService.query(department);
		return SUCCESS;
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = departmentService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String all() {
		return "all";
	}
}
