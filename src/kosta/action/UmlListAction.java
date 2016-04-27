package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.service.Service;

import org.json.simple.JSONArray;
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
		System.out.println(list);		
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObj=null;
				
		JSONArray obj = null;
		JSONArray relation = null;
		List<JSONArray> objList = new ArrayList<JSONArray>();
		List<JSONArray> relationList = new ArrayList<JSONArray>();
		for(int i=0; i<list.size(); i++)
		{			
			try {
				jsonObj = (JSONObject)parser.parse(list.get(i));
				obj = (JSONArray)jsonObj.get("jsonArray");
				relation = (JSONArray)jsonObj.get("relationArray");
				objList.add(obj);
				relationList.add(relation);
				
				
			} catch (Exception e) {			
				e.printStackTrace();
			}		
		}
		//System.out.println(objArray);
		//System.out.println(relationArray);
		request.setAttribute("objList", objList);
		request.setAttribute("relationList", relationList);
		
		return forward;
	}

}
