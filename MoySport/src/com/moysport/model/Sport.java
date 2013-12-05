package com.moysport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SPORTS")
public class Sport {

	@Id
	@Column(name = "IDSPORT")
	@GeneratedValue
	private Integer idsport;

	@Column(name = "NAME")
	private String name;

	@Column(name = "RULES")
	private String rules;

	@Column(name = "HTTPLINK")
	private String httplink;

	public Integer getIdsport() {
		return idsport;
	}

	public void setIdsport(Integer idsport) {
		this.idsport = idsport;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRules() {
		return rules;
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	public String getHttplink() {
		return httplink;
	}

	public void setHttplink(String httplink) {
		this.httplink = httplink;
	}

}
