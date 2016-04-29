package kosta.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kosta.model.DB;
import kosta.model.Dao;
import kosta.model.Messenger;
import kosta.model.ListModel;
import kosta.model.Note;
import kosta.model.ProjectBoard;
import kosta.model.ProjectDetail;
import kosta.model.Search;

public class Service {
	public static Dao dao;
	public static Service service = new Service();
	public static final int PAGE_SIZE = 3;
	
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

	public List<String> umlListService(int check_id) {
		
		return dao.umlList(check_id);
	}

	public void useCaseInsertService(ProjectDetail json) {
		dao.useCaseInsert(json);
		
	}

	public void usecaseDiagramService(ProjectDetail json) {
		dao.usecaseDiagram(json);
		
	}

	public String usecaseDiagramListService(int check_id) {
		return dao.usecaseDiagramList(check_id);
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

	public int messengerInsert(int sender, int projectId, String msg) {
		return dao.messengerInsert(sender, projectId, msg);
	}
	
	public List<Messenger> loadMessege(Messenger Messenger) {
		return dao.loadMessege(Messenger);
	}

	public ListModel noteListService(int receive, int requestPage, HttpServletRequest request) {
		Search search = new Search();
		//������ ����.
		HttpSession session = request.getSession();
		//������ �˻��� ���� ������ ���� 
		if(request.getParameter("temp") != null){
			session.removeAttribute("search");
		}
		if(request.getParameterValues("area") != null){
			session.setAttribute("search", search);
			search.setArea(request.getParameterValues("area"));
			search.setSearchKey("%" + request.getParameter("searchKey") + "%");
			//�˻� �� ����¡�� Ŭ�������� 
		}else if((Search)session.getAttribute("search") != null){
			search = ((Search)session.getAttribute("search"));
		}
		search.setReceive(receive);
		
		
		//�������� �� ����, ���� ������, �� ���� ��, �� ������ ��
		
		int totalCount = dao.countNote(search);
		int totalPageCount = totalCount/PAGE_SIZE;
		if(totalPageCount % PAGE_SIZE > 0){
			totalPageCount++;
		}
		
		int startPage = requestPage - (requestPage - 1) % 5;
		int endPage = startPage + 4;
		if(endPage > totalPageCount){
			endPage = totalPageCount;
		}
		
		List<Note> list = dao.noteList((requestPage - 1) * PAGE_SIZE, search);
		return new ListModel(list, requestPage, totalPageCount, startPage, endPage);
	}

	public String noteDetailService(int n_id) {
		return dao.noteDetail(n_id);
	}

	public int getMaxMsgId() {
		return dao.getMaxMsgId();
	}
	
}














