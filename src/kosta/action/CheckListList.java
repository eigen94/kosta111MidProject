package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
		List<JSONObject> sendList = new ArrayList<JSONObject>();
		for(int i=0; i<list.size(); i++){
			JSONObject obj = new JSONObject();
			obj.put("check_id", list.get(i).getCheck_id());
			obj.put("check_name", list.get(i).getCheck_name());
			obj.put("check_start", list.get(i).getCheck_start());
			obj.put("check_end", list.get(i).getCheck_end());
			obj.put("check_manager", list.get(i).getCheck_manager());
			obj.put("check_type", list.get(i).getCheck_type());
			obj.put("check_content", list.get(i).getCheck_content());
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
