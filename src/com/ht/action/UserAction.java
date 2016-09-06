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

/**
 * @author CFL 登入检测
 */
public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 8133384344576729659L;

	private UserService userService;
	private User user;
	private String checkCode;
	private String password;
	private String newPwd;
	private String conPwd;
	private ControllerResult result;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getConPwd() {
		return conPwd;
	}

	public void setConPwd(String conPwd) {
		this.conPwd = conPwd;
	}

	public ControllerResult getResult() {
		return result;
	}

	/////////////////////////

	private static final Logger logger = LoggerFactory.getLogger(UserAction.class);

	public String getSet() {
		return "set";
	}

	public String query() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		String code = (String) session.getAttribute("checkCode");
		String password = EncryptUtil.md5(user.getPwd());
		logger.info("用户：" + user.getUname() + "  尝试登录系统...");
		if (checkCode != null && checkCode.equals(code)) {
			User users = new User();
			users = userService.query(user);
			if (users != null) {
				if (users.getPwd().equals(password)) {
					session.setAttribute("user", users);
					session.setAttribute("password", password);
					session.setAttribute("email", user.getUname());
					List<Msg> Msgs = new ArrayList<>();
					Msgs = userService.queryAllMsg();
					ServletActionContext.getRequest().setAttribute("Msgs", Msgs);
					result = ControllerResult.getSuccessRequest("正在执行登录!");
					logger.info("用户：" + user.getUname() + "  登录系统成功...");
				} else {
					result = ControllerResult.getFailResult("用户名或密码错误!");
					logger.info("用户：" + user.getUname() + "  登录系统失败,密码错误.");
				}
			} else {
				result = ControllerResult.getFailResult("用户名或密码错误!");
				logger.info("用户：" + user.getUname() + "  登录系统失败,用户名错误.");
			}
		} else {
			result = ControllerResult.getFailResult("验证码输入错误!");
		}
		return SUCCESS;
	}

}
