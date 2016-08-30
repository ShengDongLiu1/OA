package com.ht.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Studentyx;
import com.ht.common.Pager;
import com.ht.service.StudentService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author LiuShengDong
 * 学生管理
 */
public class StudentyxAction extends ActionSupport {

	private static final long serialVersionUID = 8133384344576729659L;

	private StudentService studentService;
	private Studentyx studentyx;
	private List<Studentyx> rows;
	private long total;
	private int page;


	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public Studentyx getStudentyx() {
		return studentyx;
	}

	public void setStudentyx(Studentyx studentyx) {
		this.studentyx = studentyx;
	}
	
	public long getTotal() {
		return total;
	}
	
	public List<Studentyx> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}


	public String queryAllyx(){
		Pager<Studentyx> pageryx = new Pager<>();
		pageryx.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pageryx.setPageSize(pageSize);
		pageryx = studentService.queryAllyx(pageryx);
		rows = pageryx.getRows();
		total = pageryx.getTotal();
		return SUCCESS;
	}
	
	public String allyx() {
		return "allyx";
	}

}
