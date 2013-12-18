package com.moysport.dao;

import java.util.List;

import com.moysport.model.UserSkill;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserSkillDAOImpl implements UserSkillDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addUserskill(UserSkill userskill) {
		sessionFactory.getCurrentSession().save(userskill);
	}

	@SuppressWarnings("unchecked")
	public List<UserSkill> listUserskill() {
		return sessionFactory.getCurrentSession().createQuery("from UserSkill").list();
	}

	public void removeUserskill(Integer id) {
		UserSkill userskill = (UserSkill) sessionFactory.getCurrentSession().load(UserSkill.class, id);
		if (null != userskill) {
			sessionFactory.getCurrentSession().delete(userskill);
		}
	}

}