package com.moysport.model;

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
import javax.persistence.Transient;

@Entity
@Table(name = "EVENTGAMES")
public class EventGame {
	@Id
	@Column(name = "IDGAME")
	@GeneratedValue
	private Integer idgame;
	
	/*@Column(name = "IDEVENT")
	private Integer idevent;*/
	
	@Column(name = "STARTTIME")
	private Timestamp starttime;
	
	@Column(name = "ENDTIME")
	private Timestamp endtime;
	
	@Column(name = "COMMENTS")
	private String comments;
	
	@Transient
	private int gamePartiesCount;

	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    @JoinColumn(name="IDGAME")
	private Set<GameParty> gameparties;

	@ManyToOne
	@JoinColumn(name = "IDEVENT", nullable = false)
	private Event events;
	
	public Set<GameParty> getGameparties() {
		return gameparties;
	}

	public void setGameparties(Set<GameParty> gameparties) {
		this.gameparties = gameparties;
	}
	
	public Event getEvents() {
		return events;
	}

	public void setEvents(Event events) {
		this.events = events;
	}

	public Integer getIdgame() {
		return idgame;
	}

	public void setIdgame(Integer idgame) {
		this.idgame = idgame;
	}

	/*public Integer getIdevent() {
		return idevent;
	}

	public void setIdevent(Integer idevent) {
		this.idevent = idevent;
	}*/

	public Timestamp getStarttime() {
		return starttime;
	}

	public void setStarttime(Timestamp starttime) {
		this.starttime = starttime;
	}

	public Timestamp getEndtime() {
		return endtime;
	}

	public void setEndtime(Timestamp endtime) {
		this.endtime = endtime;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public int getGamePartiesCount() {
		return gamePartiesCount;
	}

	public void setGamePartiesCount(int gamePartiesCount) {
		this.gamePartiesCount = gamePartiesCount;
	}
	
}
