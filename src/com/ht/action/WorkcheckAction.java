package com.ht.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import com.ht.bean.Dep;
import com.ht.bean.User;
import com.ht.bean.Workcheck;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.WorkcheckService;
import com.opensymphony.xwork2.ActionSupport;

public class WorkcheckAction extends ActionSupport {
	private static final long serialVersionUID = 7488777587220658872L;
	
	private WorkcheckService workcheckService;
	private Pager<Workcheck> pager;
	private Workcheck workcheck;
	private List<Workcheck> rows;
	private long total;
	private int page;
	private String wdata;
	private ControllerResult result;

	public ControllerResult getResult() {
		return result;
	}
	
	public void setWorkcheckService(WorkcheckService workcheckService) {
		this.workcheckService = workcheckService;
	}

	public Workcheck getWorkcheck() {
		return workcheck;
	}

	public void setWorkcheck(Workcheck workcheck) {
		this.workcheck = workcheck;
	}
	
	public String getWdata() {
		return wdata;
	}

	public void setWdata(String wdata) {
		this.wdata = wdata;
	}

	public List<Workcheck> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setPage(int page) {
		this.page = page;
	}
	public String add(){
		Date date = new Date();
		SimpleDateFormat sd=new SimpleDateFormat("yyyyMMDDhhmmss");
		SimpleDateFormat td=new SimpleDateFormat("yyyyMMDD");
		long today=Long.valueOf(sd.format(date));
		long begintime=Long.valueOf(td.format(date)+"0"+80300);
		long endtime=Long.valueOf(td.format(date)+"1"+90000);
		if(today>=begintime && today<=endtime){
			System.out.println("if");
			HttpSession session = ServletActionContext.getRequest().getSession();
			User user=(User) session.getAttribute("user");
			Dep d=new Dep();
			d.setEid(user.getDep().getEid());
			System.out.println("workcheck："+workcheck);
			workcheck.setDep(d);
			workcheck.setWdate(date);
			workcheck.setEid(user.getDep().getEid());
			workcheckService.add(workcheck);
			result = ControllerResult.getFailResult("打卡成功");
		}else
			result = ControllerResult.getFailResult("已签到");
		
		return SUCCESS;
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = workcheckService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String all(){
		return "all";
	}
	
}
