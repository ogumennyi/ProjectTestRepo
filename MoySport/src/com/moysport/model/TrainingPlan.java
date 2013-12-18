package com.moysport.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TRAININGPLAN")
public class TrainingPlan {
	@Id
	@Column(name = "IDTP")
	@GeneratedValue
	private Integer idtp;
	
	@Column(name = "IDCREATEDBY")
	private Integer idcreatedby;
	
	@Column(name = "CREATIONDATE")
	private Timestamp creationdate;
	
	@Column(name = "NAMETP")
	private String nametp;
	
	@Column(name = "DESCRIPTION")
	private String description;
	
	@Column(name = "IDSPORT")
	private Integer idsport;
	
	@Column(name = "TARGET")
	private Integer target;
	
	@Column(name = "IDLOCATION")
	private Integer idlocation;
	
	@Column(name = "DOW1")
	private Integer dow1;
	
	@Column(name = "DOW2")
	private Integer dow2;
	
	@Column(name = "DOW3")
	private Integer dow3;
	
	@Column(name = "DOW4")
	private Integer dow4;
	
	@Column(name = "DOW5")
	private Integer dow5;
	
	@Column(name = "DOW6")
	private Integer dow6;
	
	@Column(name = "DOW7")
	private Integer dow7;
	
	@Column(name = "ISPAUSE")
	private Integer ispause;
	
	@Column(name = "IMPORTEVENTS")
	private Integer importevents;
	
	@Column(name = "COPYDATA")
	private Integer copydata;
	
	@Column(name = "RATING")
	private Integer rating;
	
	@Column(name = "RATINGDATE")
	private Timestamp ratingdate;
	
	@Column(name = "IDCHANGEBY")
	private Integer idchangeby;
	
	@Column(name = "CHANGEDATE")
	private Timestamp changedate;

	public Integer getIdtp() {
		return idtp;
	}

	public void setIdtp(Integer idtp) {
		this.idtp = idtp;
	}

	public Integer getIdcreatedby() {
		return idcreatedby;
	}

	public void setIdcreatedby(Integer idcreatedby) {
		this.idcreatedby = idcreatedby;
	}

	public Timestamp getCreationdate() {
		return creationdate;
	}

	public void setCreationdate(Timestamp creationdate) {
		this.creationdate = creationdate;
	}

	public String getNametp() {
		return nametp;
	}

	public void setNametp(String nametp) {
		this.nametp = nametp;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getIdsport() {
		return idsport;
	}

	public void setIdsport(Integer idsport) {
		this.idsport = idsport;
	}

	public Integer getTarget() {
		return target;
	}

	public void setTarget(Integer target) {
		this.target = target;
	}

	public Integer getIdlocation() {
		return idlocation;
	}

	public void setIdlocation(Integer idlocation) {
		this.idlocation = idlocation;
	}

	public Integer getDow1() {
		return dow1;
	}

	public void setDow1(Integer dow1) {
		this.dow1 = dow1;
	}

	public Integer getDow2() {
		return dow2;
	}

	public void setDow2(Integer dow2) {
		this.dow2 = dow2;
	}

	public Integer getDow3() {
		return dow3;
	}

	public void setDow3(Integer dow3) {
		this.dow3 = dow3;
	}

	public Integer getDow4() {
		return dow4;
	}

	public void setDow4(Integer dow4) {
		this.dow4 = dow4;
	}

	public Integer getDow5() {
		return dow5;
	}

	public void setDow5(Integer dow5) {
		this.dow5 = dow5;
	}

	public Integer getDow6() {
		return dow6;
	}

	public void setDow6(Integer dow6) {
		this.dow6 = dow6;
	}

	public Integer getDow7() {
		return dow7;
	}

	public void setDow7(Integer dow7) {
		this.dow7 = dow7;
	}

	public Integer getIspause() {
		return ispause;
	}

	public void setIspause(Integer ispause) {
		this.ispause = ispause;
	}

	public Integer getImportevents() {
		return importevents;
	}

	public void setImportevents(Integer importevents) {
		this.importevents = importevents;
	}

	public Integer getCopydata() {
		return copydata;
	}

	public void setCopydata(Integer copydata) {
		this.copydata = copydata;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public Timestamp getRatingdate() {
		return ratingdate;
	}

	public void setRatingdate(Timestamp ratingdate) {
		this.ratingdate = ratingdate;
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
