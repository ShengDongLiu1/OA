package com.ht.service;

import java.util.List;
import com.ht.bean.Classes;
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
	public Pager<Items> queryAll(Pager<Items> t,int items) {
		return itemsDao.queryAll(t,items);
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
	public Pager<Items> queryByName(Pager<Items> tem, String name,int id) {
		return itemsDao.queryByName(tem, name,id);
	}

	@Override
	public Pager<Items> queryByClass(Pager<Items> tem, int classid,int id) {
		return itemsDao.queryByClass(tem, classid,id);
	}

	@Override
	public Pager<Items> queryByScore(Pager<Items> tem,int begin,int end,int id) {
		return itemsDao.queryByScore(tem,begin,end,id);
	}

	@Override
	public List<Dep> queryDep() {
		return itemsDao.queryDep();
	}

	@Override
	public int maxvalue() {
		return itemsDao.maxvalue();
	}

	@Override
	public List<Classes> queryClasses() {
		return itemsDao.queryClasses();
	}

	@Override
	public List<Student> student(int c) {
		return itemsDao.student(c);
	}


}
