package com.moysport.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TRAININGWEEK")
public class TrainingWeek {
	@Id
	@Column(name = "IDTW")
	@GeneratedValue
	private Integer idtw;
	
	@Column(name = "IDTP")
	private Integer idtp;
	
	@Column(name = "IDCREATEDBY")
	private Integer idcreatedby;
	
	@Column(name = "CREATIONDATE")
	private Timestamp creationdate;		
	
	@Column(name = "WEEKNUM")
	private Integer weeknum;
	
	@Column(name = "WEEKDBEGIN")
	private Timestamp weekdbegin;	
	
	@Column(name = "WEEKDEND")
	private Timestamp weekdend;	
	
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
		
	@Column(name = "IDCHANGEBY")
	private Integer idchangeby;
	
	@Column(name = "CHANGEDATE")
	private Timestamp changedate;

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

	public Integer getWeeknum() {
		return weeknum;
	}

	public void setWeeknum(Integer weeknum) {
		this.weeknum = weeknum;
	}

	public Timestamp getWeekdbegin() {
		return weekdbegin;
	}

	public void setWeekdbegin(Timestamp weekdbegin) {
		this.weekdbegin = weekdbegin;
	}

	public Timestamp getWeekdend() {
		return weekdend;
	}

	public void setWeekdend(Timestamp weekdend) {
		this.weekdend = weekdend;
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