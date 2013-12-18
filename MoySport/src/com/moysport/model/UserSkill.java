package com.moysport.model;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "USERSKILL")
public class UserSkill {
	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "IDUSER")
	private Integer iduser;
	
	@Column(name = "IDSPORT")
	private Integer idsport;
	
	@Column(name = "ACTCNT")
	private Integer actcnt;
	
	@Column(name = "LASTACTDATE")
	private Timestamp lastactdate;
	
	@Column(name = "ACTRATING")
	private Double actrating;
	
	@Column(name = "ACTRATINGCNT")
	private Integer actratingcnt;
    
	@Column(name = "PERFMARK")
	private Double perfmark;
    
	@Column(name = "SELFRATING")
	private Integer selfrating;
	
	@Column(name = "CHANGEDATE")
	private Timestamp changedate;
	
	@Column(name = "IDCHANGEBY")
	private Integer idchangeby;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIduser() {
		return iduser;
	}

	public void setIduser(Integer iduser) {
		this.iduser = iduser;
	}

	public Integer getIdsport() {
		return idsport;
	}

	public void setIdsport(Integer idsport) {
		this.idsport = idsport;
	}

	public Integer getActcnt() {
		return actcnt;
	}

	public void setActcnt(Integer actcnt) {
		this.actcnt = actcnt;
	}

	public Timestamp getLastactdate() {
		return lastactdate;
	}

	public void setLastactdate(Timestamp lastactdate) {
		this.lastactdate = lastactdate;
	}

	public Double getActrating() {
		return actrating;
	}

	public void setActrating(Double actrating) {
		this.actrating = actrating;
	}

	public Integer getActratingcnt() {
		return actratingcnt;
	}

	public void setActratingcnt(Integer actratingcnt) {
		this.actratingcnt = actratingcnt;
	}

	public Double getPerfmark() {
		return perfmark;
	}

	public void setPerfmark(Double perfmark) {
		this.perfmark = perfmark;
	}

	public Integer getSelfrating() {
		return selfrating;
	}

	public void setSelfrating(Integer selfrating) {
		this.selfrating = selfrating;
	}

	public Timestamp getChangedate() {
		return changedate;
	}

	public void setChangedate(Timestamp changedate) {
		this.changedate = changedate;
	}

	public Integer getIdchangeby() {
		return idchangeby;
	}

	public void setIdchangeby(Integer idchangeby) {
		this.idchangeby = idchangeby;
	}

}
