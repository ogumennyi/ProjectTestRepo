package moysport.sport.dao;

import java.util.List;

import moysport.sport.form.Sport;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SportDAOImpl implements SportDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addSport(Sport sport) {
		sessionFactory.getCurrentSession().save(sport);
	}
	
	@SuppressWarnings("unchecked")
	public List<Sport> listSport() {
		return sessionFactory.getCurrentSession().createQuery("from Sport")
				.list();
	}

	public void removeSport(Integer id) {
		Sport sport = (Sport) sessionFactory.getCurrentSession().load(
				Sport.class, id);
		if (null != sport) {
			sessionFactory.getCurrentSession().delete(sport);
		}
	}

}
