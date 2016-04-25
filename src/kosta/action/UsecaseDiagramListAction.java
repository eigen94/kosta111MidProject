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
		
		ActionForward forward = new ActionForward();
		forward.setPath("usecaseDiagramList.jsp");
		forward.setRedirect(false);
		
		Service service = Service.getInstance();
		
		List<String> list = service.usecaseDiagramListService();
		
		List<JSONObject> jsonList = new ArrayList<JSONObject>();
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = null;
		
		JSONArray objArray = null;
		JSONArray relationArray = null;
		for(int i =0; i<list.size(); i++){
			try {
				jsonObj = (JSONObject)parser.parse(list.get(i));
				objArray = (JSONArray)jsonObj.get("jsonArray");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(objArray);
		request.setAttribute("objArray",objArray);
		return forward;
	}

}
