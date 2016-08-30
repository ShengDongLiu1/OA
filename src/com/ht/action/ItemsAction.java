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
import com.ht.bean.Dep;
import com.ht.bean.Items;
import com.ht.bean.Student;
import com.ht.bean.User;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.ItemsService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author WMF
 * 项目管理
 */
public class ItemsAction extends ActionSupport{
	
	private static final long serialVersionUID = -8744483513745931197L;
	private ItemsService itemsService;
	private Pager<Items> pager;
	private Items items;
	private List<Items> rows;
	private long total;
	private int page;
	private ControllerResult result;
	private List<Student> student;

	public void setitemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}
	
	public ControllerResult getResult() {
		return result;
	}
	
	
	public Items getItems() {
		return items;
	}

	public void setItems(Items items) {
		this.items = items;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Items> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String add() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user=(User) session.getAttribute("user");
		Dep d=new Dep();
		d.setEid(user.getDep().getEid());
		items.setDep(d);
		items.setSteacher(user.getDep().getEid());
		items = itemsService.add(items);
		if(items == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}
	
	public String update(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user=(User) session.getAttribute("user");
		Dep d=new Dep();
		d.setEid(user.getDep().getEid());
		items.setDep(d);
		items.setSteacher(user.getDep().getEid());
		items = itemsService.update(items);
		if(items == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		itemsService.delete(items);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String queryAll(){
		System.out.println("queryAll method");
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = itemsService.queryAll(pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String stud() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		student = itemsService.queryStudent();
		List<Combox> list = new ArrayList<>();
		for (Student student : student) {
			Combox combox = new Combox();
			combox.setId(String.valueOf(student.getIntenid()));
			combox.setName(student.getIntenname());
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "stud";
	}
	
	public String all(){
		System.out.println("all");
		return "all";
	}
}
