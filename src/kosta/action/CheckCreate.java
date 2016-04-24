package kosta.action;

import java.io.UnsupportedEncodingException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.ProjectDetail;
import kosta.service.Service;

public class CheckCreate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		Service service = Service.getInstance();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int check_id = service.getDetailId()+1;
		String check_name = request.getParameter("check_name");
		int check_projectId = Integer.parseInt(request.getParameter("check_projectId"));
		String check_start = request.getParameter("check_start");
		String check_end = request.getParameter("check_end");
		int check_type = 0;/*Integer.parseInt(request.getParameter("check_type"));*/
		int check_sign = 0;
//		String check_content = request.getParameter("check_content");
		String check_content = "";
		int check_manager = 1;
		
		ProjectDetail detail = new ProjectDetail(check_content);
				new ProjectDetail(check_id,check_name,check_projectId,check_start,check_end,check_manager,check_sign,check_type,check_content);
		int re = 0;
		re = service.checkCreate(detail);
		System.out.println("re : "+re);
		System.out.println("check : "+detail);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("projectDetail.jsp?p_id="+check_projectId);
		return forward;
	}

}
