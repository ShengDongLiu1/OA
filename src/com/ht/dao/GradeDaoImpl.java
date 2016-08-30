package com.ht.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.ht.bean.Classes;
import com.ht.bean.Grade;
import com.ht.bean.Student;
import com.ht.common.Pager;

public class GradeDaoImpl implements GradeDao {

	private SessionFactory sessionFactory;
	private Session session;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Grade add(Grade t) {
		session = sessionFactory.openSession();
		session.save(t);
		session.close();
		return t;
	}

	@Override
	public Grade query(Grade t) {
		session = sessionFactory.openSession();
		session.load(Grade.class, t);
		session.close();
		return t;
	}

	@Override
	public Grade update(Grade t) {
		session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		String hql = "update Grade g set g.score = :score where g.scoid = :scoid";
		Query query = session.createQuery(hql);
		query.setDouble("score", t.getScore());
		query.setInteger("scoid", t.getScoid());
		query.executeUpdate();
		transaction.commit();
		return t;
	}

	@Override
	public void delete(Grade t) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(t);
		transaction.commit();
		session.close();
	}

	@Override
	public Pager<Grade> queryAll(Pager<Grade> pager) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Grade");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Grade> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}

	@Override
	public Object count() {
		session = sessionFactory.openSession();
		Query q = session.createQuery("select count(t) from Grade t");
		Object obj = q.uniqueResult();
		return obj;
	}

	@Override
	public void batchSave(List<Grade> grades) {
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			for (Grade grade : grades) {
				session.save(grade);
			}
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public List<Student> batchQlery(Student student) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Student where classid = ?");
		query.setInteger(0, student.getClassid());
		@SuppressWarnings("unchecked")
		List<Student> list = query.list();
		session.close();
		return list;
	}

	@Override
	public List<Classes> classesQlery(int classid) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Classes where classid = ?");
		query.setInteger(0, classid);
		@SuppressWarnings("unchecked")
		List<Classes> list = query.list();
		session.close();
		return list;
	}

}
