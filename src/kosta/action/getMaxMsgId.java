package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kosta.service.Service;

public class getMaxMsgId implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		Service service = Service.getInstance();
		int result = service.getMaxMsgId();
		
		List<JSONObject> list = new ArrayList<JSONObject>();
		JSONObject obj = new JSONObject();
		obj.put("maxId", result);
		list.add(obj);
		ActionForward forward = new ActionForward();
		
		forward.setPath("out.jsp");
		forward.setRedirect(false);
		request.setAttribute("out", list);
		
		return forward;
	}

}
