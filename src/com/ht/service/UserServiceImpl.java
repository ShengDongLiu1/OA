package com.ht.service;

import java.util.List;

import com.ht.bean.Msg;
import com.ht.bean.User;
import com.ht.common.Pager;
import com.ht.dao.UserDao;

public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User add(User t) {
		return null;
	}

	@Override
	public User query(User t) {
		return userDao.query(t);
	}

	@Override
	public User update(User t) {
		return userDao.update(t);
	}

	@Override
	public void delete(User t) {
		userDao.delete(t);
	}

	@Override
	public Pager<User> queryAll(Pager<User> pager) {
		return userDao.queryAll(pager);
	}

	@Override
	public Object count() {
		return null;
	}
	@Override
	public User updatePwd(String name, String pwd) {
		return userDao.updatePwd(name, pwd);
	}

	@Override
	public List<Msg> queryAllMsg() {
		return userDao.queryAllMsg();
	}

}
