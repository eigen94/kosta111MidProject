package kosta.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ProjectBoard implements Serializable {
	private int p_id;	//프로젝트 아이디
	private String p_name;	//프로젝트 이름
	private String p_start;	//프로젝트 시작일
	private String p_end;	//프로젝트 종료일
	private int p_pmid;	//PM의 ID
	private String p_crew;	//프로젝트 참여인원
	private String p_memo;	//프로젝트에 관한 상세 메모
	
	public ProjectBoard() {}

	public ProjectBoard(int p_id, String p_name, String p_start, String p_end,
			int p_pmid, String p_crew, String p_memo) {
		super();
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_start = p_start;
		this.p_end = p_end;
		this.p_pmid = p_pmid;
		this.p_crew = p_crew;
		this.p_memo = p_memo;
	}
	
	public ProjectBoard(String p_name, String p_start, String p_end,
			String p_memo) {
		super();
		this.p_name = p_name;
		this.p_start = p_start;
		this.p_end = p_end;
		this.p_memo = p_memo;
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

	public String getP_start() {
		return p_start;
	}

	public void setP_start(String p_start) {
		this.p_start = p_start;
	}

	public String getP_end() {
		return p_end;
	}

	public void setP_end(String p_end) {
		this.p_end = p_end;
	}

	public int getP_pmid() {
		return p_pmid;
	}

	public void setP_pmid(int p_pmid) {
		this.p_pmid = p_pmid;
	}

	public String getP_crew() {
		return p_crew;
	}

	public void setP_crew(String p_crew) {
		this.p_crew = p_crew;
	}

	public String getP_memo() {
		return p_memo;
	}

	public void setP_memo(String p_memo) {
		this.p_memo = p_memo;
	}
}




