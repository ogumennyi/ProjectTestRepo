package com.moysport.service;

import java.util.Map;

import com.moysport.dao.EmployeeDAO;
import com.moysport.model.Employee;

public class EmpServiceImpl {

	public Map<String,Employee> empList;
	
	
	private EmployeeDAO employeeDAO;
	
	
	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	public Employee getEmployeeByUsername(String username) {
		
		return employeeDAO.findSampleByCity(username);
	}
	
	
}
