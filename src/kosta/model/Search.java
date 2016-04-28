package kosta.model;

public class Search {
	private String[] area;
	private String searchKey;
	private int receive;

	public Search() {}

	public Search(String[] area, String searchKey, int receive) {
		super();
		this.area = area;
		this.searchKey = searchKey;
		this.receive = receive;
	}

	public String[] getArea() {
		return area;
	}

	public void setArea(String[] area) {
		this.area = area;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public int getReceive() {
		return receive;
	}

	public void setReceive(int receive) {
		this.receive = receive;
	}

}
