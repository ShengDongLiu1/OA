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
		String hql = "update Grade g set g.score = :score where g.scoid =:scoid";
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
		Query query = session.createQuery("from Grade order by score desc");
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
		try {
			for (Grade grade : grades) {
				session.save(grade);
			}
		} catch (Exception e) {
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
	public Pager<Grade> queryByName(Pager<Grade> pager,String name) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Grade where stuid in (select intenid from Student stu where stu.intenname like '%"+name+"%' )");
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
	public Pager<Grade> queryByCourse(Pager<Grade> pager, String courseName) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Grade g where g.sconame like '%"+courseName+"%'");
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
	public List<Classes> queryClasses() {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Classes");
		@SuppressWarnings("unchecked")
		List<Classes> classes = query.list();
		session.close();
		return classes;
	}

	@Override
	public Pager<Grade> queryByClass(Pager<Grade> pager, int classID) {
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Grade where stuid in (select intenid from Student stu where stu.classes.classid =:classid ) order by score desc");
		query.setInteger("classid", classID);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Grade> list = query.list();
		pager.setRows(list);
		pager.setTotal((long) count());
		session.close();
		return pager;
	}
}
