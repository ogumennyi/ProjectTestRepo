package com.moysport.service;

import java.util.List;

import com.moysport.model.User;

public interface UserService {
	
	public void addUser(User user);
	public List<User> listUser();
	public void removeUser(Integer id);
	public User getplayer(int iduser);
	public User getplayer (String username);

}
