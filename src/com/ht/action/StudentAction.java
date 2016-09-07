package com.ht.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
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

        Calendar a=Calendar.getInstance();
        int year = a.get(Calendar.YEAR);//得到年
        
		String[] str=student.getIntenbir().split("-");
		int ye = Integer.valueOf(str[0]);
		student.setIntenage(year - ye);
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
		student.setHourid(student.getHourse().getHourid());
		student.setClassid(student.getClasses().getClassid());
		student = studentService.update(student);
		result = ControllerResult.getSuccessRequest("修改成功");
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

	public String queryStu() {
		student = studentService.query(student);
		return "stu";
	}

	public String queryAll() {
		pager = new Pager<>();
		pager.setPageNo(page);
		HttpServletRequest req= ServletActionContext.getRequest();
		String classid = req.getParameter("classid");
		String tiaoname = req.getParameter("tiaoname");
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		if((classid ==null ||classid.equals("")) && (tiaoname==null || tiaoname.equals("")) ){
			pager = studentService.queryAll(pager);
		}else if(classid!=null){
			pager = studentService.queryClasses(pager, Integer.valueOf(classid));
		}else{
			pager = studentService.queryName(pager, tiaoname);
		}
		rows = pager.getRows();
		total = pager.getTotal();
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
	
	
	public String daochu() throws Exception{
		// 声明一个工作薄
       HSSFWorkbook hwb = new HSSFWorkbook();
       //声明一个单子并命名
       HSSFSheet sheet = hwb.createSheet("学生表");
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
       cell.setCellValue("毕业学校");
       cell.setCellStyle(style);
       cell = row.createCell((int) 3);
       cell.setCellValue("性别");
       cell.setCellStyle(style);
       cell = row.createCell((int) 4);
       cell.setCellValue("年龄");
       cell.setCellStyle(style);
       cell = row.createCell((int) 5);
       cell.setCellValue("手机号码");
       cell.setCellStyle(style);
       cell = row.createCell((int) 6);
       cell.setCellValue("家长姓名");
       cell.setCellStyle(style);
       cell = row.createCell((int) 7);
       cell.setCellValue("家长电话号码");
       cell.setCellStyle(style);
       cell = row.createCell((int) 8);
       cell.setCellValue("家庭住址");
       cell.setCellStyle(style);
       cell = row.createCell((int) 9);
       cell.setCellValue("所在班级");
       cell.setCellStyle(style);
       cell = row.createCell((int) 10);
       cell.setCellValue("所在宿舍");
       cell.setCellStyle(style);
       cell = row.createCell((int) 11);
       cell.setCellValue("入学时间");
       cell.setCellStyle(style);
	   	pager = new Pager<>();
		pager.setPageNo(page);
		pager.setPageSize(100);
		pager = studentService.queryAll(pager);
        List<Student> list = pager.getRows();
        try{
	          //向单元格里填充数据
			for (short i = 0; i < list.size(); i++) {
				row = sheet.createRow(i + 1);
				row.createCell(0).setCellValue(list.get(i).getIntenid());
				row.createCell(1).setCellValue(list.get(i).getIntenname());
				row.createCell(2).setCellValue(list.get(i).getIntensch());
				row.createCell(3).setCellValue(list.get(i).getIntensex());
				row.createCell(4).setCellValue(list.get(i).getIntenage());
				row.createCell(5).setCellValue(list.get(i).getIntentel());
				row.createCell(6).setCellValue(list.get(i).getIntenfat());
				row.createCell(7).setCellValue(list.get(i).getIntenfatel());
				row.createCell(8).setCellValue(list.get(i).getIntenaddr());
				row.createCell(9).setCellValue(list.get(i).getClasses().getClassname());
				row.createCell(10).setCellValue(list.get(i).getHourse().getHourname());
				row.createCell(11).setCellValue(list.get(i).getIntendate());
			}
        }catch(NullPointerException e){
        	 e.printStackTrace();
        }
         
       try {  
    	   File file = new File("D:/导出文件");
    	   if(file.exists() == false){
    		   file.mkdir();
    	   }
           FileOutputStream out = new FileOutputStream("D:/导出文件/student.xls");
           hwb.write(out);
           out.flush();
           out.close();
       } catch (FileNotFoundException e) {
           e.printStackTrace();
       }
		return "all";
	}
}
