package com.ht.service;

import com.ht.bean.Msg;
import com.ht.common.Pager;
import com.ht.dao.MsgDao;

public class MsgServiceImpl implements MsgService{

	private MsgDao msgDao;
	
	public void setMsgDao(MsgDao msgDao) {
		this.msgDao = msgDao;
	}

	@Override
	public Msg add(Msg msg) {
		return msgDao.add(msg);
	}

	@Override
	public Msg query(Msg msg) {
		return msgDao.query(msg);
	}

	@Override
	public Msg update(Msg msg) {
		return msgDao.update(msg);
	}

	@Override
	public void delete(Msg msg) {
		msgDao.delete(msg);
	}

	@Override
	public Pager<Msg> queryAll(Pager<Msg> t) {
		return msgDao.queryAll(t);
	}

	@Override
	public Object count() {
		// TODO Auto-generated method stub
		return null;
	}

}
