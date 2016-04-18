package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.ProjectBoard;
import kosta.service.Service;

public class ProjectUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		forward.setPath("projectList.do");
		forward.setRedirect(false);
		
		ProjectBoard projectBoard = new ProjectBoard();
		
		projectBoard.setP_id(Integer.parseInt(request.getParameter("p_id")));
		projectBoard.setP_name(request.getParameter("p_name"));
		projectBoard.setP_memo(request.getParameter("p_memo"));
		
		Service service = Service.getInstance();
		service.projectUpdateService(projectBoard);
		
		return forward;
	}

}
