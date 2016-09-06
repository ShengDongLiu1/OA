package com.ht.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ht.bean.Msg;
import com.ht.bean.User;
import com.ht.common.ControllerResult;
import com.ht.common.EncryptUtil;
import com.ht.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private UserService userService;
	private ControllerResult result;
	private String oldPwd;
	private String newPwd;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setResult(ControllerResult result) {
		this.result = result;
	}

	public ControllerResult getResult() {
		return result;
	}

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(HomeAction.class);

	public String login() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		session.invalidate();
		logger.info("用户：" + user.getUname() + "  退出了系统...");
		return "login";
	}

	public String index() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		String name = (String) session.getAttribute("password");
		if (name != null) {
			List<Msg> Msgs = new ArrayList<>();
			Msgs = userService.queryAllMsg();
			ServletActionContext.getRequest().setAttribute("Msgs", Msgs);
			return "succ";
		} else {
			return "fail";
		}
	}

	public String updatePassword() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User name = (User) session.getAttribute("user");
		String oldPass = EncryptUtil.md5(oldPwd);
		String password = EncryptUtil.md5(newPwd);
		User user = new User();
		user = userService.query(name);
		if (user != null) {
			String pwd = user.getPwd();
			if(oldPass.equals(pwd)){
				userService.updatePwd(name.getUname(), password);
				result = ControllerResult.getSuccessRequest("修改密码成功!");
				logger.info("用户：" + name.getUname() + "  修改了密码...");
			} else {
				result = ControllerResult.getFailResult("原密码输入错误!");
			}
		}
		return SUCCESS;
	}

}
