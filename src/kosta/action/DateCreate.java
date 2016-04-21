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
		
		int check_id = Integer.parseInt(request.getParameter("check_id"));
		Service service = Service.getInstance();
		String title = request.getParameter("title");
		DB db = new DB();
		
		db.setTitle(title);
		db.setCheck_id(check_id);
		int id = service.getDBId()+1;
		for(int i=1;i<4;i++){
			db.setD_id(id);
			System.out.println(id);
			db.setd_attr(request.getParameter("attri"+i));
			db.setType(request.getParameter("type"+i));
			db.setD_key(request.getParameter("key"+i));
			
			service.createDB(db);
		}
	
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("checkDetail.do?check_id="+check_id);
		
		
		return forward;
	}

}
