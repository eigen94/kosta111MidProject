package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.service.Service;

public class CheckDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("check_id"));
		int c_id = Integer.parseInt(request.getParameter("check_projectid"));
		Service service = Service.getInstance();
		System.out.println(id);
		System.out.println(c_id);
		service.CheckDelete(id);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("projectDetail.jsp?p_id="+c_id);
		
		return forward;
	}

}
