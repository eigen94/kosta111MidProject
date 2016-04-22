package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import kosta.imageAction.ImgActionForward;
import kosta.imgService.ImageService;
import kosta.model.DB;
import kosta.model.DBList;
import kosta.service.Service;

public class Detailview implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("check_id"));
		
		Service service = Service.getInstance();
		List<String> list = service.dBList(id);
		System.out.println("------");
		System.out.println(list);
		JSONParser parser = new JSONParser();
		JSONObject jsonObj= null;
		List<JSONObject> jsonList = new ArrayList<JSONObject>();
		for(int i=0; i<list.size(); i++){
		try {
			jsonObj = (JSONObject)parser.parse(list.get(i));
		} catch (Exception e) {			
			e.printStackTrace();
		}
			jsonList.add(jsonObj);
		}
		
		System.out.println(jsonList);
		request.setAttribute("jsonList", jsonList);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("data.jsp?check_id="+id);

		return forward;
	}

}
