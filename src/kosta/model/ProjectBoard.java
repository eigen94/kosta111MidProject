package kosta.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ProjectBoard implements Serializable {
	private int p_id;
	private String p_name;
	private Timestamp p_start;
	private Timestamp p_end;
	private int p_pmId;
	private String[] p_crew;
	private String p_memo;
	public ProjectBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public Timestamp getP_start() {
		return p_start;
	}
	public void setP_start(Timestamp p_start) {
		this.p_start = p_start;
	}
	public Timestamp getP_end() {
		return p_end;
	}
	public void setP_end(Timestamp p_end) {
		this.p_end = p_end;
	}
	public int getP_pmId() {
		return p_pmId;
	}
	public void setP_pmId(int p_pmId) {
		this.p_pmId = p_pmId;
	}
	public String[] getP_crew() {
		return p_crew;
	}
	public void setP_crew(String[] p_crew) {
		this.p_crew = p_crew;
	}
	public String getP_memo() {
		return p_memo;
	}
	public void setP_memo(String p_memo) {
		this.p_memo = p_memo;
	}
	
	
}

