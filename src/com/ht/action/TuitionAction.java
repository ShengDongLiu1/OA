package com.ht.action;

import java.util.List;

import com.ht.bean.Tuition;
import com.ht.common.ControllerResult;
import com.ht.service.MoneyService;
import com.opensymphony.xwork2.ActionSupport;

public class TuitionAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	private MoneyService moneyService;
	private Tuition tuition;
	private List<Tuition> rows;
	private ControllerResult result;

	public void setMoneyService(MoneyService moneyService) {
		this.moneyService = moneyService;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public Tuition getTuition() {
		return tuition;
	}

	public void setTuition(Tuition tuition) {
		this.tuition = tuition;
	}
	

	public List<Tuition> getRows() {
		return rows;
	}


	public String update() {
		moneyService.updateTuition(tuition);
		result = ControllerResult.getSuccessRequest("修改成功");
		return SUCCESS;
	}

	public String queryAll() {
		rows = moneyService.queryAllTuition();
		return SUCCESS;
	}
	
	public String allxf() {
		return "allxf";
	}
}
