package com.ht.service;

import java.util.List;

import com.ht.bean.Msg;
import com.ht.bean.User;
import com.ht.dao.BaseDao;

public interface UserService extends BaseDao<User, Integer> {
	
	public User updatePwd(String name,String pwd);

	public List<Msg> queryAllMsg();
}
