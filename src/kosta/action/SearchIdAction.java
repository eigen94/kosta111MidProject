package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.service.Service;

public class SearchIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String search = request.getParameter("search");
		Service service = Service.getInstance();
		String id = "%" + search + "%";
		
		List<String> list = new ArrayList<String>();
		list = service.searchIdService(id);
		
		request.setAttribute("list", list);
		
		
		ActionForward action = new ActionForward();
		action.setRedirect(false);
		action.setPath("search.jsp");
		
		return action;
	}

}
