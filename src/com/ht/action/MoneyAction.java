package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Income;
import com.ht.bean.Money;
import com.ht.bean.Tuition;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.DepService;
import com.ht.service.IncomeService;
import com.ht.service.MoneyService;
import com.ht.service.StudentService;
import com.opensymphony.xwork2.ActionSupport;

public class MoneyAction extends ActionSupport {

	private static final long serialVersionUID = -6812629349289155254L;
	
	private IncomeService incomeService;
	private MoneyService moneyService;
	private DepService depService;
	private StudentService studentService;
	private ControllerResult result;
	private Pager<Money> pager;
	private Money money;
	private List<Money> rows;
	private long total;
	private int page;

	public void setMoneyService(MoneyService moneyService) {
		this.moneyService = moneyService;
	}

	public void setDepService(DepService depService) {
		this.depService = depService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public void setIncomeService(IncomeService incomeService) {
		this.incomeService = incomeService;
	}

	public ControllerResult getResult() {
		return result;
	}

	public Money getMoney() {
		return money;
	}

	public void setMoney(Money money) {
		this.money = money;
	}
	
	public void setPager(Pager<Money> pager) {
		this.pager = pager;
	}

	public long getTotal() {
		return total;
	}

	public List<Money> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		money.setMtime(Calendar.getInstance().getTime());
		money.setDep(depService.query(money.getDep()));
		money.setStudent(studentService.query(money.getStudent()));
		money = moneyService.add(money);
		if (money == null) {
			result = ControllerResult.getFailResult("添加失败");
		} else {
			result = ControllerResult.getSuccessRequest("添加成功");
			Income income = new Income();
			income.setMname(money.getDep().getEname());
			income.setMoncount(money.getActual());
			income.setMonpro("收取"+money.getStudent().getIntenname()+"同学"+money.getSemester()+"的学费");
			income.setMdate(Calendar.getInstance().getTime());
			incomeService.add(income);
		}
		return SUCCESS;
	}

	public String update() {
		money = moneyService.update(money);
		if (money == null) {
			result = ControllerResult.getFailResult("修改失败");
		} else {
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	

	public String updateOwe() {
		money.setDep(depService.query(money.getDep()));
		money = moneyService.update(money);
		if (money == null) {
			result = ControllerResult.getFailResult("补交失败");
		} else {
			result = ControllerResult.getSuccessRequest("补交成功");
			Income income = new Income();
			income.setMname(money.getDep().getEname());
			income.setMoncount(money.getActual());
			income.setMonpro(money.getStudent().getIntenname()+"同学补交"+money.getSemester()+"的学费");
			income.setMdate(Calendar.getInstance().getTime());
			incomeService.add(income);
		}
		return SUCCESS;
	}

	public String delete() {
		moneyService.delete(money);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}

	public String query() {
		moneyService.query(money);
		return SUCCESS;
	}

	public String queryAll() {
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = moneyService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String queryOwe(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = moneyService.queryOwe(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String semester() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		List<Combox> list  = new ArrayList<>();
		Combox combox = new Combox();
		combox.setId("预科");
		combox.setName("预科");
		Combox combox1 = new Combox();
		combox1.setId("第一学期");
		combox1.setName("第一学期");
		Combox combox2 = new Combox();
		combox2.setId("第二学期");
		combox2.setName("第二学期");
		Combox combox3 = new Combox();
		combox3.setId("第三学期");
		combox3.setName("第三学期");
		Combox combox4 = new Combox();
		combox4.setId("第四学期");
		combox4.setName("第四学期");
		list.add(combox);
		list.add(combox1);
		list.add(combox2);
		list.add(combox3);
		list.add(combox4);
		out.write(JSON.toJSONString(list));
		out.close();
		return "all";
	}


	public String should() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		List<Combox> list  = new ArrayList<>();
		String xq = req.getParameter("xq");
		List<Tuition> tuition = moneyService.queryAllTuition();
		if(xq.equals("预科")){
			String tui = ""+tuition.get(0).getOne(); 
			Combox combox = new Combox();
			combox.setId(tui);
			combox.setName(tui);
			list.add(combox);
		}else if(xq.equals("第一学期")){
			String tui = ""+tuition.get(0).getTwo(); 
			Combox combox = new Combox();
			combox.setId(tui);
			combox.setName(tui);
			list.add(combox);
		}else if(xq.equals("第二学期")){
			String tui = ""+tuition.get(0).getThree(); 
			Combox combox = new Combox();
			combox.setId(tui);
			combox.setName(tui);
			list.add(combox);
		}else if(xq.equals("第三学期")){
			String tui = ""+tuition.get(0).getFour(); 
			Combox combox = new Combox();
			combox.setId(tui);
			combox.setName(tui);
			list.add(combox);
		}else if(xq.equals("第四学期")){
			String tui = ""+tuition.get(0).getFive(); 
			Combox combox = new Combox();
			combox.setId(tui);
			combox.setName(tui);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "all";
	}
	
	public String all() {
		return "all";
	}
	
	public String allowe() {
		return "allowe";
	}
	
	public String allxf() {
		return "allxf";
	}
}
