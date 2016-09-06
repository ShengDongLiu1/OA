package com.ht.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Hourse;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.HourseService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author djs
 * 宿舍
 */
public class HourseAction extends ActionSupport {
	private static final long serialVersionUID = 6188507486009467648L;
	private HourseService hourseService;
	private Pager<Hourse> pager;
	private Hourse hourse;
	private List<Hourse> rows;
	private long total;
	private int page;
	private ControllerResult result;

	public void setHourseService(HourseService hourseService) {
		this.hourseService = hourseService;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public Hourse getHourse() {
		return hourse;
	}

	public void setHourse(Hourse hourse) {
		this.hourse = hourse;
	}
	
	public List<Hourse> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add(){
		System.out.println("hourse:"+hourse);
		hourse.setHourhkz(hourse.getHourkz()-hourse.getHouryz());
		hourse = hourseService.add(hourse);
		if(hourse == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}
	
	public String query(){
		hourseService.query(hourse);
		return SUCCESS;
	}
	
	public String update(){
		hourse.setHourhkz(hourse.getHourkz()-hourse.getHouryz());
		hourse = hourseService.update(hourse);
		if(hourse == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		hourseService.delete(hourse);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = hourseService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String all() {
		return "all";
	}
}
