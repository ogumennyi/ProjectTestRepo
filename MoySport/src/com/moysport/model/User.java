package com.moysport.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
@Entity
@Table(name = "USERS")
public class User implements UserDetails, Serializable {

	@Id
	@Column(name = "IDUSER")
	@GeneratedValue
	private Integer iduser;
	
	@Column(name = "ISBOT")
	private Integer isbot;
	
	@Column(name = "IDCREATEDBY")
    private Integer idcreatedby;
	
	@Column(name = "NICKNAME")
    private String nickname;
	
	@Column(name = "FIRSTNAME")
    private String firstname;
	
	@Column(name = "LASTNAME")
    private String lastname;
	
	@Column(name = "MIDDLENAME")
    private String middlename;
	
	@Column(name = "MPHONE")
    private String mphone;
	
	@Column(name = "email")
    private String email;
	
	@Column(name = "ISEMAILVERIFIED")
    private Integer isemailverified;
	
	@Column(name = "SOCIALNETWORKLOGIN")
    private String socialnetworklogin;
	
	@Column(name = "SOCIALNETWORKTYPE")
    private String socialnetworktype;
	
	@Column(name = "BIRTHDATE")
    private Timestamp birthdate;
	
	@Column(name = "PERFMARK")
    private Double perfmark;
	
	@Column(name = "REPMARK")
    private Double repmark;
	
	@Column(name = "POSITIVEREP")
    private Integer positiverep;
	
	@Column(name = "NEGATIVEREP")
    private Integer negativerep;
	
	@Column(name = "STATUS")
    private String status;
	
	@Column(name = "LOCALE")
    private String locale;
	
	@Column(name = "GMT")
    private String gmt;
	
	@Column(name = "PWD")
    private String pwd;
	
	@Column(name = "CREATIONDATE")
    private Timestamp creationdate;
	
	@Column(name = "CHANGEDATE")
    private Timestamp changedate;
	
	@Column(name = "IDCHANGEBY")
    private Integer idchangeby;

	public Integer getIduser() {
		return iduser;
	}

	public void setIduser(Integer iduser) {
		this.iduser = iduser;
	}

	public Integer getIsbot() {
		return isbot;
	}

	public void setIsbot(Integer isbot) {
		this.isbot = isbot;
	}

	public Integer getIdcreatedby() {
		return idcreatedby;
	}

	public void setIdcreatedby(Integer idcreatedby) {
		this.idcreatedby = idcreatedby;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getMiddlename() {
		return middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getIsemailverified() {
		return isemailverified;
	}

	public void setIsemailverified(Integer isemailverified) {
		this.isemailverified = isemailverified;
	}

	public String getSocialnetworklogin() {
		return socialnetworklogin;
	}

	public void setSocialnetworklogin(String socialnetworklogin) {
		this.socialnetworklogin = socialnetworklogin;
	}

	public String getSocialnetworktype() {
		return socialnetworktype;
	}

	public void setSocialnetworktype(String socialnetworktype) {
		this.socialnetworktype = socialnetworktype;
	}

	public Timestamp getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Timestamp birthdate) {
		this.birthdate = birthdate;
	}

	public Double getPerfmark() {
		return perfmark;
	}

	public void setPerfmark(Double perfmark) {
		this.perfmark = perfmark;
	}

	public Double getRepmark() {
		return repmark;
	}

	public void setRepmark(Double repmark) {
		this.repmark = repmark;
	}

	public Integer getPositiverep() {
		return positiverep;
	}

	public void setPositiverep(Integer positiverep) {
		this.positiverep = positiverep;
	}

	public Integer getNegativerep() {
		return negativerep;
	}

	public void setNegativerep(Integer negativerep) {
		this.negativerep = negativerep;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public String getGmt() {
		return gmt;
	}

	public void setGmt(String gmt) {
		this.gmt = gmt;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPassword() {
		return pwd;
	}

	@Override
	public String getUsername() {
		return nickname;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
