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
		
		String json = request.getParameter("json");
		System.out.println(json);
		Service service = Service.getInstance();
//		CheckList checkList = service.useCaseListService(check_id);
		JSONParser parser = new JSONParser();
		JSONObject jsonObj=null;
		try {
//			jsonObj = (JSONObject)parser.parse(checkList.getCheck_content());
		} catch (Exception e) {			
			e.printStackTrace();
		}
		request.setAttribute("jsonObj", jsonObj);
		return forward;
	}

}
