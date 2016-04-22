package kosta.model;

import java.io.Serializable;

public class ProjectDetail implements Serializable{
	int check_id;
	String check_name;
	int check_projectId;
	String check_start;
	String check_end;
	int check_manager;
	int check_sign;
	int check_type;
	String check_content;
	
	
	public ProjectDetail() {}

	public ProjectDetail(String check_content) {
		this.check_content = check_content;
	}

	public ProjectDetail(int check_id, String check_name, int check_projectId,
			String check_start, String check_end, int check_manager,
			int check_sign, int check_type, String check_content) {
		super();
		this.check_id = check_id;
		this.check_name = check_name;
		this.check_projectId = check_projectId;
		this.check_start = check_start;
		this.check_end = check_end;
		this.check_manager = check_manager;
		this.check_sign = check_sign;
		this.check_type = check_type;
		this.check_content = check_content;
	}
	@Override
	public String toString() {
		return "ProjectDetail [check_id=" + check_id + ", check_name="
				+ check_name + ", check_projectId=" + check_projectId
				+ ", check_start=" + check_start + ", check_end=" + check_end
				+ ", check_manager=" + check_manager + ", check_sign="
				+ check_sign + ", check_type=" + check_type
				+ ", check_content=" + check_content + "]";
	}
	public int getCheck_id() {
		return check_id;
	}
	public void setCheck_id(int check_id) {
		this.check_id = check_id;
	}
	public String getCheck_name() {
		return check_name;
	}
	public void setCheck_name(String check_name) {
		this.check_name = check_name;
	}
	public int getCheck_projectId() {
		return check_projectId;
	}
	public void setCheck_projectId(int check_projectId) {
		this.check_projectId = check_projectId;
	}
	public String getCheck_start() {
		return check_start;
	}
	public void setCheck_start(String check_start) {
		this.check_start = check_start;
	}
	public String getCheck_end() {
		return check_end;
	}
	public void setCheck_end(String check_end) {
		this.check_end = check_end;
	}
	public int getCheck_manager() {
		return check_manager;
	}
	public void setCheck_manager(int check_manager) {
		this.check_manager = check_manager;
	}
	public int getCheck_sign() {
		return check_sign;
	}
	public void setCheck_sign(int check_sign) {
		this.check_sign = check_sign;
	}
	public int getCheck_type() {
		return check_type;
	}
	public void setCheck_type(int check_type) {
		this.check_type = check_type;
	}
	public String getCheck_content() {
		return check_content;
	}
	public void setCheck_content(String check_content) {
		this.check_content = check_content;
	}
	

}
