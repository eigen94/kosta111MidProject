package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.ProjectBoard;
import kosta.service.Service;

public class ProjectSelectAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String p_id = request.getParameter("p_id");
		System.out.println(p_id);
		Service service = Service.getInstance();
		
//		service.projectListAction(p_id);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("projectList.do");
		
		return forward;
	}

}
