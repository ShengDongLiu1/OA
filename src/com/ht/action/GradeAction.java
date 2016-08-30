package com.ht.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Classes;
import com.ht.bean.Grade;
import com.ht.bean.Student;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.GradeService;
import com.opensymphony.xwork2.ActionSupport;

public class GradeAction extends ActionSupport {

	private static final long serialVersionUID = 7376172995568166768L;

	private GradeService gradeService;
	private Pager<Grade> pager;
	private Grade grade;
	private List<Grade> rows;
	private long total;

	private int page;
	private String subject;
	private Student student;
	private ControllerResult result;

	private int[] stuid;
	private float[] score;
	private String[] sconame;
	private Classes classes;

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public void setPager(Pager<Grade> pager) {
		this.pager = pager;
	}

	public long getTotal() {
		return total;
	}

	public List<Grade> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int[] getStuid() {
		return stuid;
	}

	public void setStuid(int[] stuid) {
		this.stuid = stuid;
	}

	public float[] getScore() {
		return score;
	}

	public void setScore(float[] score) {
		this.score = score;
	}

	public String[] getSconame() {
		return sconame;
	}

	public void setSconame(String[] sconame) {
		this.sconame = sconame;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public ControllerResult getResult() {
		return result;
	}

	public String add() {
		grade = gradeService.add(grade);
		if (grade != null) {
			result = ControllerResult.getSuccessRequest("添加成功");
		} else {
			result = ControllerResult.getFailResult("添加失败");
		}
		return SUCCESS;
	}

	public String update() {
		gradeService.update(grade);
		if (grade == null) {
			result = ControllerResult.getSuccessRequest("修改失败");
		} else {
			result = ControllerResult.getFailResult("修改成功");
		}
		return SUCCESS;
	}

	public String delete() {
		gradeService.delete(grade);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}

	public String query() {
		gradeService.query(grade);
		return SUCCESS;
	}

	public String queryAll() {
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = gradeService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String batch() {
		List<Student> students = new ArrayList<Student>();
		student = new Student();
		student.setClassid(1);
		students = gradeService.batchQlery(student);
		ServletActionContext.getRequest().setAttribute("students", students);
		return "PL";
	}

	public String batchSave() {
		List<Grade> grades = new ArrayList<Grade>();
		if (subject.trim().isEmpty()) {
			result = ControllerResult.getFailResult("请输入科目");
		} else {
			for (int i = 0; i < stuid.length; i++) {
				grade = new Grade();
				Student student = new Student();
				student.setIntenid(stuid[i]);
				grade.setStudents(student);
				grade.setSconame(subject);
				grade.setScore(score[i]);
				grades.add(grade);
			}
			gradeService.batchSave(grades);
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}

	public String test() {
		return SUCCESS;
	}

	public String all() {
		return "all";
	}

}
