package kosta.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.ProjectBoard;
import kosta.model.ProjectDetail;
import kosta.service.Service;

public class ProjectSelectAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		Service service = Service.getInstance();
		
		ProjectBoard select = service.projectSelectService(p_id);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("detail.jsp");
		request.setAttribute("select", select);
		
		List<ProjectDetail> list = service.detailListService(p_id);
		request.setAttribute("list", list);
		
		return forward;
	}

}
