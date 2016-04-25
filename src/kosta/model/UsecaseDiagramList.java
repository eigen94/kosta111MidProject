package kosta.model;

import java.io.Serializable;
import java.util.List;

public class UsecaseDiagramList implements Serializable {
	private List<UsecaseDiagram> list;

	public List<UsecaseDiagram> getList() {
		return list;
	}

	public void setList(List<UsecaseDiagram> list) {
		this.list = list;
	}
	
}
