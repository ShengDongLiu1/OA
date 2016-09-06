package com.ht.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Dep;
import com.ht.bean.Income;
import com.ht.bean.Student;
import com.ht.bean.User;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.DepService;
import com.ht.service.DepServiceImpl;
import com.ht.service.IncomeService;
import com.opensymphony.xwork2.ActionSupport;

public class IncomeAction extends ActionSupport {

	private static final long serialVersionUID = 8409835796742185658L;

	private IncomeService incomeService;
	private Pager<Income> pager;
	private Income income;
	private List<Income> rows;
	private Student student;
	private long total;
	private String mname;
	private ControllerResult result;
	private int page;
	private int[] stuid;
	private double[] money;

	public double[] getMoney() {
		return money;
	}

	public void setMoney(double[] money) {
		this.money = money;
	}

	public int[] getStuid() {
		return stuid;
	}

	public void setStuid(int[] stuid) {
		this.stuid = stuid;
	}

	public ControllerResult getResult() {
		return result;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public void setIncomeService(IncomeService incomeService) {
		this.incomeService = incomeService;
	}

	public Income getIncome() {
		return income;
	}

	public void setIncome(Income income) {
		this.income = income;
	}

	public void setPager(Pager<Income> pager) {
		this.pager = pager;
	}

	public long getTotal() {
		return total;
	}

	public List<Income> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		Dep dep = new Dep();
		dep.setEid(user.getEid());
		DepService ser = new DepServiceImpl();
		dep = ser.query(dep);
		income.setMonpro(dep.getEname());
		incomeService.add(income);
		return SUCCESS;
	}

	public String update() {
		incomeService.update(income);
		return SUCCESS;
	}

	public String delete() {
		incomeService.delete(income);
		return SUCCESS;
	}

	public String query() {
		incomeService.query(income);
		return SUCCESS;
	}

	public String queryAll() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String  begin=request.getParameter("begin");
		String end=request.getParameter("end");
		String name=request.getParameter("name");
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		if(begin!=null || end!=null){
			pager = incomeService.queryByTime(pager, begin, end);
		}else if(name!=null){
			pager = incomeService.queryByName(pager, name);
		}else{
			pager = incomeService.queryAll(pager);
		}
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}

	public String all() {
		return "all";
	}

	public String batch() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("classid");
		List<Student> students = new ArrayList<Student>();
		students = incomeService.batchQlery(student, id);
		ServletActionContext.getRequest().setAttribute("students", students);
		return "PL";
	}

	public String batchSave() {
		List<Income> incomes = new ArrayList<>();
		if (mname.trim().isEmpty()) {
			result = ControllerResult.getFailResult("请输入应收人!");
		} else {
			for (int i = 0; i < stuid.length; i++) {
				income = new Income();
				Student student = new Student();
				student.setIntenid(stuid[i]);
				income.setMname(mname);
				income.setMoncount(money[i]);
				income.setMonpro("收取学费");
				income.setMdate(Calendar.getInstance().getTime());
				incomes.add(income);
			}
			incomeService.batchSave(incomes);
			result = ControllerResult.getSuccessRequest("成功");

		}
		return SUCCESS;
	}

	public String money() {
		return "money";
	}
}
