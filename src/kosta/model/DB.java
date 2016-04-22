package kosta.model;

import java.io.Serializable;
import java.util.List;


public class DB implements Serializable {
	String json;
	int check_id;
	
	


	public DB(String json, int check_id) {
		super();
		this.json = json;
		this.check_id = check_id;
	}




	@Override
	public String toString() {
		return "DB [json=" + json + ", check_id=" + check_id + "]";
	}




	public String getJson() {
		return json;
	}




	public void setJson(String json) {
		this.json = json;
	}




	public int getCheck_id() {
		return check_id;
	}




	public void setCheck_id(int check_id) {
		this.check_id = check_id;
	}




	public DB(){}
	
}
