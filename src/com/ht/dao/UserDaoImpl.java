package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Msg;
import com.ht.bean.User;
import com.ht.common.Pager;

public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public User add(User t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public User query(User t) {
		session = sessionFactory.openSession();
		String hql = "from User u where u.uname = :name";
		Query query = session.createQuery(hql);
		query.setString("name", t.getUname());
		t = (User) query.uniqueResult();
		session.close();
		return t;
	}

	@Override
	public User update(User t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(t);
		transaction.commit();
		session.close();
		return t;
	}

	@Override
	public void delete(User t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<User> queryAll(Pager<User> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from User");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<User> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;

	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from User t");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public User updatePwd(String name, String pwd) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String hql = "update User u set u.pwd = :pwd where u.uname = :name";
		Query query = session.createQuery(hql);
		query.setString("pwd", pwd);
		query.setString("name", name);
		query.executeUpdate();
		transaction.commit();
		session.close();
		return null;
	}

	@Override
	public List<Msg> queryAllMsg() {
		session = sessionFactory.openSession();
        Query query = session.createQuery("from Msg order by msgks desc");
        @SuppressWarnings("unchecked")
        List<Msg> list = query.list();
        session.close();
        return list;
	}


}
