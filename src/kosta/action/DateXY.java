package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.DB;
import kosta.service.Service;

public class DateXY implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		int id =  Integer.parseInt(request.getParameter("check_id"));
		String json = request.getParameter("json");
		System.out.println(json);
		DB db = new DB(json, id);
		Service service = Service.getInstance();
		service.linkDB(db);
		return null;
	}

}
