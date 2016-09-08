package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.alibaba.fastjson.JSON;
import com.ht.bean.Course;
import com.ht.bean.Courseplan;
import com.ht.bean.Dep;
import com.ht.bean.User;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.CourseplanService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author Su
 *
 */
public class CourseplanAction extends ActionSupport{
	
	private static final long serialVersionUID = -2632152753193688991L;
	
	private CourseplanService courseplanService;
	private ControllerResult result;
	private Pager<Courseplan> pager;
	private Courseplan cplan;
	private List<Courseplan> rows;
	private long total;
	private int page;
	private List<Course> course;
	private List<Dep> dep;
	HttpSession session = ServletActionContext.getRequest().getSession();
	User user=(User) session.getAttribute("user");
	
	public void setCourseplanService(CourseplanService courseplanService) {
		this.courseplanService = courseplanService;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public Courseplan getCplan() {
		return cplan;
	}

	public void setCplan(Courseplan cplan) {
		this.cplan = cplan;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Courseplan> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		Course t=new Course();
		t.setObjectid(cplan.getCourse().getObjectid());
		t=courseplanService.query(t);
		if(cplan.getCurrent_course()<=t.getPeriod()){
			Dep d=new Dep();
			d.setEid(user.getDep().getEid());
			cplan.setDep(d);
			courseplanService.add(cplan);
			result = ControllerResult.getSuccessRequest("添加成功！");
		}else{
			result=ControllerResult.getFailResult("当前课时不能大于总课时！");
		}
		return SUCCESS;
	}
	
	public String update(){
		Course t=new Course();
		t.setObjectid(cplan.getCourse().getObjectid());
		t=courseplanService.query(t);
		if(cplan.getCurrent_course()<=t.getPeriod()){
			Dep d=new Dep();
			d.setEid(user.getDep().getEid());
			cplan.setDep(d);
			cplan.setEmpid(user.getDep().getEid());
			courseplanService.update(cplan);
			result = ControllerResult.getSuccessRequest("修改成功");
		}else{
			result=ControllerResult.getFailResult("当前课时不能大于总课时！");
		}
		return SUCCESS;
	}
	
	public String delete(){
		courseplanService.delete(cplan);
		return SUCCESS;
	}
	
	public String query(){
		courseplanService.query(cplan);
		return SUCCESS;
	}
	
	
	public String object() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		course = courseplanService.queryCourse(); //查询所有类型
		List<Combox> list = new ArrayList<>();
		for (Course c : course) {
			Combox combox = new Combox();
			combox.setId(String.valueOf(c.getObjectid()));
			combox.setName(c.getObjectname());
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "object";
	}
	
	public String teacher()throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		dep = courseplanService.queryDep();
		List<Combox> listobj = new ArrayList<>();
		for (Dep c : dep) {
			Combox combox = new Combox();
			combox.setId(String.valueOf(c.getEid()));
			combox.setName(c.getEname());
			listobj.add(combox);
		}
		out.write(JSON.toJSONString(listobj));
		out.close();
		return "teacher";
	}
	
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = courseplanService.queryAll(pager,user.getDep().getEid());
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String all(){
		return "all";
	}
}
