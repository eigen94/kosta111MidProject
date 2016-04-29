package kosta.imgModel;

import java.io.Serializable;
import java.util.List;

public class Image implements Serializable{
	
	private String check_urlId;
	private String check_textArea;
	private List<String> list;
	
	private int check_id;
	private String check_content;
	
	public Image(){}
	public Image(String check_urlId, String check_textArea, List<String> list, int check_id, String check_content) {
		super();
		this.check_urlId = check_urlId;
		this.check_textArea = check_textArea;
		this.list = list;
		this.check_id = check_id;
		this.check_content = check_content;
		
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
	public List<String> getList() {
		return list;
	}
	public void setList(List<String> list) {
		this.list = list;
	}
	public int getImgCheck_id() {
		return check_id;
	}
	public void setImgCheck_id(int check_id) {
		this.check_id = check_id;
	}
	public String getImgCheck_content() {
		return check_content;
	}
	public void setImgCheck_content(String check_content) {
		this.check_content = check_content;
	}
	@Override
	public String toString() {
		return "Image [check_urlId=" + check_urlId + ", check_textArea="
				+ check_textArea + ", list=" + list + ", imgCheck_id="
				+ check_id + ", imgCheck_content=" + check_content + "]";
	}

	

}
