package com.moysport.model;

import org.apache.log4j.Logger;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "EVENTS")
public class Event {
	
	protected static Logger logger = Logger.getLogger("service");
	 
	@Id
	@Column(name = "IDEVENT")
	@GeneratedValue
	private Integer idevent;
	
	@Column(name = "NAME")
	private String name;

	/*@Column(name = "IDLOCATION")
	private Integer idlocation;*/
	
	/*@Column(name = "IDSPORT")
	private Integer idsport;*/

	@Column(name = "IDCREATEDBY")
	private Integer idcreatedby;
	
	@Column(name = "IDCHANGEBY")
	private Integer idchangeby;
	
	@Column(name = "CHANGEDATE")
	private Timestamp changedate;
	
	@Column(name = "MARK")
	private Integer mark;
	
	@Column(name = "MARKCNT")
	private Integer markcnt;
	
	@ManyToOne
	@JoinColumn(name = "IDLOCATION", nullable = false)
	private Location location;
	
	@ManyToOne
	@JoinColumn(name = "IDSPORT", nullable = false)
	private Sport sport;
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
    @JoinColumn(name="IDEVENT")
	private Set<EventGame> eventGame;
	
	public Set<EventGame> getEventgames() {
		return eventGame;
	}

	public void setEventgames(Set<EventGame> eventGame) {
		this.eventGame = eventGame;
	}

	public Location getLocations() {
		return location;
	}

	public void setLocations(Location location) {
		this.location = location;
	}

	public Sport getSport() {
		return sport;
	}

	public void setSport(Sport sport) {
		this.sport = sport;
	}

	public Integer getIdevent() {
		return idevent;
	}

	public void setIdevent(Integer idevent) {
		this.idevent = idevent;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/*public Integer getIdlocation() {
		return idlocation;
	}

	public void setIdlocation(Integer idlocation) {
		this.idlocation = idlocation;
	}*/

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

	public Timestamp getChangedate() {
		return changedate;
	}

	public void setChangedate(Timestamp changedate) {
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

	/*public Integer getIdsport() {
		return idsport;
	}

	public void setIdsport(Integer idsport) {
		this.idsport = idsport;
	}*/

}
