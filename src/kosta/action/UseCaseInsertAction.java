package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.action.Action;
import kosta.action.ActionForward;
import kosta.model.ProjectDetail;
import kosta.service.Service;

public class UseCaseInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		int check_id = Integer.parseInt(request.getParameter("check_id"));
		String json = request.getParameter("json");
		System.out.print(json);
		
		Service service = Service.getInstance();
		
		String check_content = json;
		
		ProjectDetail detail = new ProjectDetail();
		
		detail.setCheck_content(check_content);
		service.useCaseInsertService(detail);
		return null;
	}

}
