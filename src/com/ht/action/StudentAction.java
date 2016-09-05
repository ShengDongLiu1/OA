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
import com.ht.bean.Student;
import com.ht.bean.Studentyx;
import com.ht.bean.User;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.ClassesService;
import com.ht.service.HourseService;
import com.ht.service.StudentService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author LiuShengDong 学生管理
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
	private List<Student> students;
	
	private int classid;

	public int getClassid() {
		return classid;
	}

	public void setClassid(int classid) {
		this.classid = classid;
	}
	
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

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}
	
	public String queryClassStudent() {
		List<Student> stus = new ArrayList<Student>();
		stus = studentService.queryAllS(classid);
		rows =stus;
		return SUCCESS;
	}
	
	public String add() {
		student.setIntendate(Calendar.getInstance().getTime());
		student.setIntenstatus("在读");	
		student = studentService.add(student);
		if (student == null) {
			result = ControllerResult.getFailResult("添加失败");
		} else {
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
		int month = Integer.valueOf(request.getParameter("month"));
		int day = Integer.valueOf(request.getParameter("day"));
		String mstr = "";
		String dstr = "";
		if (month <= 9) {
			mstr += 0;
		}
		if (day <= 9) {
			dstr += 0;
		}
		studentyx.setIntenbir(year + "-" + mstr + month + "-" + dstr + day);
		studentyx = studentService.addyx(studentyx);
		return "yx";
	}

	public String update() {
		student = studentService.update(student);
		if (student == null) {
			result = ControllerResult.getFailResult("修改失败");
		} else {
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}

	public String delete() {
		studentService.delete(student);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}

	public String query() {
		student = studentService.query(student);
		return "xs";
	}

	public String queryAll() {
		int count = 0;
		pager = new Pager<>();
		pager.setPageNo(page);
		HttpServletRequest req= ServletActionContext.getRequest();
		String classid = req.getParameter("classid");
		String tiaoname = req.getParameter("tiaoname");
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		if((classid ==null ||classid.equals("")) && (tiaoname==null || tiaoname.equals("")) ){
			pager = studentService.queryAll(pager);
			for(Student stu : pager.getRows()){
				count++;
			}
		}else if(classid!=null){
			pager = studentService.queryClasses(pager, Integer.valueOf(classid));
			for(Student stu : pager.getRows()){
				count++;
			}
		}else{
			pager = studentService.queryName(pager, tiaoname);
			for(Student stu : pager.getRows()){
				count++;
			}
		}
		rows = pager.getRows();
		total = count;
		return SUCCESS;
	}
	
	
	public String queryAllstu() {
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = studentService.queryAllstu(pager, student.getClasses().getClassid());
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String all() {
		return "all";
	}

	public String classes() throws IOException {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out = resp.getWriter();
		classes = classesService.queryClasses();
		List<Combox> list = new ArrayList<>();
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

	public String hourse() throws IOException {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out = resp.getWriter();
		hourse = hourseService.queryHourse();
		List<Combox> list = new ArrayList<>();
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

	public String deleteyx() {
		studentService.deleteyx(studentyx);
		student.setIntenname(studentyx.getIntenname());
		student.setIntensch(studentyx.getIntensch());
		student.setIntensex(studentyx.getIntensex());
		student.setIntenage(studentyx.getIntenage());
		student.setIntenbir(studentyx.getIntenbir());
		student.setIntenfat(studentyx.getIntenfat());
		student.setIntentel(studentyx.getIntentel());
		student.setIntenfatel(studentyx.getIntenfatel());
		student.setIntenaddr(studentyx.getIntenaddr());
		student.setIntenpeo(studentyx.getIntenpeo());
		student.setIntenmz(studentyx.getIntenmz());
		student.setIntenjg(studentyx.getIntenjg());
		student.setIntendate(Calendar.getInstance().getTime());
		student.setIntenstatus("在读");	
		student = studentService.add(student);
		if (student == null) {
			result = ControllerResult.getFailResult("修改失败");
		} else {
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}

	public String queryAllStu() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		List<Classes> cs = new ArrayList<>();
		cs = studentService.queryClass(user.getDep().getEid());
		List<Student> stus = new ArrayList<Student>();
		for (Classes c : cs) {
			students = studentService.queryAllS(c.getClassid());
			for (Student stu : students) {
				stus.add(stu);
			}
		}
		rows = stus;
		return SUCCESS;
	}
	

	public String addStu() {
		student = studentService.addStu(student);
		if(student == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		
		return SUCCESS;
	}
}
