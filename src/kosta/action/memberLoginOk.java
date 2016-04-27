package kosta.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.login.Member;
import kosta.login.MemberService;
import kosta.model.ProjectBoard;
import kosta.service.Service;

public class memberLoginOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionForward action = new ActionForward();
		
		HttpSession session = request.getSession();
//	    request.setCharacterEncoding("utf-8");
	    
	    String m_email = request.getParameter("m_email");
	    String m_pwd = request.getParameter("m_pwd");
	    Member member = new Member();
	    
    	MemberService service = MemberService.getInsetance();
    	member = service.loginMemberService(m_email, m_pwd);
    	if(member != null){
    		Service pService = Service.getInstance();
    		List<ProjectBoard> list = pService.projectListService();
    		request.setAttribute("list", list);
    		session.setAttribute("m_id", member.getM_id());
    		session.setAttribute("m_name", member.getM_name());
    		action.setPath("main.jsp");
    		action.setRedirect(false);
    	}else{
    		action.setPath("index.jsp");
    		action.setRedirect(true);
    	}
		
		return action;
	}

}
