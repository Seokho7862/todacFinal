package model;

public class disease_db {

	String disease_name;
	String subject;

	public String getDisease_name() {
		return disease_name;
	}

	public void setDisease_name(String disease_name) {
		this.disease_name = disease_name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public disease_db(String disease_name, String subject) {
		this.disease_name = disease_name;
		this.subject = subject;
	}

	public disease_db() {
	}

	@Override
	public String toString() {
		return "disease_db [disease_name=" + disease_name + ", subject=" + subject + "]";
	}

}
