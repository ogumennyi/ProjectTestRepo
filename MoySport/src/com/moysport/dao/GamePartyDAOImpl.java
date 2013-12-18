package com.moysport.dao;

import java.util.List;

import com.moysport.model.GameParty;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GamePartyDAOImpl implements GamePartyDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void addGameparties(GameParty gameparties) {
		sessionFactory.getCurrentSession().save(gameparties);
	}

	@SuppressWarnings("unchecked")
	public List<GameParty> listGameparties() {
		return sessionFactory.getCurrentSession().createQuery("from GameParty").list();
	}
	
	@SuppressWarnings("unchecked")
	public List<GameParty> listGameparties(int idgame) {
		Query query = sessionFactory.getCurrentSession().createQuery("select g from GameParty g where idgame=:idgame");
		query.setParameter("idgame",idgame);
		return query.list();
	}

	public void removeGameparties(Integer id) {
		GameParty gameparties = (GameParty) sessionFactory.getCurrentSession().load(GameParty.class, id);
		if (null != gameparties) {
			sessionFactory.getCurrentSession().delete(gameparties);
		}
	}

}
