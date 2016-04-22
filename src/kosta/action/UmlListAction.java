package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.service.Service;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class UmlListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		forward.setPath("umlList.jsp");
		forward.setRedirect(false);
		
		Service service = Service.getInstance();
		
		List<String> list = service.umlListService();
		//System.out.println(list);
		
		List<JSONObject> jsonList = new ArrayList<JSONObject>();
		JSONParser parser = new JSONParser();
		JSONObject jsonObj=null;
		for(int i=0; i<list.size(); i++)
		{			
			try {
				jsonObj = (JSONObject)parser.parse(list.get(i));
			} catch (Exception e) {			
				e.printStackTrace();
			}
			
			jsonList.add(jsonObj);
		}
		request.setAttribute("jsonList", jsonList);
		
		return forward;
	}

}
