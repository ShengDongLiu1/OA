package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Course;
import com.ht.common.Combox;
import com.ht.common.Pager;
import com.ht.service.CourseService;
import com.opensymphony.xwork2.ActionSupport;

public class CourseAction extends ActionSupport {

	private static final long serialVersionUID = 3850018290101883580L;

	private CourseService courseService;
	private Pager<Course> pager;
	private Course course;
	private List<Course> rows;
	private long total;
	private int page;

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public long getTotal() {
		return total;
	}

	public List<Course> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		System.out.println("action add");
		course = courseService.add(course);
		return SUCCESS;
	}

	public String update() {
		System.out.println("update");
		System.out.println("course数据:" + course.toString());
		courseService.update(course);
		return SUCCESS;
	}

	public String delete() {
		System.out.println("action delete");
		courseService.delete(course);
		return SUCCESS;
	}

	public String query() {
		System.out.println("query");
		courseService.query(course);
		return SUCCESS;
	}

	public String queryAll() {
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = courseService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String all() {
		System.out.println("all");
		return "all";
	}

	/**
	 * Zhongyu
	 * 
	 * @throws IOException
	 */
	public String queryCourse() throws IOException {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out = resp.getWriter();
		List<Combox> list = new ArrayList<Combox>();
		rows = courseService.queryCourse();
		for(Course course : rows){
			int id = course.getObjectid();
			String name = course.getObjectname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(id));
			combox.setName(name);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "combox";
	}

}
