package com.ht.action;


import com.ht.bean.Jobs;
import com.ht.common.ControllerResult;
import com.ht.service.JobsService;
import com.opensymphony.xwork2.ActionSupport;

//员工资料操作

public class JobsAction extends ActionSupport {
	private static final long serialVersionUID = 6322253037800901401L;
	
	private ControllerResult result;
	private JobsService jobsService;
	private Jobs jobs;
	
	public void setJobsService(JobsService jobsService) {
		this.jobsService = jobsService;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public void setResult(ControllerResult result) {
		this.result = result;
	}

	public Jobs getJobs() {
		return jobs;
	}

	public void setJobs(Jobs jobs) {
		this.jobs = jobs;
	}

	public String add() {
		jobsService.add(jobs);
		return SUCCESS;
	}
	
	public String update(){
		if(jobs.getJpeople() == null || jobs.getJpeople().equals("")){
			jobs.setJpeople("暂无");
		}
		if(jobs.getJtel() == null || jobs.getJtel().equals("")){
			jobs.setJtel("暂无");
		}
		jobs = jobsService.update(jobs);
		if(jobs == null){
			result = ControllerResult.getFailResult("修改失败！");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功！");
		}
		return SUCCESS;
	}
	
	public String delete(){
		jobsService.delete(jobs);
		return SUCCESS;
	}
	
	public String query(){
		jobs = jobsService.query(jobs);
		return "query";
	}
	
	public String queryAll(){
		return null;
	}
	
	public String all() {
		return "all";
	}
	
}
