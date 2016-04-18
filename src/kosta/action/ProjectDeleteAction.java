package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.ProjectBoard;
import kosta.service.Service;

public class ProjectDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		Service service = Service.getInstance();
		
		service.projectDeleteService(p_id);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("projectList.do");
		
		return forward;
	}

}
