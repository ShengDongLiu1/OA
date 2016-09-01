package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Classes;
import com.ht.bean.Hourse;
import com.ht.bean.Status;
import com.ht.bean.Student;
import com.ht.bean.Studentyx;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.ClassesService;
import com.ht.service.HourseService;
import com.ht.service.StudentService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author LiuShengDong
 * 学生管理
 */
public class StudentAction extends ActionSupport {

	private static final long serialVersionUID = 8133384344576729659L;

	private StudentService studentService;
	private Pager<Student> pager;
	private Student student;
	private Studentyx studentyx;
	private List<Student> rows;
	private long total;
	private int page;
	private ControllerResult result;
	private ClassesService classesService;
	private HourseService hourseService;
	private List<Classes> classes;
	private List<Hourse> hourse;

	public void setClassesService(ClassesService classesService) {
		this.classesService = classesService;
	}

	public void setHourseService(HourseService hourseService) {
		this.hourseService = hourseService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public ControllerResult getResult() {
		return result;
	}
	
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
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
	
	public List<Student> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		student.setIntendate(Calendar.getInstance().getTime());
		student = studentService.add(student);
		if(student == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}

	/**
	 * @return
	 * @throws ParseException 
	 */
	public String yxadd() throws ParseException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String year = request.getParameter("year");
		int month= Integer.valueOf(request.getParameter("month"));
		int day = Integer.valueOf(request.getParameter("day"));
		String mstr = "";
		String dstr = "";
		if(month <= 9){
			mstr += 0;
		}
		if(day <= 9){
			dstr += 0;
		}
		studentyx.setIntenbir(year+"-"+mstr+month+"-"+dstr+day);
		Status status = new Status();
		status.setZid(8);
		studentyx.setStatus(status);
		studentyx = studentService.addyx(studentyx);
		return "yx";
	}
	
	public String update(){
		student = studentService.update(student);
		if(student == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		studentService.delete(student);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String query(){
		student = studentService.query(student);
		return "xs";
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = studentService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String queryAllstu(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = studentService.queryAllstu(pager,student.getClasses().getClassid());
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String all() {
		return "all";
	}

	public String classes() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		classes = classesService.queryClasses();
		List<Combox> list  = new ArrayList<>();
		for (Classes cl : classes) {
			int did = cl.getClassid();
			String dname = cl.getClassname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(did));
			combox.setName(dname);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "all";
	}


	public String hourse() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		hourse = hourseService.queryHourse();
		List<Combox> list  = new ArrayList<>();
		for (Hourse ho : hourse) {
			int did = ho.getHourid();
			String dname = ho.getHourname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(did));
			combox.setName(dname);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "all";
	}
	
	public String deleteyx(){
		studentService.deleteyx(studentyx);
		HttpSession session = ServletActionContext.getRequest().getSession();
		int id = Integer.valueOf(session.getAttribute("cid").toString());
		Student s = new Student();
		s.setIntenname(studentyx.getIntenname());
		s.setIntensch(studentyx.getIntensch());
		s.setIntensex(studentyx.getIntensex());
		s.setIntenage(studentyx.getIntenage());
		s.setIntenbir(studentyx.getIntenbir());
		s.setIntenfat(studentyx.getIntenfat());
		s.setIntentel(studentyx.getIntentel());
		s.setIntenfatel(studentyx.getIntenfatel());
		s.setIntenaddr(studentyx.getIntenaddr());
		s.setIntenpeo(studentyx.getIntenpeo());
		s.setIntenmz(studentyx.getIntenmz());
		s.setIntenjg(studentyx.getIntenjg());
		Status status = new Status();
		status.setZid(9);
		Classes c = new Classes();
		c.setClassid(id);
		s.setStustatus(9);
		
		studentService.add(s);
		result = ControllerResult.getSuccessRequest("添加成功");
		return SUCCESS;
	}
}
