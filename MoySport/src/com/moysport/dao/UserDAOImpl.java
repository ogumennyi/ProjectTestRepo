package com.moysport.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.moysport.dao.UserDAO;
import com.moysport.model.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	public void addUser(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@SuppressWarnings("unchecked")
	public List<User> listUser() {
		return sessionFactory.getCurrentSession().createQuery("from User").list();
	}

	public void removeUser(Integer id) {
		User user = (User) sessionFactory.getCurrentSession().load(User.class, id);
		if (null != user) {
			sessionFactory.getCurrentSession().delete(user);
		}	
	}
	
	@SuppressWarnings("unchecked")
	public User getUser(String username) {
		List<User> results = hibernateTemplate.find("from User where nickname = ?", new Object[] { username });
		return results.size() > 0 ? (User) results.get(0) : null;
	}
	
	@SuppressWarnings("unchecked")
	public User getplayer(int iduser) {
		Query query = sessionFactory.getCurrentSession().createQuery("from User where iduser=:iduser");
		query.setParameter("iduser",iduser);
		List<User> userslist = query.list();
		return userslist.size() > 0 ? (User) userslist.get(0) : null;
	}
	
	@SuppressWarnings("unchecked")
	public User getplayer(String nickname){
		Query query = sessionFactory.getCurrentSession().createQuery("from User where nickname=:nickname");
		query.setParameter("nickname",nickname);
		List<User> userslist = query.list();
		return userslist.size() > 0 ? (User) userslist.get(0) : null;
		
	}
}
