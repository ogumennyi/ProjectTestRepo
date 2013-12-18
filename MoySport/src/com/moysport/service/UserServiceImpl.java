package com.moysport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import com.moysport.dao.UserDAO;
import com.moysport.model.User;

public class UserServiceImpl implements UserService, UserDetailsService {

	@Autowired
	private UserDAO userDAO;

	@Transactional
	public void addUser(User user) {
		userDAO.addUser(user);
	}

	@Transactional
	public List<User> listUser() {
		return userDAO.listUser();
	}

	@Transactional
	public void removeUser(Integer id) {
		userDAO.removeUser(id);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return userDAO.getUser(username);
	}
	
	@Transactional
	public User getplayer(int iduser) throws UsernameNotFoundException {
		return userDAO.getplayer(iduser);
	}
	
	public User getplayer(String username){
		
		return userDAO.getplayer(username);
	}
	
}
