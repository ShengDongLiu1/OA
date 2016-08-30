package com.ht.dao;

import java.util.List;

import com.ht.bean.Msg;
import com.ht.bean.User;

public interface UserDao extends BaseDao<User, Integer> {
	
	public User updatePwd(String name,String pwd);

	public List<Msg> queryAllMsg();
}
