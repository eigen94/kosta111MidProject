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
import kosta.model.CheckList;
import kosta.service.Service;

public class UseCaseListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		forward.setPath("listUseCase.jsp");
		forward.setRedirect(false);
		
		int check_id = Integer.parseInt(request.getParameter("check_id"));
		System.out.println(check_id);
		Service service = Service.getInstance();
		
		CheckList checkList = service.useCaseListService(check_id);
		List<JSONObject> jsonList = new ArrayList<JSONObject>();
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObj=null;
			try {
				jsonObj = (JSONObject)parser.parse(checkList.getCheck_content());
//				jsonList.add(jsonObj);
			} catch (Exception e) {			
				e.printStackTrace();
			}
		System.out.println(jsonList);
		request.setAttribute("jsonObj", jsonObj);
		
		return forward;
	}

}
