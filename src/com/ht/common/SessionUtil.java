package com.ht.common;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.ht.bean.User;

public class SessionUtil {
	
	public static String getUserName(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		return user.getDep().getEname();
	}

}
