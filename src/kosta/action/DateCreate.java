package kosta.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.DB;
import kosta.service.Service;

public class DateCreate implements Action {

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
		int d_id = service.getDBId();
		System.out.println(json);
		System.out.println(d_id);
		DB db = new DB(json,id);
		service.createDB(db);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("checkDetail.do?check_id="+id);
		
		
		return forward;
	}

}