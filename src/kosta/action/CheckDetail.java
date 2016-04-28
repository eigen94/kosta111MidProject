package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import kosta.model.ProjectDetail;
import kosta.service.Service;

public class CheckDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		Service service = new Service();
		int check_id = Integer.parseInt(request.getParameter("check_id"));
		System.out.println(check_id);
		ProjectDetail detail = new ProjectDetail();
		detail = service.selectDetail(check_id);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("check.jsp");
		request.setAttribute("detail", detail);
		
		return forward;
	}

}
