package com.moysport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "LOCATIONSPORT")
public class LocationSport {

	@Id
	@Column(name = "IDLS")
	@GeneratedValue
	private Integer idls;

	@Column(name = "IDSPORT")
	private Integer idsport;

	@Column(name = "IDLOCATION")
	private Integer idlocation;

	public Integer getIdls() {
		return idls;
	}

	public void setIdls(Integer idls) {
		this.idls = idls;
	}

	public Integer getIdsport() {
		return idsport;
	}

	public void setIdsport(Integer idsport) {
		this.idsport = idsport;
	}

	public Integer getIdlocation() {
		return idlocation;
	}

	public void setIdlocation(Integer idlocation) {
		this.idlocation = idlocation;
	}

}