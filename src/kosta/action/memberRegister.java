package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.login.MemberService;

public class memberRegister implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		ActionForward action = new ActionForward();
		MemberService service = MemberService.getInsetance();
		int re = 0;
		re = service.insertMember(request);
		if(re>0){
			action.setPath("index.jsp");
			action.setRedirect(true);
//			out.print("<script type='text/javascript'>alert('registerOk!');location.href='loginForm.jsp';</script>");
		} else {
			action.setPath("index.jsp");
			action.setRedirect(true);
//			out.print("<script type='text/javascript'>alert('register Fail!');history.back();</script>");
			
		}
		
		return action;
	}

}
