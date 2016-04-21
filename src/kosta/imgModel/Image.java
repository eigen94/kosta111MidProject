package kosta.imgModel;

import java.io.Serializable;

public class Image implements Serializable{
	
	private String check_urlId;
	private String check_textArea;
	
	public Image(){}
	public Image(String check_urlId, String check_textArea) {
		super();
		this.check_urlId = check_urlId;
		this.check_textArea = check_textArea;
	}
	public String getCheck_urlId() {
		return check_urlId;
	}
	public void setCheck_urlId(String check_urlId) {
		this.check_urlId = check_urlId;
	}
	public String getCheck_textArea() {
		return check_textArea;
	}
	public void setCheck_textArea(String check_textArea) {
		this.check_textArea = check_textArea;
	}
	
	@Override
	public String toString() {
		return "image [check_urlId=" + check_urlId + ", check_textArea="
				+ check_textArea + "]";
	}
	
	

}
