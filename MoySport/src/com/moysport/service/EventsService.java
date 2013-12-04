package com.moysport.service;

import java.util.List;

import com.moysport.model.Events;

public interface EventsService {

	public void addEvents(Events Events);

	public List<Events> listEvents();

	public void removeEvents(Integer id);

}
