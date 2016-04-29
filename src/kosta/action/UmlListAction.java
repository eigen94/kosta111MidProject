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
		forward.setPath("out.jsp");
		forward.setRedirect(false);
		
		Service service = Service.getInstance();
		
		List<String> list = service.umlListService(0);
		//System.out.println(list);		
		
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
				obj = (JSONArray)jsonObj.get("jsonUmlArray");
				relation = (JSONArray)jsonObj.get("jsonRelationArray");
				objList.add(obj);
				relationList.add(relation);		
				
			} catch (Exception e) {			
				e.printStackTrace();
			}		
		}
		
		//System.out.println(objList);
		//System.out.println(relationList);
		request.setAttribute("objList", objList);
		request.setAttribute("relationList", relationList);
		request.setAttribute("out", list.get(0));
		return forward;
	}

}
