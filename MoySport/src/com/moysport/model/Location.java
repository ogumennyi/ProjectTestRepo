package com.moysport.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "LOCATIONS")
public class Location {
	@Id
	@Column(name = "IDLOCATION")
	@GeneratedValue
	private Integer idlocation;
	
	@Column(name = "NAME")
	private String name;

	@Column(name = "COUNTRY")
	private String country;
	
	@Column(name = "REGION")
	private String region;

	@Column(name = "CITY")
	private String city;	
	
	@Column(name = "DISTRICT")
	private String district;
	
	@Column(name = "STREET")
	private String street;
	
	@Column(name = "BUILDING")
	private String building;
	
	@Column(name = "ZIP")
	private String zip;
	
	@Column(name = "DESCRIPTION")
	private String description;
	
	@Column(name = "CONTACTS")
	private String contacts;
	
	@Column(name = "HTTPLINK")
	private String httplink;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "CHECKIN")
	private Integer checkin;
	
	@Column(name = "IDCREATEDBY")
	private Integer idcreatedby;
	
	@Column(name = "CREATIONDATE")
	private Timestamp creationdate;
	
	@Column(name = "CHANGEDATE")
	private Timestamp changedate;
	
	@Column(name = "IDCHANGEBY")
	private Integer idchangeby;
	
	@Column(name = "TAG")
	private String tag;
	
	@Column(name = "LATITUDE")
	private String latitude;
	
	@Column(name = "LONGTITUDE")
	private String longtitude;
	
	@Column(name = "PIC")
	private String pic;

	public Integer getIdlocation() {
		return idlocation;
	}

	public void setIdlocation(Integer idlocation) {
		this.idlocation = idlocation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getRegion() {
		return region;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}	
	
	public void setRegion(String region) {
		this.region = region;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getHttplink() {
		return httplink;
	}

	public void setHttplink(String httplink) {
		this.httplink = httplink;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getCheckin() {
		return checkin;
	}

	public void setCheckin(Integer checkin) {
		this.checkin = checkin;
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

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
	
}