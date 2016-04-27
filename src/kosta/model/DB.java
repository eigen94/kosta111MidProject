package kosta.model;

import java.io.Serializable;
import java.util.List;


public class DB implements Serializable {
	String check_content;
	int check_id;

	public DB(String check_content, int check_id) {
		super();
		this.check_content = check_content;
		this.check_id = check_id;
	}




	@Override
	public String toString() {
		return "DB [check_content=" + check_content + ", check_id=" + check_id + "]";
	}




	public String getCheck_content() {
		return check_content;
	}




	public void setCheck_content(String check_content) {
		this.check_content = check_content;
	}




	public int getCheck_id() {
		return check_id;
	}




	public void setCheck_id(int check_id) {
		this.check_id = check_id;
	}




	public DB(){}
	
}
