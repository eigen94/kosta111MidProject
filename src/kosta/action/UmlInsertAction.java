package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.service.Service;

public class UmlInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {			
		
		ActionForward forward = new ActionForward();
		forward.setPath("umlList.do");
		forward.setRedirect(false);
				
		String json = request.getParameter("json");
		System.out.println(json);
		
		Service service = Service.getInstance();
				
		String check_content = json;
		
		service.umlInsertService(check_content);
		
		/*JSONParser parser = new JSONParser();
		JSONObject jsonObj=null;
		try {
			jsonObj = (JSONObject)parser.parse(json);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		System.out.println(jsonObj.gewt("name"));
		System.out.println(jsonObj.get("attribute"));
		System.out.println(jsonObj.get("operation"));*/
		
		
		
		return forward;
	}

}
