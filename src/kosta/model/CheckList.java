package kosta.model;

import java.sql.Timestamp;

public class CheckList {
	private int check_id;
	private String check_name;
	private int check_projectId;
	private Timestamp check_start;
	private Timestamp check_end;
	private int check_manager;
	private int check_sign;
	private int check_type;
	private String check_content;
	
	public CheckList() {}

	public CheckList(int check_id, String check_name, int check_projectId,
			Timestamp check_start, Timestamp check_end, int check_manager,
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

	public Timestamp getCheck_start() {
		return check_start;
	}

	public void setCheck_start(Timestamp check_start) {
		this.check_start = check_start;
	}

	public Timestamp getCheck_end() {
		return check_end;
	}

	public void setCheck_end(Timestamp check_end) {
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
