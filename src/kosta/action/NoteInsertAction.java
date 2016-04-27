package kosta.action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.Note;
import kosta.model.ProjectBoard;
import kosta.service.Service;

public class NoteInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		int n_sender = Integer.parseInt(request.getParameter("n_sender"));
		int n_receive = Integer.parseInt(request.getParameter("n_receive"));
		Note note = new Note(n_title, n_content, n_sender, n_receive);
		Service service = Service.getInstance();
		service.noteInsertService(note);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("NoteForm.jsp");
		
		return forward;
		
		
		
		
		
	}
	
	
	
}
