package kosta.service;

import java.util.List;

import kosta.model.Dao;
import kosta.model.ProjectBoard;
import kosta.model.ProjectDetail;

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
		projectBoard.setP_id(dao.selectMaxP_id()+1);
		dao.projectInsert(projectBoard);
	}

	public ProjectBoard projectSelectService(int p_id) {
		return dao.projectSelect(p_id);
	}
	
	public void projectUpdateService(ProjectBoard projectBoard)
	{
		dao.projectUpdate(projectBoard);
	}

	public void projectDeleteService(int p_id)
	{
		dao.projectDelete(p_id);
	}

	public int getDetailId() {
		return dao.getDetailId();
		
	}

	public void checkCreate(ProjectDetail detail) {
		dao.checkCreate(detail);
		
	}

	public List<ProjectDetail> detailListService(int id) {
		
		return dao.detailListService(id);
	}
}














