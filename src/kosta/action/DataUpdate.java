package kosta.action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.DB;
import kosta.service.Service;

public class DataUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int id = Integer.parseInt(request.getParameter("check_id"));
		String json = request.getParameter("json");
		Service service = Service.getInstance();
		DB db = new DB(json,id);
		service.updateDB(db);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("checkDetail.do?check_id="+id);
		
		
		return forward;
	}

}
