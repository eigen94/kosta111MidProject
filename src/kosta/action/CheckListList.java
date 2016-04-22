package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import kosta.model.ProjectDetail;
import kosta.service.Service;

public class CheckListList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		Service service = Service.getInstance();
		System.out.println("p_id : "+p_id);
		List<ProjectDetail> list = new ArrayList<ProjectDetail>();
		list = service.detailListService(p_id);
		
		JSONArray json = JSONArray.fromObject(list);
		System.out.println(json);
		String sendJSON = json.toString();
		
		request.setAttribute("json", sendJSON);
		
		ActionForward action = new ActionForward();
		action.setRedirect(false);
		action.setPath("");
		
		return action;
	}

}
