package com.moysport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "EVENTS")
public class Events {
	
	@Id
	@Column(name = "IDEVENT")
	@GeneratedValue	
	private Integer idevent;
	
	@Column(name = "NAME")
	private Integer name;
	
	@Column(name = "IDLOCATION")
	private Integer idlocation;
	
	@Column(name = "IDCREATEDBY")
	private Integer idcreatedby;
	
	@Column(name = "IDCHANGEBY")
	private Integer idchangeby;
	
	@Column(name = "CHANGEDATE")
	private Integer changedate;
	
	@Column(name = "MARK")
	private Integer mark;
	
	@Column(name = "MARKCNT")
	private Integer markcnt;
	
	@Column(name = "IDSPORT")
	private Integer idsport;

	public Integer getIdevent() {
		return idevent;
	}

	public void setIdevent(Integer idevent) {
		this.idevent = idevent;
	}

	public Integer getName() {
		return name;
	}

	public void setName(Integer name) {
		this.name = name;
	}

	public Integer getIdlocation() {
		return idlocation;
	}

	public void setIdlocation(Integer idlocation) {
		this.idlocation = idlocation;
	}

	public Integer getIdcreatedby() {
		return idcreatedby;
	}

	public void setIdcreatedby(Integer idcreatedby) {
		this.idcreatedby = idcreatedby;
	}

	public Integer getIdchangeby() {
		return idchangeby;
	}

	public void setIdchangeby(Integer idchangeby) {
		this.idchangeby = idchangeby;
	}

	public Integer getChangedate() {
		return changedate;
	}

	public void setChangedate(Integer changedate) {
		this.changedate = changedate;
	}

	public Integer getMark() {
		return mark;
	}

	public void setMark(Integer mark) {
		this.mark = mark;
	}

	public Integer getMarkcnt() {
		return markcnt;
	}

	public void setMarkcnt(Integer markcnt) {
		this.markcnt = markcnt;
	}

	public Integer getIdsport() {
		return idsport;
	}

	public void setIdsport(Integer idsport) {
		this.idsport = idsport;
	}

}
