package com.ht.service;

import java.util.List;
import com.ht.bean.Course;
import com.ht.bean.Dep;
import com.ht.bean.Items;
import com.ht.bean.Student;
import com.ht.common.Pager;
import com.ht.dao.ItemsDao;

public class ItemsServiceImp implements ItemsService {
	
	private ItemsDao itemsDao;
	
	public void setItemsDao(ItemsDao itemsDao) {
		this.itemsDao = itemsDao;
	}

	@Override
	public Items add(Items t) {
		return itemsDao.add(t);
	}

	@Override
	public Items query(Items t) {
		return itemsDao.query(t);
	}

	@Override
	public Items update(Items t) {
		return itemsDao.update(t);
	}

	@Override
	public void delete(Items t) {
		itemsDao.delete(t);
	}

	@Override
	public Pager<Items> queryAll(Pager<Items> t) {
		return itemsDao.queryAll(t);
	}

	@Override
	public Object count() {
		return itemsDao.count();
	}

	@Override
	public Pager<Items> queryByName(Pager<Items> tem, String name) {
		return itemsDao.queryByName(tem, name);
	}

	@Override
	public Pager<Items> queryByClass(Pager<Items> tem, String name) {
		return itemsDao.queryByClass(tem, name);
	}

	@Override
	public Pager<Items> queryByScore(Pager<Items> tem) {
		return itemsDao.queryByScore(tem);
	}

	@Override
	public List<Student> queryStudent() {
		return itemsDao.queryStudent();
	}

	@Override
	public List<Course> queryCourse() {
		return itemsDao.queryCourse();
	}

	@Override
	public List<Dep> queryDep() {
		return itemsDao.queryDep();
	}


}
