package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Dep;
import com.ht.bean.Department;
import com.ht.bean.Expend;
import com.ht.bean.Pays;
import com.ht.bean.User;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.common.Yglb;
import com.ht.service.DepService;
import com.ht.service.PaysService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author 
 * 
 */
public class PaysAction extends ActionSupport{
	
	private static final long serialVersionUID = -8744483513745931197L;
	private ControllerResult result;
	private PaysService paysService;
	private Pager<Pays> pager;
	private Pays pays;
	private List<Pays> rows;
	private long total;
	private int page;
	private List<Dep> deps;
	private String id;
	private String name;
	private String gz;
	private DepService depService;
	
	private Integer[] depid;	//员工编码
	private double[] paysa;	//奖励金额
	private double[] paysb;	//惩罚金额
	private String[] payspro;	//奖惩原因
	private double[] payssta;	//基本工资
	private double[] paysc;	//补贴工资
	
	public void setDepService(DepService depService) {
		this.depService = depService;
	}

	public String getGz() {
		return gz;
	}

	public void setGz(String gz) {
		this.gz = gz;
	}

	public Integer[] getDepid() {
		return depid;
	}

	public void setDepid(Integer[] depid) {
		this.depid = depid;
	}

	public double[] getPaysa() {
		return paysa;
	}

	public void setPaysa(double[] paysa) {
		this.paysa = paysa;
	}

	public double[] getPaysb() {
		return paysb;
	}

	public void setPaysb(double[] paysb) {
		this.paysb = paysb;
	}

	public String[] getPayspro() {
		return payspro;
	}

	public void setPayspro(String[] payspro) {
		this.payspro = payspro;
	}

	public double[] getPayssta() {
		return payssta;
	}

	public void setPayssta(double[] payssta) {
		this.payssta = payssta;
	}

	public double[] getPaysc() {
		return paysc;
	}

	public void setPaysc(double[] paysc) {
		this.paysc = paysc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Dep> getDeps() {
		return deps;
	}

	public void setDeps(List<Dep> deps) {
		this.deps = deps;
	}
	
	public void setPaysService(PaysService paysService) {
		this.paysService = paysService;
	}
	
    public Pays getPays() {
		return pays;
	}

	public void setPays(Pays pays) {
		this.pays = pays;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Pays> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public String add() {
		pays.setPaysb(0 - pays.getPaysb());
		pays.setPaysd(pays.getPaysa()+pays.getPaysb()+pays.getPaysc()+pays.getPayssta());
		if(pays.getPayspro().equals("") || pays.getPayspro() == null){
			pays.setPayspro("无");
		}
		pays=paysService.add(pays);
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		
		Dep dep = depService.query(pays.getDep());
		Expend e = new Expend();
		e.setPaypro("给"+dep.getEname()+"发放工资");
		e.setPaycount(pays.getPaysd());
		e.setPtime(new Date());
		e.setPayname(user.getDep().getEname());
		
		paysService.addexpend(e);
		
		if(pays == null){
			result = ControllerResult.getFailResult("添加失败");
		}else{
			result = ControllerResult.getSuccessRequest("添加成功");
		}
		return SUCCESS;
	}
	
	public String update(){
		pays = paysService.update(pays);
		if(pays == null){
			result = ControllerResult.getFailResult("修改失败");
		}else{
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		paysService.delete(pays);
		result=ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	
	public String query(){
		paysService.query(pays);
		return SUCCESS;
	}
	
	public String queryAll(){
		HttpServletRequest req = ServletActionContext.getRequest();
		String kssj = req.getParameter("ks");
		String jssj = req.getParameter("js");
		String ygbm =req.getParameter("bm");
		String ygxm =req.getParameter("xm");
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(req.getParameter("rows"));
		pager.setPageSize(pageSize);
		if(kssj != null || jssj != null){
			pager = paysService.DateQuery(pager,kssj,jssj);
		}else if(ygbm != null){
			pager = paysService.bmQuery(pager,ygbm);
		}else if(ygxm != null){
			pager = paysService.NameQuery(pager,ygxm);
		}else{
			pager = paysService.queryAll(pager);
		}
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String xzBm() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		List<Department> bm= paysService.queryBm();
		List<Combox> list  = new ArrayList<>();
		for (Department bms : bm) {
			int did = bms.getDid();
			String dname = bms.getDname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(did));
			combox.setName(dname);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "tjls";
	}
	
	public String tjls() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		String did = req.getParameter("did");
		deps = paysService.queryDep(did);
		List<Combox> list  = new ArrayList<>();
		for (Dep dep : deps) {
			int eid = dep.getEid();
			String ename = dep.getEname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(eid));
			combox.setName(ename);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "tjls";
	}
	
	public String pL(){
		List<Yglb> depList  = new ArrayList<>();
        String[] idStrArray = id.split(",");
        String[] nameStrArray = name.split(",");
        String[] gzStrArray = gz.split(",");
        for (int i = 0; i < idStrArray.length; i++) {
        	Yglb yglb = new Yglb();
        	yglb.setId(idStrArray[i]);
        	yglb.setName(nameStrArray[i]);
        	yglb.setGz(gzStrArray[i]);
			depList.add(yglb);
        }
        ServletActionContext.getRequest().setAttribute("depList", depList);
        return "pl";
	}
	
	public String BatchAdd(){
		String name = "";
		List<Pays> payList = new ArrayList<>();
		String time = pays.getPaytime();
		for (int i = 0; i < depid.length; i++) {
			Pays pays = new Pays();
			Dep dep = new Dep();
			dep.setEid(depid[i]);
			dep = depService.query(dep);
			if(i+1 == depid.length){
				name += dep.getEname();
			}else{
				name += dep.getEname()+"、";	
			}
			if(payspro[i].equals("") || payspro[i] == null){
				pays.setPayspro("无");
			}else{
				pays.setPayspro(payspro[i]);
			}
			pays.setDep(dep);
			pays.setPaysa(paysa[i]);
			pays.setPaysb(0 - paysb[i]);
			pays.setPaysc(paysc[i]);
			pays.setPayssta(dep.getBasepay());
			pays.setPaysd(pays.getPaysa()+pays.getPaysb()+pays.getPaysc()+pays.getPayssta());
			pays.setPaytime(time);
			payList.add(pays);
		}
		paysService.BatchAdd(payList,name);
		result = ControllerResult.getSuccessRequest("工资已发放！");
		return SUCCESS;
	}
	
	public String all(){
		return "all";
	}
	
	public String jbgz() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		int eid = Integer.valueOf(req.getParameter("eid"));
		deps = paysService.queryDepGz(eid);
		String gz = deps.get(0).getBasepay()+"";
		List<Combox> list  = new ArrayList<>();
		Combox combox = new Combox();
		combox.setId(gz);
		combox.setName(gz);
		list.add(combox);
		out.write(JSON.toJSONString(list));
		out.close();
		return "tjls";
	}
}
