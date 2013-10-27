package com.moysport.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
@Entity
@Table(name = "employee")
public class Employee implements UserDetails, Serializable {

	@Id
	@GeneratedValue
	private Long Id;

	@Column(name = "username", unique = true, nullable = false)
	private String username;

	@Column(name = "password")
	private String password;

	@OneToMany(fetch = FetchType.EAGER)
	@Column(name = "roles", unique = false)
	private Set<EmpRoles> roles;

	public Employee() {

	}

	public Employee(String username, String password, Set<EmpRoles> roles) {
		this.username = username;
		this.password = password;
		this.roles = roles;
	}

	public Set<EmpRoles> getRoles() {
		return roles;
	}

	public void setRoles(Set<EmpRoles> roles) {
		this.roles = roles;
	}

	public boolean isEnabled() {
		return true;
	}

	public boolean isAccountNonExpired() {
		return true;
	}

	public boolean isCredentialsNonExpired() {
		return true;
	}

	public boolean isAccountNonLocked() {
		return true;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Collection<GrantedAuthority> getAuthorities() {

		List<GrantedAuthority> l1 = new ArrayList();

		for (EmpRoles emplRole : roles) {
			l1.add(new GrantedAuthorityImpl(emplRole.getRole()));
		}
		return l1;
	}

	@Override
	public String getPassword() {
		return username;
	}

	@Override
	public String getUsername() {
		return password;
	}

}
