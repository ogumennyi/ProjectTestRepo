package moysport.sport.dao;

import java.util.List;

import moysport.sport.form.Sport;

public interface SportDAO {

	public void addSport(Sport sport);
	public List<Sport> listSport();
	public void removeSport(Integer id);

}
