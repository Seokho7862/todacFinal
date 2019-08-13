package model;

public class disease_web {

	String title;
	String description;
	String link;
	String thumbnail;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public disease_web(String title, String description, String link, String thumbnail) {
		this.title = title;
		this.description = description;
		this.link = link;
		this.thumbnail = thumbnail;
	}
	
	public disease_web() {}
	
	public disease_web(String title, String description, String link) {
		this.title = title;
		this.description = description;
		this.link = link;
	}
	@Override
	public String toString() {
		return "disease [title=" + title + ", description=" + description + ", link=" + link + ", thumbnail="
				+ thumbnail + "]";
	}
	
	
	
	
}
