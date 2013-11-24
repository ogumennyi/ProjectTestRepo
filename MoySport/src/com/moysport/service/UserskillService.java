package com.moysport.service;

import java.util.List;

import com.moysport.model.Userskill;

public interface UserskillService {

	public void addUserskill(Userskill userskill);

	public List<Userskill> listUserskill();

	public void removeUserskill(Integer id);

}
