package kosta.model;

import java.util.List;

public class DBList {
	int dl_id;
	List<DB> list;
	int d_id;
	public DBList(){}
	@Override
	public String toString() {
		return "DBList [dl_id=" + dl_id + ", list=" + list + ", d_id=" + d_id
				+ "]";
	}
	public DBList(int dl_id, List<DB> list, int d_id) {
		super();
		this.dl_id = dl_id;
		this.list = list;
		this.d_id = d_id;
	}
	
	public int getDl_id() {
		return dl_id;
	}
	public void setDl_id(int dl_id) {
		this.dl_id = dl_id;
	}
	public List<DB> getList() {
		return list;
	}
	public void setList(List<DB> list) {
		this.list = list;
	}
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	
	
}
