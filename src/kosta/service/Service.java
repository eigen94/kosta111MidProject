package kosta.service;

import java.util.List;

import kosta.model.DB;
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
		System.out.println(projectBoard.toString());
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

	public ProjectDetail selectDetail(int check_id) {
		return dao.selectDetail(check_id);
	}

	public void CheckDelete(int id) {
		dao.CheckDelete(id);
		
	}

	public void checkUpdate(ProjectDetail detail) {
		dao.CheckUpdate(detail);
		
	}

	public int getDBId() {
		
		return dao.dBId();
	}

	public List<String> dBList(int id) {
		
		return dao.dBList(id);
	}

	public void createDB(DB db) {
		dao.createDB(db);
		
	}

	public void umlInsertService(String json) {
		dao.umlInsert(json);
		
	}

	public List<String> umlListService() {
		
		return dao.umlList();
	}
	
	

	public void usecaseService(String json) {
		dao.usecaseInsert(json);
		
	}
}














