package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import kosta.action.Action;
import kosta.action.ActionForward;
import kosta.service.Service;

public class UseCaseListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		forward.setPath("listUseCase.jsp");
		forward.setRedirect(false);
		
		Service service = Service.getInstance();
		
		List<String> list = service.useCaseListService();
		List<JSONObject> jsonList = new ArrayList<JSONObject>();
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObj=null;
		for(int i=0; i<list.size(); i++)
		{			
			try {
				jsonObj = (JSONObject)parser.parse(list.get(i));
				jsonList.add(jsonObj);
			} catch (Exception e) {			
				e.printStackTrace();
			}
		}
		System.out.println(jsonList);
		request.setAttribute("jsonList", jsonList);
		
		return forward;
	}

}
