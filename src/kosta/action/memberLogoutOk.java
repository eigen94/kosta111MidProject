package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class memberLogoutOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		ActionForward action = new ActionForward();
		action.setPath("index.jsp");
		action.setRedirect(true);
		return action;
	}

}
