package com.moysport.dao;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.moysport.model.Employee;

public class EmployeeDAO {

	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@SuppressWarnings("unchecked")
	public Employee findSampleByCity(String username) {
		List<Employee> results = hibernateTemplate.find("from Employee" + " where username = ?", new Object[] { username });
		return results.size() > 0 ? (Employee) results.get(0) : null;
	}

}
