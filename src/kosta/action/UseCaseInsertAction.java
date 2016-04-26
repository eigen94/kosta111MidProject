package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.action.Action;
import kosta.action.ActionForward;
import kosta.service.Service;

public class UseCaseInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String json = request.getParameter("json");
		System.out.print(json);
		
		Service service = Service.getInstance();
		
		String check_content = json;
		
		service.useCaseInsertService(check_content);
		return null;
	}

}
