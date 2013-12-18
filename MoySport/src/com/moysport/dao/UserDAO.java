package com.moysport.dao;

import java.util.List;

import com.moysport.model.User;

public interface UserDAO {

	public void addUser(User user);
	public List<User> listUser();
	public void removeUser(Integer id);
	public User getUser(String username);
	public User getplayer(int iduser);
	public User getplayer (String username);
	
}
