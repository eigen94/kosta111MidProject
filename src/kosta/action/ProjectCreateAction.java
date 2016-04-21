package kosta.action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.ProjectBoard;
import kosta.service.Service;

public class ProjectCreateAction implements Action {
	public ProjectCreateAction() {}
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String p_name = request.getParameter("p_name");
		String p_start = request.getParameter("p_start");
		String p_end = request.getParameter("p_end");
		String p_memo = request.getParameter("p_memo");
		ProjectBoard project = new ProjectBoard(p_name, p_start, p_end, p_memo);
		
		Service service = Service.getInstance();
		
		service.projectInsertService(project);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("projectList.do");
		
		return forward;
		
	}

}
















