package com.moysport.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TRAININGS")
public class Training {
	@Id
	@Column(name = "IDT")
	@GeneratedValue
	private Integer idt;
	
	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "IDTW")
	private Integer idtw;
	
	@Column(name = "IDTP")
	private Integer idtp;
	
	@Column(name = "IDCREATEDBY")
	private String idcreatedby;	
	
	@Column(name = "CREATIONDATE")
	private Timestamp creationdate;
	
	@Column(name = "TRAINSDATE")
	private Timestamp trainsdate;	
	
	@Column(name = "TRAINSNUM")
	private String trainsnum;
	
	@Column(name = "IDLOCATION")
	private String idlocation;
	
	@Column(name = "IDPARTY")
	private Integer idparty;
	
	@Column(name = "ADDITIONALINFO")
	private Integer additionalinfo;
	
	@Column(name = "IDCHANGEBY")
	private Integer idchangeby;
	
	@Column(name = "CHANGEDATE")
	private Timestamp changedate;

	public Integer getIdt() {
		return idt;
	}

	public void setIdt(Integer idt) {
		this.idt = idt;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getIdtw() {
		return idtw;
	}

	public void setIdtw(Integer idtw) {
		this.idtw = idtw;
	}

	public Integer getIdtp() {
		return idtp;
	}

	public void setIdtp(Integer idtp) {
		this.idtp = idtp;
	}

	public String getIdcreatedby() {
		return idcreatedby;
	}

	public void setIdcreatedby(String idcreatedby) {
		this.idcreatedby = idcreatedby;
	}

	public Timestamp getCreationdate() {
		return creationdate;
	}

	public void setCreationdate(Timestamp creationdate) {
		this.creationdate = creationdate;
	}

	public Timestamp getTrainsdate() {
		return trainsdate;
	}

	public void setTrainsdate(Timestamp trainsdate) {
		this.trainsdate = trainsdate;
	}

	public String getTrainsnum() {
		return trainsnum;
	}

	public void setTrainsnum(String trainsnum) {
		this.trainsnum = trainsnum;
	}

	public String getIdlocation() {
		return idlocation;
	}

	public void setIdlocation(String idlocation) {
		this.idlocation = idlocation;
	}

	public Integer getIdparty() {
		return idparty;
	}

	public void setIdparty(Integer idparty) {
		this.idparty = idparty;
	}

	public Integer getAdditionalinfo() {
		return additionalinfo;
	}

	public void setAdditionalinfo(Integer additionalinfo) {
		this.additionalinfo = additionalinfo;
	}

	public Integer getIdchangeby() {
		return idchangeby;
	}

	public void setIdchangeby(Integer idchangeby) {
		this.idchangeby = idchangeby;
	}

	public Timestamp getChangedate() {
		return changedate;
	}

	public void setChangedate(Timestamp changedate) {
		this.changedate = changedate;
	}		

}