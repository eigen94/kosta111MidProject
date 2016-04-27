package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kosta.login.Member;
import kosta.login.MemberService;

public class memberNameOrEmailSearch implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String searchKey = request.getParameter("searchKey");
		List<Member> list = new ArrayList<Member>();
		MemberService service = MemberService.getInsetance();
		if(searchKey!=null)
		{
			list = service.memberNameOrEmailSearch(searchKey);
		}
		
		List<JSONObject> sendList = new ArrayList<JSONObject>();
		for(int i=0; i<list.size(); i++){
			JSONObject obj = new JSONObject();
			obj.put("m_id", list.get(i).getM_id());
			obj.put("m_name", list.get(i).getM_name());
			obj.put("m_email", list.get(i).getM_email());
			sendList.add(obj);
		}
		System.out.println(sendList);
		request.setAttribute("out", sendList);
		
		
		ActionForward action = new ActionForward();
		action.setRedirect(false);
		action.setPath("out.jsp");
		
		return action;
	}

}
