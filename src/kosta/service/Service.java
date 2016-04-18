package kosta.service;

import java.util.List;

import kosta.model.Dao;
import kosta.model.ProjectBoard;

public class Service {
	public static Dao dao;
	public static Service service = new Service();
	
	public static Service getInstance()
	{
		dao = Dao.getInstance();
		return service;
	}
	
	public List<ProjectBoard> projectListService()
	{
		return dao.projectList();
	}
	
	public void projectInsertService(ProjectBoard projectBoard)
	{
		dao.projectInsert(projectBoard);
	}

	public void projectSelectAction(String p_id) {
		dao.projectSelect
	}
}














