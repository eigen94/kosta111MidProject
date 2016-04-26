package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		List<DB> list = service.dBList(id);
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObj= null;
		List<JSONObject> jsonList = new ArrayList<JSONObject>();
		List<Integer> intlist = new ArrayList<Integer>();
		int check_id = 0;
		for(int i=0; i<list.size(); i++){
			try {
				jsonObj = (JSONObject)parser.parse(list.get(i).getCheck_content());
				check_id = list.get(i).getCheck_id();
			} catch (Exception e) {			
				e.printStackTrace();
			}
				intlist.add(check_id);
				jsonList.add(jsonObj);
		}
		request.setAttribute("jsonList", jsonList);
		request.setAttribute("idList", intlist);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("data.jsp?check_id="+id);

		return forward;
	}

}
