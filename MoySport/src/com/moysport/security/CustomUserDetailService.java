package com.moysport.security;

import org.springframework.context.ApplicationContext;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.context.ContextLoader;
import com.moysport.model.Employee;
import com.moysport.service.EmpServiceImpl;

public class CustomUserDetailService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
		EmpServiceImpl empServiceImpl = (EmpServiceImpl) ctx.getBean("empService");
		Employee localEmp = empServiceImpl.getEmployeeByUsername(username);
		return localEmp;
	}

}
