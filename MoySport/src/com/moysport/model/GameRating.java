package com.moysport.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "GAMERATINGS")
public class GameRating {
	@Id
	@Column(name = "IDGR")
	@GeneratedValue
	private Integer idgr;
	
	@Column(name = "IDGAME")
	private Integer idgame;

	@Column(name = "IDRANKEDPLAYER")
	private Integer idrankedplayer;
	
	@Column(name = "IDESTIMATEPLAYER")
	private Integer idestimateplayer;
	
	@Column(name = "ESTIMATEDATE")
	private Timestamp estimatedate;
	
	@Column(name = "ESTIMATECOMMENT")
	private String estimatecomment;

	public Integer getIdgr() {
		return idgr;
	}

	public void setIdgr(Integer idgr) {
		this.idgr = idgr;
	}

	public Integer getIdgame() {
		return idgame;
	}

	public void setIdgame(Integer idgame) {
		this.idgame = idgame;
	}

	public Integer getIdrankedplayer() {
		return idrankedplayer;
	}

	public void setIdrankedplayer(Integer idrankedplayer) {
		this.idrankedplayer = idrankedplayer;
	}

	public Integer getIdestimateplayer() {
		return idestimateplayer;
	}

	public void setIdestimateplayer(Integer idestimateplayer) {
		this.idestimateplayer = idestimateplayer;
	}

	public Timestamp getEstimatedate() {
		return estimatedate;
	}

	public void setEstimatedate(Timestamp estimatedate) {
		this.estimatedate = estimatedate;
	}

	public String getEstimatecomment() {
		return estimatecomment;
	}

	public void setEstimatecomment(String estimatecomment) {
		this.estimatecomment = estimatecomment;
	}		
		
}