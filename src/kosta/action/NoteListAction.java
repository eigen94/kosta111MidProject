package kosta.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.model.ListModel;
import kosta.model.Note;
import kosta.service.Service;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class NoteListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		forward.setPath("noteStorage.jsp");
		forward.setRedirect(false);
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int requestPage = Integer.parseInt(pageNum);
//		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		int id = (Integer)session.getAttribute("m_id");
		System.out.println(session.getAttribute("m_id"));
//		String id = session.getAttribute("m_id");
		int receive  = 0;
		
//		if(id != null){
//			receive = Integer.parseInt(id);
//		}
		receive = id;
		Service service = Service.getInstance();
		ListModel noteList = service.noteListService(receive, requestPage, request);
		request.setAttribute("noteList", noteList);
		
		return forward;
	}
		
}
