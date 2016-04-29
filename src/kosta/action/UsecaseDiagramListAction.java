package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import kosta.service.Service;

public class UsecaseDiagramListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		int check_id = Integer.parseInt(request.getParameter("check_id"));
		ActionForward forward = new ActionForward();
		forward.setPath("outJsonString.jsp");
		forward.setRedirect(false);
		
		Service service = Service.getInstance();
		
		String list = service.usecaseDiagramListService(check_id);
		System.out.println("Q:"+list);
		
//		List<JSONObject> jsonList = new ArrayList<JSONObject>();
//		JSONParser parser = new JSONParser();
//		JSONObject jsonObj = null;
//		
//		JSONArray objArray = new JSONArray();
//
//		for(int i =0; i<list.size(); i++){
//			try {
//				jsonObj = (JSONObject)parser.parse(list.get(i));
//				System.out.println("s:"+jsonObj);
//				/*objArray=(JSONArray)jsonObj.get("jsonObj");*/
//				objArray.add(jsonObj);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		System.out.println("d:"+list);
		request.setAttribute("out",list);
		return forward;
	}

}
