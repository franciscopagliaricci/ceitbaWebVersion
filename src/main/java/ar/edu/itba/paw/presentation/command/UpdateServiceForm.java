package ar.edu.itba.paw.presentation.command;


public class UpdateServiceForm {

	String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMonthsDuration() {
		return monthsDuration;
	}
	public void setMonthsDuration(String monthsDuration) {
		this.monthsDuration = monthsDuration;
	}
	String value;
	String type;
	String status;
	String monthsDuration;
	int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
