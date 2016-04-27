package kosta.service;

import java.util.List;

import kosta.model.DB;
import kosta.model.Dao;
import kosta.model.Note;
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
		//System.out.println(projectBoard.toString());
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

	public int checkCreate(ProjectDetail detail) {
		return dao.checkCreate(detail);
		
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

	public List<DB> dBList(int id) {
		
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

	public void useCaseInsertService(String json) {
		dao.useCaseInsert(json);
		
	}

	public void usecaseDiagramService(String json) {
		dao.usecaseDiagram(json);
		
	}

	public List<String> usecaseDiagramListService() {
		return dao.usecaseDiagramList();
	}

	public void updateDB(DB db) {
		dao.updateDB(db);
		
	}

	public void linkDB(DB db) {
		dao.linkDB(db);
	}
	
	public int noteInsertService(Note note){
		return dao.insertNote(note);
	}
	
	
	public List<Note> noteSelectService(int n_id){
		return dao.selectNote(n_id);
	}

	public List<String> searchIdService(String id) {
		return dao.searchId(id);
	}

	public static int getEmailService(String receive) {
		return dao.getEmail(receive);
	}
	
}














