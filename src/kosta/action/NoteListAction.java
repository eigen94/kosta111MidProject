package kosta.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		int receive  = 0;
		String id = request.getParameter("id");
		
		if(id != null){
			receive = Integer.parseInt(id);
		}
		Service service = Service.getInstance();
		List<Note> noteList = service.noteListService(receive);
		System.out.println(noteList);
		request.setAttribute("noteList", noteList);
		
		return forward;
	}
		
}
