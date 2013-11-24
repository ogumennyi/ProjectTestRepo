package com.moysport.dao;

import java.util.List;

import com.moysport.model.Userskill;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserskillDAOImpl implements UserskillDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addUserskill(Userskill userskill) {
		sessionFactory.getCurrentSession().save(userskill);
	}

	@SuppressWarnings("unchecked")
	public List<Userskill> listUserskill() {
		return sessionFactory.getCurrentSession().createQuery("from Userskill").list();
	}

	public void removeUserskill(Integer id) {
		Userskill userskill = (Userskill) sessionFactory.getCurrentSession().load(Userskill.class, id);
		if (null != userskill) {
			sessionFactory.getCurrentSession().delete(userskill);
		}
	}

}