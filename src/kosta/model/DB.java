package kosta.model;

import java.io.Serializable;
import java.util.List;


public class DB implements Serializable {
	int d_id;
	String title;
	String type;
	String d_attr;
	String d_key;
	int check_id;
	
	
	public int getD_id() {
		return d_id;
	}


	public void setD_id(int d_id) {
		this.d_id = d_id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getD_attr() {
		return d_attr;
	}


	public void setd_attr(String d_attr) {
		this.d_attr = d_attr;
	}


	public String getD_key() {
		return d_key;
	}


	public void setD_key(String d_key) {
		this.d_key = d_key;
	}


	public int getCheck_id() {
		return check_id;
	}


	public void setCheck_id(int check_id) {
		this.check_id = check_id;
	}


	public DB(int d_id, String title, String type, String d_attr, String d_key,
			int check_id) {
		super();
		this.d_id = d_id;
		this.title = title;
		this.type = type;
		this.d_attr = d_attr;
		this.d_key = d_key;
		this.check_id = check_id;
	}


	@Override
	public String toString() {
		return "DB [d_id=" + d_id + ", title=" + title + ", type=" + type
				+ ", d_attr=" + d_attr + ", d_key=" + d_key + ", check_id=" + check_id
				+ "]";
	}


	public DB(){}
	
}
