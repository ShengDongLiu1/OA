package com.ht.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.Msg;
import com.ht.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String login(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		return "login";
	}

	public String index() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		String name =  (String) session.getAttribute("password");
		if (name != null) {
			List<Msg> Msgs = new ArrayList<>();
			Msgs = userService.queryAllMsg();
			ServletActionContext.getRequest().setAttribute("Msgs", Msgs);
			return "succ";
		} else {
			return "fail";
		}
	}

}
