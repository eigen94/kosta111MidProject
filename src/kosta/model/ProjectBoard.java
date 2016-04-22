package kosta.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ProjectBoard implements Serializable {
	private int p_id;	//������Ʈ ���̵�
	private String p_name;	//������Ʈ �̸�
	private String p_start;	//������Ʈ ������
	private String p_end;	//������Ʈ ������
	private int p_pmid;	//PM�� ID
	private String p_crew;	//������Ʈ �����ο�
	private String p_memo;	//������Ʈ�� ���� �� �޸�
	
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

	@Override
	public String toString() {
		return "ProjectBoard [p_id=" + p_id + ", p_name=" + p_name
				+ ", p_start=" + p_start + ", p_end=" + p_end + ", p_pmid="
				+ p_pmid + ", p_crew=" + p_crew + ", p_memo=" + p_memo + "]";
	}
	
}




