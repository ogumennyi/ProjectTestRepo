package com.moysport.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "EVENTGAMES")
public class EventGame {
	@Id
	@Column(name = "IDGAME")
	@GeneratedValue
	private Integer idgame;
	
	//@Column(name = "IDEVENT")
	//private Integer idevent;

	@Column(name = "STARTTIME")
	private Timestamp starttime;
	
	@Column(name = "ENDTIME")
	private Timestamp endtime;
	
	@Column(name = "COMMENTS")
	private String comments;
	
	@ManyToOne
	@JoinColumn(name = "IDEVENT", nullable = false)
	private Event event;
	
	//public EventGame(Integer eventID) {
		// TODO Auto-generated constructor stub
	//	this.idevent = eventID;
	//}

	public Event getEvents() {
		return event;
	}

	public void setEvents(Event event) {
		this.event = event;
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

}
