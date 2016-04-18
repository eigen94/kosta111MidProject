package kosta.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.ProjectBoard;
import kosta.service.Service;

public class ProjectListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("/projectBoard/list.jsp");
		forward.setRedirect(false);
		
		Service service = Service.getInstance();
		List<ProjectBoard> list = service.projectList();
		request.setAttribute("list", list);
		
		return forward;
	}

}
