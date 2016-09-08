package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Apply;
import com.ht.bean.Dep;
import com.ht.bean.Expend;
import com.ht.bean.Work;
import com.ht.bean.Worktype;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.ApplyService;
import com.ht.service.PaysService;
import com.ht.service.WorkService;
import com.opensymphony.xwork2.ActionSupport;

public class ApplyAction extends ActionSupport {

	private static final long serialVersionUID = 5063645776157356624L;

	private ApplyService applyService;
	private PaysService paysService;
	private WorkService workService;
	private ControllerResult result;
	private Pager<Apply> pager;
	private Apply apply;
	private List<Apply> rows;
	private long total;
	private Dep dep;
	private List<Dep> deps;
	private List<Worktype> worktype;

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	private int page;

	private Work work;

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public List<Apply> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setApplyService(ApplyService applyService) {
		this.applyService = applyService;
	}

	public void setPaysService(PaysService paysService) {
		this.paysService = paysService;
	}

	public ControllerResult getResult() {
		return result;
	}

	public void setWorkService(WorkService workService) {
		this.workService = workService;
	}

	public void setPager(Pager<Apply> pager) {
		this.pager = pager;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		apply.setAdatetime(new Timestamp(new Date().getTime()));
		apply.setGtotle(apply.getGprice() * apply.getGcounts());
		apply.setAstatus("未审批");
		apply = applyService.add(apply);
		if (apply == null) {
			result = ControllerResult.getFailResult("添加失败");
		} else {
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}

	public String query() {
		applyService.query(apply);
		return "page";
	}

	public String update() {
		apply.setGtotle(apply.getGprice() * apply.getGcounts());
		apply = applyService.update(apply);
		if (apply == null) {
			result = ControllerResult.getFailResult("修改失败");
		} else {
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}

	public String delete() {
		if(apply.getAstatus().equals("已审批")){
			result = ControllerResult.getSuccessRequest("已经审批了该物品，无法删除！");
		}else if(apply.getAstatus().equals("已购买")){
			result = ControllerResult.getSuccessRequest("已经购买该物品，无法删除！");
		}else{
			applyService.delete(apply);
			result = ControllerResult.getSuccessRequest("删除成功");
		}
		return SUCCESS;
	}

	public String queryAll() throws ParseException {
		HttpServletRequest req = ServletActionContext.getRequest();
		String name = req.getParameter("name");
		String lname = req.getParameter("lname");
		String time = req.getParameter("time");
		String status = req.getParameter("status");
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		if (name == null || name.equals("")) {
			if (lname == null || lname.equals("")) {
				if(time == null){
					if (status == null || status.equals("")) {
						pager = applyService.queryAll(pager);
					} else {
						pager = applyService.queryByAstatus(pager, status);
					}
				}else{
					pager = applyService.queryByTime(pager, time);
				}
			} else {
				pager = applyService.queryByWorktypeName(pager, lname);
			}
		} else {
			pager = applyService.queryByDepName(pager, name);
		}
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String xzyg() throws IOException {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out = resp.getWriter();
		deps = applyService.queryDep();
		List<Combox> list = new ArrayList<>();
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
		return "xzyg";
	}

	public String xzlx() throws IOException {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out = resp.getWriter();
		worktype = applyService.queryWorktype();
		List<Combox> list = new ArrayList<>();
		for (Worktype worktypes : worktype) {
			int eid = worktypes.getSwid();
			String ename = worktypes.getSwname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(eid));
			combox.setName(ename);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "xzlx";
	}

	public String all() {
		return "all";
	}

	public String updateSP() {
		if (apply.getAstatus().equals("已审批")) {
			result = ControllerResult.getSuccessRequest("已通过审批，不需要再次审批！");
			return SUCCESS;
		}

		apply = applyService.updateSP(apply);
		result = ControllerResult.getSuccessRequest("通过审批");
		
		work = new Work();
		work.setWname(apply.getGname());
		work=workService.query(work);
		if(work!=null){
			int count = work.getWcount()+apply.getGcounts();
			int mount = work.getWamount()+apply.getGcounts();
			work.setWcount(count);
			work.setWamount(mount);
			workService.update(work);
		}else{
			work.setWorktype(apply.getWorktype());
			work.setWname(apply.getGname());
			work.setWcount(apply.getGcounts());
			work.setWamount(apply.getGcounts());
			workService.add(work);
		}

		
		
		Expend e = new Expend();
		e.setPaypro("购买物品");
		e.setPaycount(apply.getGcounts() * apply.getGprice());
		paysService.addexpend(e);
		
		return SUCCESS;
	}
}
