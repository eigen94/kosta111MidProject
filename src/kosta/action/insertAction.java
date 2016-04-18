package kosta.action;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.ProjectBoard;
import kosta.model.Dao;

public class insertAction implements Action {
	public insertAction() {
		System.out.println("인서트 액션");
	}
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		Dao dao = Dao.getInstance();
		System.out.println("인서트 액션 - 엑션포워드");
		String p_name = request.getParameter("p_name");
		String p_start = request.getParameter("p_start");
		String p_end = request.getParameter("p_end");
		String p_memo = request.getParameter("p_memo");
		ProjectBoard project = new ProjectBoard(p_name, p_start, p_end, p_memo);
		try {
			request.setCharacterEncoding("utf-8");
			int re = dao.insertProject(project);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/board/main.jsp");
		
		return forward;
		
	}

}
















