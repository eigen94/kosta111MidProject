package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.service.Service;

public class NoteDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setPath("noteDetail.jsp");
		forward.setRedirect(false);
		
		int n_id = 0;
		String id = request.getParameter("n_id");
		if(id != null){
			n_id = Integer.parseInt(id);
		}
		Service service = Service.getInstance();
		String content = service.noteDetailService(n_id);
		request.setAttribute("content", content);
		return forward;
	}

}
