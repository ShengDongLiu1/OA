package com.ht.service;

import java.util.List;

import com.ht.bean.Computer;
import com.ht.bean.Student;
import com.ht.common.Pager;
import com.ht.dao.ComputerDao;

public class ComputerServiceImpl implements ComputerService {
	
	private ComputerDao computerDao;

	public void setComputerDao(ComputerDao computerDao) {
		this.computerDao = computerDao;
	}

	@Override
	public Computer add(Computer t) {
		return computerDao.add(t);
	}
	
	@Override
	public Computer query(Computer t) {
		return computerDao.query(t);
	}

	@Override
	public Computer update(Computer t) {
		System.out.println("service"+t.getComid());
		return computerDao.update(t);
	}

	@Override
	public void delete(Computer t) {
		computerDao.delete(t);
	}

	@Override
	public Pager<Computer> queryAll(Pager<Computer> t) {
		return computerDao.queryAll(t);
	}

	@Override
	public Object count() {
		return computerDao.count();
	}

	@Override
	public List<Student> queryStudent() {
		return computerDao.queryStudent();
	}

}
