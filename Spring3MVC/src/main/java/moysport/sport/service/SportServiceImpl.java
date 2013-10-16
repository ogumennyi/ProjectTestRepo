package moysport.sport.service;

import java.util.List;

import moysport.sport.dao.SportDAO;
import moysport.sport.form.Sport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SportServiceImpl implements SportService {

	@Autowired
	private SportDAO sportDAO;

	@Transactional
	public void addSport(Sport sport) {
		sportDAO.addSport(sport);
	}
	
	@Transactional
	public List<Sport> listSport() {
		return sportDAO.listSport();
	}

	@Transactional
	public void removeSport(Integer id) {
		sportDAO.removeSport(id);
	}

}
