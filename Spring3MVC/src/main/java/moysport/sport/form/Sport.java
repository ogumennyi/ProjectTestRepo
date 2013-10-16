package moysport.sport.form;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SPORTS")
public class Sport {

	@Id
	@Column(name = "IDSPORT")
	@GeneratedValue
	private Integer idsport;

	@Column(name = "NAME")
	private String name;

	@Column(name = "RULES")
	private String rules;

	@Column(name = "HTTPLINK")
	private String httplink;

	public String getHttplink() {
		return httplink;
	}

	public void setHttplink(String httplink) {
		this.httplink = httplink;
	}

	public String getName() {
		return name;
	}

	public String getRules() {
		return rules;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setLastname(String rules) {
		this.rules = rules;
	}

	public Integer getId() {
		return idsport;
	}

	public void setId(Integer id) {
		this.idsport = id;
	}

}
