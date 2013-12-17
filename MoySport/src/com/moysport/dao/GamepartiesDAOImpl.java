package com.moysport.dao;

import java.util.List;

import com.moysport.model.Gameparties;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GamepartiesDAOImpl implements GamepartiesDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void addGameparties(Gameparties gameparties) {
		sessionFactory.getCurrentSession().save(gameparties);
	}

	@SuppressWarnings("unchecked")
	public List<Gameparties> listGameparties() {
		return sessionFactory.getCurrentSession().createQuery("from Gameparties").list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Gameparties> listGameparties(int idgame) {
		Query query = sessionFactory.getCurrentSession().createQuery("select g from Gameparties g where idgame=:idgame");
		query.setParameter("idgame",idgame);
		return query.list();
	}

	public void removeGameparties(Integer id) {
		Gameparties gameparties = (Gameparties) sessionFactory.getCurrentSession().load(Gameparties.class, id);
		if (null != gameparties) {
			sessionFactory.getCurrentSession().delete(gameparties);
		}
	}

}
