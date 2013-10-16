package moysport.sport.service;

import java.util.List;

import moysport.sport.form.Sport;

public interface SportService {
	
	public void addSport(Sport sport);
	public List<Sport> listSport();
	public void removeSport(Integer id);

}
