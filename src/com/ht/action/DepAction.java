package com.ht.action;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Dep;
import com.ht.bean.Department;
import com.ht.bean.Dstatus;
import com.ht.bean.Jobs;
import com.ht.bean.Status;
import com.ht.bean.User;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.DepService;
import com.ht.service.DepartmentService;
import com.ht.service.JobsService;
import com.opensymphony.xwork2.ActionSupport;

public class DepAction extends ActionSupport{

	private static final long serialVersionUID = 7929754318757391487L;
	private ControllerResult result;
	private DepService depService;
	private JobsService jobsService;
	private DepartmentService departmentService;
	private Pager<Dep> pager;
	private Dep dep;
	private Jobs jobs;
	private List<Dep> rows;
	private long total;
	private int page;
	private List<Department> department;
	private List<Dstatus> dstatus;
	
	public List<Dstatus> getDstatus() {
		return dstatus;
	}

	public void setDstatus(List<Dstatus> dstatus) {
		this.dstatus = dstatus;
	}

	public void setJobsService(JobsService jobsService) {
		this.jobsService = jobsService;
	}

	public void setDepService(DepService depService) {
		this.depService = depService;
	}
	
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	public Jobs getJobs() {
		return jobs;
	}

	public void setJobs(Jobs jobs) {
		this.jobs = jobs;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Dep> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public ControllerResult getResult() {
		return result;
	}
	
	
	public void setPager(Pager<Dep> pager) {
		this.pager = pager;
	}
	
	public String tjls() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		department = departmentService.queryDepar();
		List<Combox> list  = new ArrayList<>();
		for (Department department : department) {
			int did = department.getDid();
			String dname = department.getDname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(did));
			combox.setName(dname);
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
		dstatus = depService.queryDstatus();
		List<Combox> list  = new ArrayList<>();
		for (Dstatus dstatus : dstatus) {
			int dsid = dstatus.getDsid();
			String dsname = dstatus.getDsname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(dsid));
			combox.setName(dsname);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "tjls";
	}
	public String add() {
		Dstatus ds = new Dstatus();
		Department depar = new Department();
		if(dep.getMid() == null){
			depar.setDid(1);
		}else{
			depar.setDid(dep.getMid());
		}
		dep.setDepartments(depar);
		if(dep.getDstatuss() == null){
			ds.setDsid(1);
		}else{
			ds = dep.getDstatuss();
		}
		dep.setDstatuss(ds);
		dep = depService.add(dep);
		if(jobs == null){
			jobs = new Jobs();;
		}
		jobs.setJid(dep.getEid());
		jobs.setDep(dep);
		jobsService.add(jobs);
		
		if(dep==null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
			Status s = new Status();
			s.setZid(dep.getDstatuss().getDsid());
			User user = new User();
			user.setStatuss(s);
			user.setDep(dep);
			user.setUname(dep.getEnumber());
			user.setPwd("JdVa0oOqQAr0ZMdtcTwHrQ==");
			depService.addUser(user);
		}
		return SUCCESS;
	}
	
	public String addn() {
		Department depar = new Department();
		depar.setDid(dep.getMid());
		dep.setDepartments(depar);
		Dstatus ds = new Dstatus();
		ds.setDsid(dep.getDstatuss().getDsid());
		dep.setDstatuss(ds);
		dep = depService.addn(dep);
		if(dep == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		
		return SUCCESS;
	}
	
	public String update(){
		Department depar = new Department();
		depar.setDid(dep.getMid());
		dep.setDepartments(depar);
		dep = depService.update(dep);
		if(dep == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		depService.delete(dep);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String query(){
		depService.query(dep);
		return SUCCESS;
	}
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = depService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	
	public String byname(){
		HttpServletRequest req = ServletActionContext.getRequest();
		String ename = req.getParameter("ename1");
		HttpSession session = req.getSession();
		session.setAttribute("ename", ename);
		return "byname";
	}
	
	public String all() {
		return "all";
	}

	public String queryAlln(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = depService.queryAlln(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String daochu() throws Exception{
		// 声明一个工作薄
       HSSFWorkbook hwb = new HSSFWorkbook();
       //声明一个单子并命名
       HSSFSheet sheet = hwb.createSheet("员工表");
       //给单子名称一个长度
       sheet.setDefaultColumnWidth((int)15);
       // 生成一个样式  
       HSSFCellStyle style = hwb.createCellStyle();
       //创建第一行（也可以称为表头）
       HSSFRow row = sheet.createRow(0);
       //样式字体居中
       style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
       //给表头第一行一次创建单元格
       HSSFCell cell = row.createCell((int) 0);
       cell.setCellValue("编号");
       cell.setCellStyle(style); 
       cell = row.createCell((int) 1);
       cell.setCellValue("姓名");
       cell.setCellStyle(style);
       cell = row.createCell((int) 2);
       cell.setCellValue("性别");
       cell.setCellStyle(style);
       cell = row.createCell((int) 3);
       cell.setCellValue("部门");
       cell.setCellStyle(style);
       cell = row.createCell((int) 4);
       cell.setCellValue("生日");
       cell.setCellStyle(style);
       cell = row.createCell((int) 5);
       cell.setCellValue("手机号码");
       cell.setCellStyle(style);
       cell = row.createCell((int) 6);
       cell.setCellValue("身份证号码");
       cell.setCellStyle(style);
       cell = row.createCell((int) 7);
       cell.setCellValue("民族");
       cell.setCellStyle(style);
       cell = row.createCell((int) 8);
       cell.setCellValue("学历");
       cell.setCellStyle(style);
       cell = row.createCell((int) 9);
       cell.setCellValue("家庭住址");
       cell.setCellStyle(style);
       cell = row.createCell((int) 10);
       cell.setCellValue("入职时间");
       cell.setCellStyle(style);
       cell = row.createCell((int) 11);
       cell.setCellValue("职位");
       cell.setCellStyle(style);
	   	pager = new Pager<>();
		pager.setPageNo(page);
		pager.setPageSize(100);
		pager = depService.queryAll(pager);
        List<Dep> list = pager.getRows();
        try{
	          //向单元格里填充数据
			for (short i = 0; i < list.size(); i++) {
				row = sheet.createRow(i + 1);
				row.createCell(0).setCellValue(list.get(i).getEid());
				row.createCell(1).setCellValue(list.get(i).getEname());
				row.createCell(2).setCellValue(list.get(i).getEsex());
				row.createCell(3).setCellValue(list.get(i).getDepartments().getDname());
				row.createCell(4).setCellValue(list.get(i).getEbirth());
				row.createCell(5).setCellValue(list.get(i).getEnumber());
				row.createCell(6).setCellValue(list.get(i).getEcertid());
				row.createCell(7).setCellValue(list.get(i).getEcity());
				row.createCell(8).setCellValue(list.get(i).getEanton());
				row.createCell(9).setCellValue(list.get(i).getEdu());
				row.createCell(10).setCellValue(list.get(i).getEaddr());
				row.createCell(11).setCellValue(list.get(i).getDstatuss().getDsname());
			}
        }catch(NullPointerException e){
        	e.printStackTrace();
        }
         
       try {  
    	   /*导出的数据放在d盘的 导出文件 的文件夹里*/
           FileOutputStream out = new FileOutputStream("D:/导出文件/dep.xls");
           hwb.write(out);
           out.flush();
           out.close();
       } catch (FileNotFoundException e) {
           e.printStackTrace();
       }
		return "all";
	}
	
	public String byid(){
		return "byid";
	}

	public String alln() {
		return "alln";
	}
}
